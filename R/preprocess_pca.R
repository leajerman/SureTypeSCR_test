preprocess_pca  <- function(.data,.group,features=c('x','y'))
{
	  #.data %>% 
	  #  filter(!str_detect(Name, 'cnv'))%>% 
	  #  select(individual,x,y,Name) %>% 
	  #  pivot_longer(cols=c(x,y),names_to='feature') %>% 
	  #  mutate(value=replace_na(value,0)) %>% 
	  #  pivot_wider(names_from='individual',values_from='value') %>% 
	  #  unite(feature,c(Name,feature)) %>%
	  #drop_na()  %>%
	  #  column_to_rownames(var='feature') %>%
	  #  prcomp()
	  
	  features_=setdiff(features,c('callrate'))
  
  if ('gtype' %in% features)
	    {
		        w_df=.data %>% mutate(gtype=case_when(
							            gtype == 'AA' ~ 0,
								          gtype ==  'BB' ~ 1,
								          gtype ==  'AB' ~ 0.5,
									        TRUE  ~ -1
									      ))
    }
    else w_df=.data
    
    if (length(features_)!=0)
	      {
		        c=length(unique(w_df$individual))
    output=w_df %>%
	        select(individual,Name,features_) %>% 
		    pivot_longer(cols=all_of(features_),names_to='feature')  %>%
		        filter(value!=-1 & !is.na(value)) %>%
			    group_by(Name,feature) %>%
			        mutate(n=n()) %>%
				    filter(n==c) %>%
				        select(!n)  %>%
					    pivot_wider(names_from=c('Name','feature'),values_from='value') 
				      }
      else
	        {
			    output=NULL
    }
    #select_if(~ !any(is.na(.) | .==-1))
    
    #column_to_rownames(var='individual')
    
    if ('callrate' %in% features)
	      {
		          suppl=
				        .data %>%
					      group_by(individual,gtype) %>% 
					            callrate_IV() %>% 
						          pivot_wider(names_from=gtype,values_from=Callrate) %>% 
							        mutate_at(c('AA','BB','AB','NC'),~replace_na(.,0))
							    if (!is.null(output))
								        {
										    output= output %>%
											          inner_join(suppl,by='individual')
											      }
							        else
									      output=suppl
							      }
      output=output %>% column_to_rownames(var='individual')
      nfeatures=output %>% select(starts_with(c('rs','AA','BB','AB','NC'))) %>% ncol()
        print(paste('PCA from ',nfeatures, ' features'))
        return(output)
	  #%>%
	  #prcomp() %>%
	  #as.data.frame(.$x)
}

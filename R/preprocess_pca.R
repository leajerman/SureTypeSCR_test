preprocess_pca  <- function(.data,features=c('x','y'))
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
  
  
  output=w_df %>%
    filter(!str_detect(Name, 'cnv'))%>% 
    select(individual,Name,features_) %>% 
    pivot_longer(cols=features_,names_to='feature')  %>%
    mutate(value=replace_na(value,0)) %>%
    pivot_wider(names_from=c('Name','feature'),values_from='value') 
  #column_to_rownames(var='individual')
  
  if ('callrate' %in% features)
  {
    suppl=
      .data %>%
      group_by(individual,gtype) %>% 
      callrate() %>% 
      pivot_wider(names_from=gtype,values_from=Callrate) %>% 
      mutate_at(c('AA','BB','AB','NC'),~replace_na(.,0))
    output= output %>%
      inner_join(suppl,by='individual')
  }
  
  return(output %>% column_to_rownames(var='individual'))
  #%>%
  #prcomp() %>%
  #as.data.frame(.$x)
}
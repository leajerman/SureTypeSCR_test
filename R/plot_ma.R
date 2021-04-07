plot_ma <- function(.data,norm=TRUE,smooth=FALSE,nocalls=FALSE,n=1)
{
	  if (n>1 | n<0)
		    {
			        stop('Please select n from 0 to 1.')
    
  }
  
  .d= .data %>% group_by(individual) %>% sample_frac(n)
       
    if (!nocalls)
	      {
		          
		          .d=.d %>% filter(gtype!='NC')
    }
    
    i=intersect(colnames(.data),c('m_raw','a_raw','m','a'))
      if (length(i)==0)
	        {
			    .d=.d %>% calculate_ma()
      }
      
      
      if (norm)
	        {
			    p=.d %>% 
				          ggplot(aes(x=a,y=m)) + geom_point(size=0.05,alpha=0.4) + facet_wrap(.~individual) + theme_bw()
				    }
        
        else
		  {
			      p=.d %>% 
				            ggplot(aes(x=a_raw,y=m_raw)) + geom_point(size=0.05,alpha=0.4) + facet_wrap(.~individual) + theme_bw() 
				        
				      }
        
        if (smooth)
		  {
			      p=p+geom_smooth(aes(group=gtype))
	  }
        return(p)
}

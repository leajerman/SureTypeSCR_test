plot_ma <- function(.data,norm=FALSE,smooth=TRUE)
{
  if (norm)
  {
    p=.data %>% 
      calculate_ma_IV() %>% 
      filter(gtype!='NC') %>%
      ggplot(aes(x=a,y=m)) + geom_point() + facet_grid(.~individual) + theme_bw()
  }
  
  else
  {
    p=.data %>% 
      calculate_ma_IV() %>% 
      filter(gtype!='NC') %>%
      ggplot(aes(x=a_raw,y=m_raw)) + geom_point() + facet_grid(.~individual) + theme_bw() 
    
  }
  
  if (smooth)
  {
    p=p+geom_smooth(aes(group=gtype))
  }
  return(p)
}

get_threshold <- function(.data,col='score')
{
  .data %>% 
      filter(gtype!='NC') %>%
    summarize(threshold=min(score))
  
}
callrate <- function(.data)
{
  if ((dplyr::is_grouped_df(.data) & ('gtype' %in% group_vars(.data)))) {
    grouping_vars=group_vars(.data)
    if (length(group_vars(.data))>1)
    {
      grouping_vars=group_vars(.data)[group_vars(.data)!='gtype']
      .data %>%  
        tally() %>% 
        ungroup() %>% 
        group_by_at(vars(group_vars(.data)[group_vars(.data)!='gtype'])) %>% 
        mutate(Callrate=n/sum(n),n=NULL) %>% 
        group_by_at(vars(group_vars(.data)))
    }
    else {#only one grouping variable 
      #if ((dplyr::is_grouped_df(.data) )) {
      .data %>% tally() %>% ungroup() %>% mutate(Callrate=n/sum(n),n=NULL) %>% group_by_at(vars(group_vars(.data)))
      #return(dplyr::do(.data , clrhlp(.)))
    }
    
  }
  else {
    .data %>% 
      summarize(Callrate=sum(gtype!='NC')/n())
  }
}


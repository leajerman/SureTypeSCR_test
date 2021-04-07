suretype_model <- function(.data,.individual,.sclist,rf_clf)
{
  print(.individual)
  print(.sclist)
  print(.data)
  if (.sclist=='all' | .individual %in% .sclist)
  {
    .data %>% mutate(individual=.individual) %>%
      scpredict(rf_clf,clftype='rf') %>% #1st layer
      scpredict(scTrain(create_dataobject_from_frame(.),clfname='gda'),clftype='rf-gda') %>%
      rename('rfgda_score'='rf-gda_ratio:1.0_prob',
             'rf_score'='rf_ratio:1.0_prob') %>%
      select('rfgda_score','rf_score')  %>%
      as_tibble()
  }
  else
  {
    .data %>% 
      mutate('rfgda_score'=1,'rf_score'=1) %>%
      select('rfgda_score','rf_score')  
  }
}
suretype_model <- function(.data,.individual,rf_clf, .sclist='all')
{
  #print(.individual)
  #print(.sclist)
  #print(.data)
  if (.sclist=='all' | .individual %in% .sclist)
  {
    write(paste("Processing sample",.individual,sep=' '), stdout())
    .data %>% mutate(individual=.individual) %>%
      scpredict(scload(rf_clf),clftype='rf') %>% #1st layer
      scpredict(scTrain(create_dataobject_from_frame(.),clfname='gda'),clftype='rf-gda') %>%
      rename('rfgda_score'='rf-gda_ratio:1.0_prob',
             'rf_score'='rf_ratio:1.0_prob') %>%
      select('rfgda_score','rf_score')  %>%
      as_tibble()
    #write('-------------------', stdout())
  }
  else
  {
    .data %>% 
      mutate('rfgda_score'=1,'rf_score'=1) %>%
      select('rfgda_score','rf_score')  
  }
}

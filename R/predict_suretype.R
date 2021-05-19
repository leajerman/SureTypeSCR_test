predict_suretype <- function(.data,rf_clf)
{
  .data %>%
    calculate_ma() %>%
    scpredict(rf_clf,clftype='rf') %>% #1st layer
    scpredict(scTrain(create_dataobject_from_frame(.),clfname='gda'),clftype='rf-gda') %>%
    select(!c('rf-gda_ratio:1.0_pred','rf_ratio:1.0_pred'))  %>%
    rename('rf.gda_score'='rf-gda_ratio:1.0_prob',
           'rf.score'='rf_ratio:1.0_prob',
           'gencall.score'='score'
    )
}

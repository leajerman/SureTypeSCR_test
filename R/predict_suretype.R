predict_suretype <- function(.data,rf_clf)
{
  .data %>%
    calculate_ma() %>%
    scpredict_IV(clf_rf,clftype='rf') %>% #1st layer
    scpredict_IV(scTrain(create_dataobject_from_frame(.),clfname='gda'),clftype='rf-gda') %>%
    select(!c('rf-gda_ratio:1.0_pred','rf_ratio:1.0_pred'))  %>%
    rename('rf-gda_score'='rf-gda_ratio:1.0_prob',
           'rf_score'='rf_ratio:1.0_prob',
           'gencall_score'='score'
    )
}

scpredict = function(.data,clf,clftype='rf') {
 #test_obj=create_data_object(test)
 if (dplyr::is_grouped_df(.data)) {
      return(dplyr::do(.data, scpredict(.,clf,clftype)))
 }
 test_obj=create_dataobject_from_frame(.data)
 re <- clf$predict_decorate(test_obj,clftype=clftype)
 re <- get_simpleind_df(re)
# re <- py_to_r(re)
}

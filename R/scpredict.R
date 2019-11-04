scpredict = function(clf_rf,test,clftype='rf') {
 re <- clf_rf$predict_decorate(test,clftype='rf')

 re <- py_to_r(re)


}
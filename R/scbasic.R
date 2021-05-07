#'interface to basic function in SureTypeSC 

scbasic = function(bpm,egt,samplesheet) {
  vec=c('samplesheet','manifest','cluster')[!file.exists(c(samplesheet,bpm,egt))]
  if (sum(vec)!=0) stop(paste('Cannot locate',paste(vec,collapse=',')))
  re <- scEls()$sc$basic(bpm,egt,samplesheet)
  re <- scEls()$sc$Data$create_from_frame(re)
  re <- get_simpleind_df(re)
  #re <- py_to_r(re)
}

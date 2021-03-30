#'interface to basic function in SureTypeSC 

scbasic_IV = function(bpm,egt,samplesheet) {
 re <- scEls()$sc$basic(bpm,egt,samplesheet)
 re <- scEls()$sc$Data$create_from_frame(re)
 re <- get_simpleind_df(re)
 #re <- py_to_r(re)
}

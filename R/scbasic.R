#'interface to basic function in SureTypeSC 

scbasic = function(bpm,egt,samplesheet) {
 re <- scEls()$sc$basic(bpm,egt,samplesheet)
 re <- py_to_r(re)
}

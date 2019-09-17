#'interface to basic function in SureTypeSC 

scbasic = function(gtc,bpm,egt,samplesheet,delimeter) {
 re <- scEls()$sc$basic(gtc,bpm,egt,samplesheet,delimeter)
}
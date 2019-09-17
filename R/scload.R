#'interface to load classifier in SureTypeSC 

scload = function(file) {
 clf <- scEls()$sc$loader(file)
}
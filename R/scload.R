#'interface to load classifier in SureTypeSC 

scload = function(filename) {
 clf <- scEls()$sc$loader(filename)
}
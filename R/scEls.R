#' mediate access to python modules from SureTypeSC.basic
#' @import reticulate
#' @import knitr
#' @note Returns SureTypeSC.basic
#' @examples
#' els = basic()
#' @export
scEls = function() {
  sc <- import("SureTypeSC", delay_load=TRUE, convert=FALSE)
  pd <- import("pandas",delay_load=TRUE)
  list(sc=sc, pd=pd)
}

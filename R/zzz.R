.onAttach <- function(libname, pkgname) {
  # delay load foo module (will only be loaded when accessed via $)
  packageStartupMessage("checking python library availability...")
  #path where package is installed
  pkgpathfiles=system.file(package='SureTypeSCR')
  clfpath=system.file(file='files/rf.clf',package='SureTypeSCR')
  if (clfpath=='')
  {
     zclfpath=system.file(file='files/rf.zip',package='SureTypeSCR')
     if (zclfpath=='')
     {
        stop("Pretrained classifier not found in the package directory")
     }
     else
     {
        unzip(zclfpath,exdir=pkgpathfiles)
     }
  }
  
  chk <- as.numeric(py_config()['version'])
  if (chk < 3) stop('The python environment 2. is not compatible, please use python3 environment.' ,'\n','\n',
    'The possible python versions in local computer:','\n',py_config()['python_versions'], '\n','\n',
    'you can specify certain python environment by using','\n', 'use_python("yourpath/python")','\n','\n',
    'for more details: https://rstudio.github.io/reticulate/articles/versions.html#configuration-info-1')
  chk <- try(import("SureTypeSC"))
  if (inherits(chk, "try-error")) stop("SureTypeSC not found in python environment")
  chk <- try(import("numpy"))
  if (inherits(chk, "try-error")) stop("numpy not found in python environment")
  chk <- try(import("pandas"))
  if (inherits(chk, "try-error")) stop("pandas not found in python environment")
  packageStartupMessage("done.")
  chk <- try(import("sklearn"))
  if (inherits(chk, "try-error")) stop("sklearn not found in python environment")
  chk <- try(import("IlluminaBeadArrayFiles"))
  if (inherits(chk, "try-error")) stop("IlluminaBeadArrayFiles not found in python environment")
}

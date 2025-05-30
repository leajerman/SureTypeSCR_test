.onAttach <- function(libname, pkgname) {
  # delay load foo module (will only be loaded when accessed via $)
  packageStartupMessage("checking python library availability...")
  
  #path where package is installed
  pkgpathfiles=system.file(file='files',package='SureTypeSCR')
  clfpath=system.file(file='files/rf.clf',package='SureTypeSCR')
  if (clfpath=='')
  {
     zclfpath=system.file(file='files/rf.zip',package='SureTypeSCR')
     if (zclfpath=='')
     {
        stop("Pretrained classifier not found in the package directory")
     } else {
        utils::unzip(zclfpath,exdir=pkgpathfiles)
     }
  }
  
  #chk <- as.numeric(py_config()['version'])
  #if (chk < 3) stop('The python environment 2. is not compatible, please use python3 environment.' ,'\n','\n',
  #  'The possible python versions in local computer:','\n',py_config()['python_versions'], '\n','\n',
  #  'you can specify certain python environment by using','\n', 'use_python("yourpath/python")','\n','\n',
  #  'for more details: https://rstudio.github.io/reticulate/articles/versions.html#configuration-info-1')
    
  
  
  if(virtualenv_exists('r-reticulate')) {
  use_virtualenv('r-reticulate',required=TRUE)
  } else { 
  virtualenv_create('r-reticulate')
  use_virtualenv('r-reticulate',required=TRUE)
  }
  chk <- try(import("IlluminaBeadArrayFiles"),silent=TRUE)
  if (inherits(chk, "try-error"))
  {
    packageStartupMessage('Installing supporting python package: IlluminaBeadArrayFiles')
    virtualenv_install("r-reticulate", "git+https://github.com/Illumina/BeadArrayFiles.git")
    #stop("IlluminaBeadArrayFiles not found in python environment")
  }    
  chk <- try(import("numpy"),silent=TRUE)
  if (inherits(chk, "try-error")) 
  {
    packageStartupMessage('Installing supporting python package: numpy')
    virtualenv_install("r-reticulate", "numpy")
    #stop("numpy not found in python environment")
  }
  chk <- try(import("pandas"),silent=TRUE)
  if (inherits(chk, "try-error"))
  {
    packageStartupMessage('Installing supporting python package: pandas')
    virtualenv_install("r-reticulate", "pandas")
    #stop("pandas not found in python environment")
  } 
  chk <- try(import("scikit-learn"),silent=TRUE)
  if (inherits(chk, "try-error"))
  {
    packageStartupMessage('Installing supporting python package: scikit-learn')
    virtualenv_install("r-reticulate", "scikit-learn") 
    #stop("scikit-learn not found in python environment")
  }
  chk <- try(import("SureTypeSC"),silent=TRUE)
  if (inherits(chk, "try-error")) 
  {
    packageStartupMessage('Installing supporting python package: SureTypeSC')
    virtualenv_install("r-reticulate", "SureTypeSC")
    #stop("SureTypeSC not found in python environment")
  }
  #chk <- try(import("IlluminaBeadArrayFiles"))
  #if (inherits(chk, "try-error")) stop("IlluminaBeadArrayFiles not found in python environment")
  packageStartupMessage("done.")
}

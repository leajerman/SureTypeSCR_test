configure_iaap <- function()
{
  curpath=getwd()
  packagehome=system.file(file='files',package='SureTypeSCR')
  setwd(packagehome)
  t=Sys.glob('iaap*')
  if (identical(t, character(0))) {
    write("IAAP CLI binary for idat->gtc is not configured. Please follow https://emea.support.illumina.com/downloads/iaap-genotyping-cli.html", stdout())
    invisible(readline(prompt="Press [enter] to continue and choose path of the downloaded file"))
    iaap_archive=file.choose()
    untar(iaap_archive)
  }
  
  binpath=file.path(getwd(), Sys.glob('iaap*/iaap*/iaap-cli'))
  
  if (Sys.info()["sysname"]=='Windows')
  {
    binpath=file.path(getwd(), Sys.glob('iaap*/iaap*/iaap-cli.exe'))
      
  }
  if (identical(nchar(binpath),character(0)))
    stop('Cannot locate iaap-cli. Please make sure to download a version compatible with your operating system.')
  
  setwd(curpath)
  return(binpath)
}
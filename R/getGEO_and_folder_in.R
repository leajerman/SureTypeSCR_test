getGEO_and_folder_in <- function(x,download=TRUE)
{
  metadata=data.frame()
  serverdata=getGEOSuppFiles(x,fetch_files = FALSE,makeDirectory=FALSE,filter_regex='idat.gz') 
  if (is.null(serverdata))
  {
    Sys.sleep(5)
    serverdata=getGEOSuppFiles(x,fetch_files = FALSE,makeDirectory=FALSE,filter_regex='idat.gz') 
  }
  if (!is.null(serverdata))
  {
    metadata= serverdata %>%
      separate(fname,into = c('sampleid','arrayid','position','channel'),sep='_',remove=FALSE) %>%
      mutate(outfile=str_extract(fname,'[0-9]+_R[0-9]+C[0-9]+_(Grn|Red).idat'))
    
    if (download==TRUE)
    {
      metadata %>% 
        select(arrayid) %>% as.matrix() %>% 
        map(function(y) dir.create(path=as.character(y),showWarnings=FALSE))
      metadata %>%
        select(arrayid,fname,sampleid)  %>%
        pmap(function(arrayid,fname,sampleid) getGEOSuppFiles(sampleid,fetch_files = TRUE,makeDirectory = FALSE,baseDir=arrayid,filter_regex=fname))
      #map2(fnamefunction(x)getGEOSuppFiles(x,fetch_files = TRUE,makeDirectory=TRUE,filter_regex=z))
      
      
      metadata %>% 
        select(sampleid,arrayid,fname,outfile) %>% 
        pmap(function(sampleid,arrayid,fname,outfile) gunzip(file.path(arrayid,fname),destname = file.path(arrayid,outfile),overwrite=TRUE,remove=FALSE))
    }
  }
  return(metadata)
}


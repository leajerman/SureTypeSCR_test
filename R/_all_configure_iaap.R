library(usethis)
library(SureTypeSCR)

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



a=configure_iaap()


idat_to_gtc <- function(idat_inputfolder,gtc_output,manifest,cluster)
{
  #iaap='C:\\Users/gqc954/Documents/SureTypeSCR_Installation_and_Testing/DATA/TESTING_DATA_GSE87897/iaap-cli/iaap-cli.exe'
  iaap=configure_iaap()
  dir.create(gtc_output,showWarnings = FALSE)
  #for (ar in unique(df$arrayid))
  #{
  #  print(ar)
  shell(paste(iaap,'gencall',manifest,cluster,gtc_output,'-f',idat_inputfolder,'-g','-c 0',sep=' '))  
    #HumanCytoSNP-12v2-1_hg19.bpm
    #HumanCytoSNP-12v2-1_L.egt
    #shell(paste(iaap,'gencall','HumanCytoSNP-12v2-1_hg19.bpm','HumanCytoSNP-12v2-1_L.egt',gtcfolder,'-f',ar,'-g','-c 0',sep=' '))  
}




write_samplesheet <- function(filename,
                              array_positions,
                              gtc_output,
                              manifest,
                              experiment_name='Experiment1',
                              project_name='Project1',
                              investigator_name='Investigator1')
{
  manifest_name=basename(manifest)
  header=c('[Header],,,,',
           paste0('INVESTIGATOR NAME,',investigator_name,',,,'),
           'PROJECT NAME,Test1,,,',
           'EXPERIMENT NAME,SingleCellReference,,,',
           paste0('DATE,',Sys.Date(),',,,'),
           '[Manifests],,,,',
           paste0('A,',manifest_name,',,,'),
           '[Data],,,,')
  
  writeLines(header, filename)
  
  
  df_1 = array_positions %>%
    select(sampleid,arrayid,position)  %>%
    distinct() %>%
    mutate(Path=gtc_output,
           Aux=0)
  colnames(df_1)=c('Sample_ID','SentrixBarcode_A','SentrixPosition_A','Path','Aux')
  df_1 %>%
    write.table(file=filename,append=TRUE,row.names=FALSE,quote=FALSE,sep=',')
}


get_and_folder_in <- function(x,download=TRUE)
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





setwd('C:/Users/gqc954/Documents/')


manifest = system.file("files/HumanCytoSNP-12v2_H.bpm", package = "SureTypeSCR")
cluster = system.file("files/HumanCytoSNP-12v2_H.egt", package = "SureTypeSCR")

idat_to_gtc('4299791043','4299791043/GTC',manifest,cluster)

library(tidyverse)
array_metadata=Sys.glob('4299791043/*.idat') %>% 
  basename() %>% 
  str_extract('4299791043_R[0-9]*C[0-9]*') %>% 
  str_split('_',simplify=TRUE) %>% 
  as.data.frame() %>% 
  mutate(sampleid=paste0('sample',seq(1:8))) %>% 
  rename(arrayid=V1,position=V2)



write_samplesheet('samplesheet_4299791043.csv',array_metadata,'4299791043/GTC',manifest)
scbasic(manifest,cluster,'samplesheet.csv')

######
library(GEOquery)

gse <- getGEO("GSE19247",GSEMatrix = TRUE)

samplelist_sperm=as.data.frame(gse$`GSE19247-GPL6985_series_matrix.txt.gz`) %>% 
  filter((str_detect(cell.type.ch1,'sperm')) & str_detect(cell.amplication.ch1,'MDA')) %>%
  rownames()  

metadata=as.data.frame(gse$`GSE19247-GPL6985_series_matrix.txt.gz`) %>% 
  filter((str_detect(cell.type.ch1,'sperm')) & str_detect(cell.amplication.ch1,'MDA'))%>% 
  select(title,source_name_ch1,cell.amplication.ch1) %>%
  mutate(familyid=gsub('.*family\ ([0-9]+)$','\\1',source_name_ch1),
         embryoid=gsub('.*embryo\ ([0-9]+)\ from\ family [0-9]+','\\1',source_name_ch1),
         celltype=gsub('single\ ([a-z ]+)\ amplified by MDA','\\1',cell.amplication.ch1),
         id=rownames(.) %>% str_to_lower()) %>%
  mutate(embryoid=gsub('.*family\ ([0-9]+)$','\\1',embryoid),)  %>%
  select(id,title,familyid,celltype)


metadf_sperm=map_if(samplelist_sperm,function(x) !is.null(x),function(x) get_and_folder_in(x,download=TRUE))
metadf_sperm_merged = Reduce(function(...) merge(..., all=T), metadf_sperm)


for (ar in unique(metadf_sperm_merged$arrayid))
{
  idat_to_gtc(ar,'GTC',manifest,cluster)
}

write_samplesheet('samplesheet.csv',metadf_sperm_merged,'GTC',manifest)

df=scbasic(manifest,cluster,'samplesheet.csv')





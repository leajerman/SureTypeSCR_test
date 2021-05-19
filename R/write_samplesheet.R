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

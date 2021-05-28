idat_to_gtc <- function(idat_inputfolder,gtc_output,manifest,cluster)
{
  iaap=configure_iaap()
  dir.create(gtc_output,showWarnings = FALSE)
  #for (ar in unique(df$arrayid))
  #{
  #  print(ar)
  system(paste(iaap,'gencall',manifest,cluster,gtc_output,'-f',idat_inputfolder,'-g','-c 0',sep=' '))  
  #HumanCytoSNP-12v2-1_hg19.bpm
  #HumanCytoSNP-12v2-1_L.egt
  #shell(paste(iaap,'gencall','HumanCytoSNP-12v2-1_hg19.bpm','HumanCytoSNP-12v2-1_L.egt',gtcfolder,'-f',ar,'-g','-c 0',sep=' '))  
}

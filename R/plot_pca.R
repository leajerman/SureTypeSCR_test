plot_pca <- function(.data,feat)
{
  pca=.data %>% preprocess_pca(features=feat) %>% prcomp()
  sum=summary(pca)
  importance_pc1=sum$importance['Proportion of Variance','PC1']
  importance_pc2=sum$importance['Proportion of Variance','PC2']
  
  pca_df=as.data.frame(pca$x)
  
  
  p=ggplot(data=pca_df) + geom_point(aes(x=PC1,y=PC2)) + theme_bw() + xlab(paste0("PC1 [",as.character(importance_pc1*100)," %]")) + ylab(paste0("PC2 [", as.character(importance_pc2*100)," %]"))
  return(p)
  
}



plot_pca <- function(.data,feat,n='all',by='Chr')
{
  if (n!='all')
  {
    pca=.data %>% 
      group_by(Chr) %>% 
      preprocess_pca(features=feat) %>% 
      select(one_of(sample(names(.),n))) %>% 
      prcomp()
  }
  else
  {
    pca=.data %>% 
      group_by(Chr) %>% 
      group_modify(~ preprocess_pca(.x,.y, feat)) %>%
      #preprocess_pca(features=feat) %>% 
      prcomp()
  }
  
  sum=summary(pca)
  importance_pc1=sum$importance['Proportion of Variance','PC1']
  importance_pc2=sum$importance['Proportion of Variance','PC2']
  
  pca_df=as.data.frame(pca$x)
  pca_df$individual=rownames(pca_df)
  
  
  p=ggplot(data=pca_df) + geom_point(aes(x=PC1,y=PC2)) + theme_bw() + xlab(paste0("PC1 [",as.character(importance_pc1*100)," %]")) + ylab(paste0("PC2 [", as.character(importance_pc2*100)," %]")) + geom_label_repel(aes(x=PC1,y=PC2,label=individual))
  return(p)
  
}

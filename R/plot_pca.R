anfun <- function(.x)
{
  if (nrow(.x)>0)
    return(prcomp(.x))
  else
    return(NULL)
}

plot_pca <- function (.data,
                      by_chrom = TRUE,
                      features = c("x", "y"), importances=TRUE,
                      metadata=NULL,
                      labels=TRUE)
{
  pallette = colorRampPalette(brewer.pal(8, "Set2"))(length(unique(.data$individual)))
  if (by_chrom == TRUE) {
    p = .data %>% as_tibble() %>% group_by(Chr) %>% nest() %>%
      mutate(
        pca_preproc = map(data, ~ preprocess_pca(.x,
                                                 .y, feat = features)),
        pca = map(pca_preproc,
                  ~
                    anfun(.x)),
        imp_pc1 = map(pca, ~ summary(.x)$importance["Proportion of Variance",
                                                    "PC1"]),
        imp_pc2 = map(pca, ~ summary(.x)$importance["Proportion of Variance",
                                                    "PC2"]),
        pca_df = map(pca, ~ {
          as.data.frame(.x$x)
        }),
        pca_df = map(pca_df, ~ mutate(.x, individual = rownames(.x)))
      ) %>%
      select(Chr, imp_pc1, imp_pc2, pca_df) %>% unnest(c(pca_df,
                                                         imp_pc1, imp_pc2)) %>% mutate(imp_pc1 = round(imp_pc1,
                                                                                                       2),
                                                                                       imp_pc2 = round(imp_pc2, 2))
    labels_df = p %>% select(Chr, imp_pc1, imp_pc2) %>%
      mutate(label = str_c("PC1:", imp_pc1, "PC2: ", imp_pc2,
                           sep = " ")) %>% distinct() %>% select(Chr, label)
      

    plot = ggplot() + geom_jitter(data = p,aes(
        x = PC1,
        y = PC2,
      )) + facet_wrap( ~ Chr,
                       scales = "free") + theme_bw()
      
  } else {#!by_chrom
    p = .data %>% as_tibble() %>% nest(data = everything()) %>%
      mutate(
        pca_preproc = map(data, ~ preprocess_pca(.x,
                                                 .y, feat = features)),
        pca = map(pca_preproc,
                  ~
                    anfun(.x)),
        imp_pc1 = map(pca, ~ summary(.x)$importance["Proportion of Variance",
                                                    "PC1"]),
        imp_pc2 = map(pca, ~ summary(.x)$importance["Proportion of Variance",
                                                    "PC2"]),
        pca_df = map(pca, ~ {
          as.data.frame(.x$x)
        }),
        pca_df = map(pca_df, ~ mutate(.x, individual = rownames(.x)))
      ) %>%
      select(pca_df, imp_pc1, imp_pc2) %>% unnest(c(pca_df,
                                                    imp_pc1, imp_pc2)) %>% mutate(imp_pc1 = round(imp_pc1,
                                                                                                  2),
                                                                                  imp_pc2 = round(imp_pc2, 2))
    labels_df = p %>% select(imp_pc1, imp_pc2) %>% mutate(label = str_c("PC1:",
                                                                        imp_pc1, "PC2: ", imp_pc2, sep = " ")) %>% distinct() %>%
      select(label)

      plot = ggplot() + geom_jitter(data = p, aes(
        x = PC1,
        y = PC2
      )) + theme_bw()
  }
  
  if (importances==TRUE)
  {
    if (by_chrom==TRUE)
    {
      p %<>%left_join(labels_df,by=c('Chr'='Chr'))
    } else {
      p = cbind(p,labels_df)
    }
      plot = plot +  geom_text(
      data=labels_df,
      mapping = aes(
        x = -Inf,
        y = -Inf,
        label = label
      ),
      hjust = -0.1,
      vjust = -1
    ) 
  }
  
  if (!is.null(metadata)) 
  {
    p %<>% left_join(metadata, by = c(individual = "id"))
    plot= plot  + geom_jitter(data = p, aes(
      x = PC1,
      y = PC2,
      color = factor(familyid)
    )) + labs(color='Family') 
    
    
  }
  if (labels==TRUE)
  {
    plot=plot + geom_text_repel(data=p,aes(x=PC1,y=PC2,label=individual))  
    
  } 
  return(plot)
}


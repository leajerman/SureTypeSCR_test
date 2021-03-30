calculate_ma_IV = function(df) {
 features=colnames(df)
 i=intersect(features,c('m_raw','a_raw','m','a'))
 if (length(i)==0)
 {
   dfs=create_dataobject_from_frame(df)
   dfs$calculate_transformations_2()  
   re <- get_simpleind_df(dfs)
 }
 else {
  re <- df
 }
 return(re)
}

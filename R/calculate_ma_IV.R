calculate_ma_IV = function(df) {
 dfs=create_dataobject_from_frame(df)
 dfs$calculate_transformations_2()  
 re <- get_simpleind_df(dfs)
}

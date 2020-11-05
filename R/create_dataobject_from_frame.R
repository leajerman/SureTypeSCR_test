create_dataobject_from_frame = function(df_single) {
 df_multi=get_multiind_df(df_single)
 dataobj <- scEls()$sc$Data(df_multi)
}

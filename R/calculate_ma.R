calculate_ma = function(df) {
   np=import('numpy')
  df %>%
    mutate(m=np$log2(x) -  np$log2(y),
           a=0.5 * (np$log2(x) + np$log2(y)),
           m_raw=np$log2(x_raw) -  np$log2(y_raw),
           a_raw=0.5 * (np$log2(x_raw) + np$log2(y_raw)))
}
locus_ma = function(df,locus) {
 re <- scEls()$sc$genome_library$locus_ma(df,locus)

 re <- py_to_r(re)


}
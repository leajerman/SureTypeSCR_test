locus_cluster = function(df,locus) {
 re <- scEls()$sc$genome_library$locus_cluster(df,locus)

 re <- py_to_r(re)


}
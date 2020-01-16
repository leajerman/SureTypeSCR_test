sc_callrate = function(df,alg,threshold) {
 re <- scEls()$sc$genome_library$sc_callrate(df,alg,threshold)
 re <- py_to_r(re)
}
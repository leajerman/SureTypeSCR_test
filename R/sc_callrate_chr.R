sc_callrate_chr = function(df,alg,threshold,chrr) {
 re <- scEls()$sc$genome_library$sc_callrate_chr(df,alg,threshold,chrr)
 re <- py_to_r(re)
}
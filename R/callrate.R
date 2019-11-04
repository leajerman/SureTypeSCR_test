callrate = function(df,th=0) {
 re <- scEls()$sc$genome_library$callrate(df,th)
 re <- py_to_r(re)
}
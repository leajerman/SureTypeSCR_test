scTrain = function(trainingdata,clfname='gda') {
 trainer <- scEls()$sc$Trainer(trainingdata,clfname='gda')
 trainer$train('rf')
 return (trainer)
}
# load and predict d15n and leaf [n]
predict4landsat_func <- function(dat,predictN=FALSE){
  ######################################################################
  # this function take Landsat spectra to preidct d15N or leaf [n]
  # based on my fitting 
  # https://github.com/Jinyan-Yang/delta_n_15
  ######################################################################
  
  # check require packges
  list.of.packages <- c("randomForest", "caret")
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
  library(caret)
  library(randomForest)

  # make sure the needed columns are in the input
  predictor.vec <- c("blue","green","red","nir","swir1","swir2")
  if(!all(predictor.vec %in% names(dat))){
    stop(c('Input data need to have the follwoing columns: ',paste0(predictor.vec)))
  }
  # read the fitted model
  if(predictN){
    rf_model <- readRDS('cache/rf.kFold.n.rds')
  }else{
    rf_model <- readRDS('cache/rf.kFold.n15.rds')
  }
  # make sure the predictor are reasonable
  dat <- dat[complete.cases(dat[,predictor.vec]),]
  
  dat$preiction <- predict(rf_model,dat)
  
  return(dat)
}

# get the function
source('r/functions.R')

# load the data
input.df <- ''#put the landsat data file

# examples#######
# predict leaf [N]
output.n.df <- predict4landsat_func(dat = input.df,predictN = T)

# predict d15N
output.d15n.df <- predict4landsat_func(dat = input.df,predictN = F)

# example prediction #####
example.df <- readRDS('cache/groundDN15.rds')
# predict d15N
output.d15n.df <- predict4landsat_func(dat = example.df,predictN = F)

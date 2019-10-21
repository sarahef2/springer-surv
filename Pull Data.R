#Data comes from:
#Wang, Y., Klijn, J. G. M., Zhang, Y., Sieuwerts, A. M., Look, M. P., Yang, F., … Foekens, J. A. (2005). 
#Gene-expression profiles to predict distant metastasis of lymph-node-negative primary breast cancer. 
#Lancet, 365, 671–679. https://doi.org/10.1016/S0140-6736(05)70933-8

#Library to make pulling data easier
library(GEOquery)

## load data
## ##############################################################
#Genetic Data
## Doesn't work on my computer, but this is where the data came from
GSE2034_Genetic = getGEO(GEO="GSE2034", destdir="~/data")

#Clinical Data
library(readr)
GSE2034_Clinical <- read_delim("Data/GSE2034_Clinical.txt","\t", escape_double = FALSE, trim_ws = TRUE, skip = 7)
##
X = t(GSE2034_Genetic)
Y = GSE2034_Clinical$`time to relapse or last follow-up (months)`
Censor = GSE2034_Clinical$`relapse (1=True)`

#Save data to an R file
save(X,Y,Censor,GSE2034_Clinical,GSE2034_Genetic,file = "Data/GSE2014.Rdata")

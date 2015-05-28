#Creates a numeric matrix from an imported data frame of the *.asc mesh file(s) created by SimCE3.
#
SimCE3matrix<-function(filename){

big1<-as.matrix(read.table(filename,header=T,
colClasses=c("numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric")))

  for(i in 1:nrow(big1)){


  }
}

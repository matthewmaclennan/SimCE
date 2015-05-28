#Creates a numeric matrix from an imported data frame of the *.asc mesh file(s) created by SimCE3.
#
SimCE3meshMatrix<-function(filename,colname){

#import asc file/filechunk into R
big1<-as.matrix(read.table(filename,header=T,
colClasses=c("numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric")))
}

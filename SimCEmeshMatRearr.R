#Rearranging the SimCEmeshMatrix to as a function of a single variable
#Colnames are: 
SimCEmeshMatRearr<-function(data,colname){
  table<-as.matrix(table(data[,2]))
  table.bound<-cbind(as.numeric(rownames(table)),table)

}

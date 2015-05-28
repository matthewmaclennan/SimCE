#Rearranging the SimCEmeshMatrix to as a function of a single variable
#Colnames are: 
SimCEmeshMatRearr<-function(data,colname){
#Find the time frequencies (i.e. lengths) from the data, display in table, cbind time with frequency
  table<-as.matrix(table(data[,2]))
  table.b<-cbind(as.numeric(rownames(table)),table)
  rownames(table.b)<-NULL
  
}

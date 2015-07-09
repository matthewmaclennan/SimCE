#Rearranging the SimCEmeshMatrix to as a function of a single variable
#Colnames are: 
SimCEmeshMatRearr<-function(data,colname){
#Find the time frequencies (i.e. lengths) from the data, display in table, cbind time with frequency
  table<-as.matrix(table(data[,2]))
  table.b<-cbind(as.numeric(rownames(table)),table)
  rownames(table.b)<-NULL
#Assuming the frequencies in table.b are all equal, one can use the matrix rearrangement function
    peakInt<-matrix(data[,colname],nrow=table.b[1,2])
#Please do one column at a time for plotting purposes, although [:] ranges do work (automatically cbind)
  peakmatrix<-rbind(table.b[,1],peakInt)
}
#####NOTA BENE: the first row of the resulting matrix consists of the time from which the vector data is derived.
#####For any plots of data alone, omit row 1.

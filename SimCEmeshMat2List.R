#Function which takes mesh matrix derived from SimCE3 and converts it to a list where each object is a matrix and
#each list object is the matrix according to the timestamp
SimCEmeshMat2List<-function(data){
  table<-as.matrix(table(data[,2]))
  table.b<-cbind(as.numeric(rownames(table)),table)
  rownames(table.b)<-NULL
  list1<-list()
  for(i in 1:nrow(table.b)){
    list1[[i]]<-data[(table.b[i,2]*(i-1)):(table.b[i,2]*i),]
  }
list1
}

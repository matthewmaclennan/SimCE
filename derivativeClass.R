#Finds 1st derivative of time-series data derived from SimCEmeshMatRearr and assigns "front" and "plateau" to segments 
#in the data
derivativeClass<-function(data){
data<-as.matrix(data)
ddata_dt<-diff(data)

}

# PLS-DA
library(mixOmics)
data<-read.delim("a.txt",header=T)
datat<-data[,-1]
row.names(datat)<-data[,1]
datatm<-as.matrix(datat)
XXt<-datatm
YY<-c(rep(c("COAD","ESCA","READ","STAD"),c(357,126,130,392)))
plsda.datatm <-plsda(XXt, YY, ncomp = 2)
tiff(filename = "PLS-DA.tif",width = 15,height =15,units ="cm",compression="lzw",bg="white",res=300)
plotIndiv(plsda.datatm,ellipse = TRUE,ind.names=FALSE,pch = c(16,17,15,3), col.per.group = c("#00447E", "#F34800","orange","#1B9E77"),ellipse.level = 0.95,style="ggplot2",title = "PLS-DA",size.title = 14,X.label = "X-variate 1",Y.label = "X-variate 2",size.xlabel = 12,size.ylabel = 12,size.axis = 12,legend = TRUE,legend.title = "Groups")
dev.off()

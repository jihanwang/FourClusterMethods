# PCA
library(FactoMineR)
library(factoextra)
data<-read.table('a.txt',header = TRUE)
ESCA_name<-'ESCA'
ESCA_range<-1:126
COAD_name<-'COAD'
COAD_range<-127:483
STAD_name<-'STAD'
STAD_range<-484:875
READ_name<-'READ'
READ_range<-876:1005
data_pca <- PCA(data, graph = FALSE)
group1<-rep(ESCA_name,length(ESCA_range))
group2<-rep(COAD_name,length(COAD_range))
group3<-rep(STAD_name,length(STAD_range))
group4<-rep(READ_name,length(READ_range))
group<-c(group1,group2,group3,group4)
tiff(filename = "PCA.tif",width = 15,height =15,units ="cm",compression="lzw",bg="white",res=300)
fviz_pca_ind(data_pca,
geom.ind = "point",
col.ind = group,
palette = c("#00447E", "#F34800", "orange","#1B9E77"),
addEllipses = TRUE,
legend.title = "Groups",title="")
dev.off()
library(reshape2)
traits<-read.table("../markus/Datasets for Mani/HMDP_HFHS_traits.txt", header = TRUE, sep = "", dec = ".")
traits_insulin<-traits[traits[,'trait_name']=="Insulin pg/ml",]
t<- read.table("../markus/Datasets for Mani/HMDP_HFHS_trx_adipose.txt",header=TRUE)
t_crop<- t[,c("gene_symbol","mouse_number","expression_value")]
t_unmelt<-dcast(t_crop,mouse_number ~ gene_symbol,value.var = "expression_value",fun.aggregate = mean)
#t_crop[t_crop[,'mouse_number']==42,]
#temp<-t[t[,'mouse_number']==42 ,]
#temp_r<-temp[temp[,'gene_symbol']=='Abce1',]

write.csv2(t_unmelt,file="adipose_matrix.csv",row.names = FALSE)


library(reshape2)
traits<-read.table("../markus/Datasets for Mani/HMDP_HFHS_traits.txt", header = TRUE, sep = "", dec = ".")
traits_insulin<-traits[traits[,'trait_name']=="Insulin pg/ml",]
t<- read.table("../markus/Datasets for Mani/HMDP_HFHS_trx_adipose.txt",header=TRUE)
t_crop<- t[,c("gene_symbol","mouse_number","expression_value")]
t_unmelt<-dcast(t_crop,mouse_number ~ gene_symbol,value.var = "expression_value",fun.aggregate = mean)
#t_crop[t_crop[,'mouse_number']==42,]
#temp<-t[t[,'mouse_number']==42 ,]
#temp_r<-temp[temp[,'gene_symbol']=='Abce1',]

write.csv(t_unmelt,file="adipose_mat.csv",row.names = FALSE)
hypo<- read.table("../markus/Datasets for Mani/HMDP_HFHS_trx_hypothalamus.txt",header=TRUE)
hypo_crop<-hypo[,c("gene_short_name","mouse_number","value")]
hypo_unmelt<-dcast(hypo_crop,mouse_number~gene_short_name,value.var = "value",fun.aggregate = mean)
write.csv(hypo_unmelt,file="hypothal_mat.csv",row.names=FALSE)
traits_insulin_strain=traits_insulin[,c('value','Strain')]
traits_insulin_agg<-aggregate(value~Strain,data=traits_insulin_strain,mean)

write.csv(traits_insulin_agg,"insulin_traits.csv",row.names = FALSE)

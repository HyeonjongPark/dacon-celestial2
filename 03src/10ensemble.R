library(data.table)

model1 = read_csv("./06submission/rf/rf-pred9.csv")
model2 = read_csv("./06submission/xgb/xgb-pred1.csv")

#ensem = (model1[,2:ncol(model1)] + model2[,2:ncol(model2)] ) /2 
ensem = (model1[,2:ncol(model1)] * 0.2 + model2[,2:ncol(model2)] * 0.8) 
ensem$id = o_test$id

ensem = ensem[,c(ncol(ensem),1:(ncol(ensem)-1))]

fwrite(ensem, "./06submission/ensemble/ensem15.csv")





model1 = read_csv("./06submission/rf/rf-pred9.csv")
model2 = read_csv("./06submission/xgb/xgb-pred1.csv")
model3 = read_csv("./06submission/lgb/lgb-pred7.csv")

ensem = (model1[,2:ncol(model1)] * 0.1 + model2[,2:ncol(model2)] * 0.6 + model3[,2:ncol(model3)] * 0.3)
ensem$id = o_test$id

ensem = ensem[,c(ncol(ensem),1:(ncol(ensem)-1))]

fwrite(ensem, "./06submission/ensemble/ensem13.csv")





## 원자력
model1 = read_csv("D:/dacon-nuclearPower/lgb_400_1del11541168.csv")
model2 = read_csv("D:/dacon-nuclearPower/submission-del11541168.csv")

ensem = (model1[,2:ncol(model1)] + model2[,2:ncol(model2)] ) /2 
ensem = (model1[,2:ncol(model1)] * 0.9 + model2[,2:ncol(model2)] * 0.1) 
ensem$id = model1$id

ensem = ensem[,c(ncol(ensem),1:(ncol(ensem)-1))]
ensem
fwrite(ensem, "D:/dacon-nuclearPower/ensemdel11541168_10.csv")

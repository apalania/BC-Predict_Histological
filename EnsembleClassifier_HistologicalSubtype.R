library(readr)
library(caret)
library(tidyverse)
model_neuralNet_1layer <- readRDS("~/model_neuralNet_1layer.rds")
XGB<-readRDS("~/XGB.rds")
Filename<-readline("what is the name of test file?")
Test<-read.csv(Filename, row.names=1, header=TRUE)
log<-readline("Is the dataset is log2 transformed?")
if(toupper(log)=="NO")
  {Test<-log2(test)
  Test[Test==-Inf]<-0}

Prediction_NN<-predict(model_neuralNet_1layer,Test)
Prediction_XGB<-predict(XGB,as.matrix(Test[colnames(Test)%in%XGB[["feature_names"]]]))
Prediction_NN<-as.character(Prediction_NN)
XGB_prediction <- matrix(Prediction_XGB, nrow = 2,ncol=length(Prediction_XGB)/2) %>% t() %>% data.frame() %>% mutate(max_prob = max.col(.,"last"))
Predict_XGB<-XGB_prediction$max_prob
Predict_XGB[Predict_XGB==1]<-"Ductal"
Predict_XGB[Predict_XGB==2]<-"Lobular"
for (i in 1:length(Prediction_NN)) {
  if (Prediction_NN[i]!=Predict_XGB[i]){Prediction_NN[i]<-"Inconclusive"}
}

cbind(Test,Prediction_NN)->Data

write.csv(Data,"DATA.csv")

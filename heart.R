library(Stat2Data)
heart<-read.csv("/Users/Benjamin/Desktop/heart.csv")
head(heart)
pairs(heart[,c(0,1,2,3,4,5,6,7,8,9)],col=as.numeric(heart$chd)+1,pch=19)
boxplot(sbp~chd,data=heart,pch=19,col=13)
boxplot(ldl~chd,data=heart,pch=19,col=13)
boxplot(tobacco~chd,data=heart,pch=19,col=12)
boxplot(adiposity~chd,data=heart,pch=19,col=11)
boxplot(famhist~chd,data=heart,pch=19,col=10)
boxplot(typea~chd,data=heart,pch=19,col=9)
boxplot(obesity~chd,data=heart,pch=19,col=8)
boxplot(obesity~chd,data=heart,pch=19,col=7)
boxplot(alcohol~chd,data=heart,pch=19,col=6)
boxplot(age~chd,data=heart,pch=19,col=5)
heart.mod<-glm(chd~ldl+sbp+tobacco+adiposity+famhist+typea+obesity+alcohol+age,data=heart,family=binomial)
summary(heart.mod)
heart.mod2<-step(heart.mod,scope=~.)
summary(heart.mod2)
anova(heart.mod,heart.mod2,test="Chisq")
ibrary(car)
mmps(heart.mod2,key=T,pch=19)
library(generalhoslem)
gof<-logitgof(heart$chd,fitted(heart.mod2),4)
gof
gof$expected
gof$observed
Model<-ifelse(predict(heart.mod2,type="response")>0.5,"yes","no")
table(Model,heart$chd)

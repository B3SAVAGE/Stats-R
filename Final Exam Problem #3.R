library(Stat2Data)
data(FaithfulFaces)
face<-FaithfulFaces
head(face)
face.mod<-glm(Cheater~Trust+Faithful+Attract+SexDimorph, data=face,family=binomial)
summary(face.mod)
face.mod2<-step(face.mod, scope =~.^2)
summary(face.mod2)
anova(face.mod,face.mod2)
face$Cheater<-ifelse(face$Cheater==face$Cheater[1],0,1)
head(face)
library(generalhoslem)
gof<-logitgof(face$Cheater,fitted(face.mod2),4)
gof
gof$expected
gof$observed
Model<-ifelse(predict(face.mod2,type="response")>0.5,"0","1")
table(Model,blue$KnownSex)
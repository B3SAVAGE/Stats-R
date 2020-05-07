library(Stat2Data)
data(ElephantsMF)
elephants<-ElephantsMF
elephants$AgeSq<-elephants$Age^2
elephants.qmod<-lm(Height~Age+AgeSq,data=elephants)#problem 1 lm
summary(elephants.qmod)
plot(Height~Age,data = elephants,col='magenta',pch=19)#first graph
curve(102.48-12.56*x-.2762*x^2,lwd=2,col="green",add=T)
Residuals<-elephants.qmod$residuals
Fits<-elephants.qmod$fitted.values
plot(Residuals~Fits,pch=19,col="Red")
abline(h=0,lwd=2)




summary(elephants.lm1)#summary 1
male<-elephants[elephants$Sex=="M",]
female<-elephants[elephants$Sex=="F",]
ele.qmod2 <-lm(Height~Age+AgeSq+Sex,data=elephants)
summary(ele.qmod2)#summary 2
plot(Height~Age,data = elephants,col=as.numeric(Sex),pch=19) #Sex indicated as separate color

male.lm<-lm(Height~Age+AgeSq,data=male)
abline(male.lm,lwd=2,col=10)
summary(ele.qmod2)
curve(100.21-13.38*x+0.27*x^2+13.3*x+4.82,lwd=3,col="forest green",add=T)

female.lm<-lm(Height~Age+AgeSq,data=female)
summary(female.lm)
curve(-105.27-11.22*x+0.24*x^2+13.3*x+5.06,lwd=3,col="Orange",add=T)

plot(Height~Age,data = elephants,col=as.numeric(Sex),pch=19) #Sex indicated as separate color
ele.qmod3 <-lm(Height~Age+AgeSq+Sex+Age*male+AgeSq*male,data=elephants)
summary(ele.qmod3)
anova(ele.qmod3,ele.qmod2)
curve(105.27-11.22*x+0.24*x^2+5.06,data=elephants,add=T)


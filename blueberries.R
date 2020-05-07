blue<-read.csv("/Users/Benjamin/Desktop/Blueberry.csv",header=T)
library(Stat2Data)
blue
tapply(blue$Weight,blue$Method,summary)
tapply(blue$Weight,blue$Farm,summary)

blue.lm<-lm(Weight~Method+as.factor(Farm),data=blue)
anova(blue.lm)
interaction.plot(blue$Farm,blue$Method,blue$Weight)
Residuals<-blue.lm$residuals
Fits<-blue.lm$fitted.values
plot(Residuals~Fits,col="aquamarine",pch=19)
abline(h=0,lwd=2)
qqnorm(Residuals,pch=19,col=12)
qqline(Residuals,lwd=2)
TukeyHSD(aov(Weight~Method+as.factor(Farm),data=blue))

library(Stat2Data)
data(FruitFlies2)
fly<-FruitFlies2
head(fly)

boxplot(Lifespan~Alone*Mated,data = fly,pch=19,col=3)
library(ggplot2)

fly.lm<-lm(Lifespan~Alone*Mated,data=fly)
anova(fly.lm)
interaction.plot(fly$Alone,fly$Mated,fly$Lifespan)

Residuals<-fly.lm$residuals
Fits<-fly.lm$fitted.values
plot(Residuals~Fits,pch=17,col="forest green")
abline(h=0,lwd=2)
qqnorm(Residuals,pch=19,col="orange")
qqline(Residuals,lwd=2)
TukeyHSD(aov(Lifespan~Alone*Mated,data=fly))

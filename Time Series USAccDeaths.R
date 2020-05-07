help("USAccDeaths")
head(USAccDeaths)
str(USAccDeaths)
month<-rep(c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"),6)
t<-seq(1,72,1)
drive<-data.frame(deaths=c(USAccDeaths),month=month,t=t)
head(drive)

par(mfrow=c(2,1))
plot(deaths~t,data=drive,type="l",lwd=2)
drive.lm<-lm(deaths~t+I(t^2),data=drive)
summary(drive.lm)
plot(deaths~t,data=drive,type="l",lwd=2)
curve(9934-66.04*x+0.7892*x^2,col=12,lwd=2,add=T)
drive$Xcos<-cos(2*pi*drive$t/12)
drive$Xsin<-sin(2*pi*drive$t/12)
head(drive)
drive.cos.lm<-lm(deaths~t+I(t^2)+Xcos+Xsin,data=drive)
points(drive$t,drive.cos.lm$fitted.values,type="l",col=10,lwd=2)
drive.mon.lm<-lm(deaths~t+I(t^2)+month,data=drive)
points(drive$t,drive.mon.lm$fitted.values,type="l",col=11,lwd=2)
summary(drive.cos.lm)
summary(drive.mon.lm)

acf(drive.cos.lm$residuals,lwd=2,col=10)
acf(drive.mon.lm$residuals,lwd=2,col=10)

drive.dec<-decompose(USAccDeaths,type="additive")
plot(drive.dec,lwd=2,col=10)
par(mfrow=c(1,1))
acf(drive.dec$random,col=10,lwd=2,na.action=na.pass)

par(mfrow=c(3,2))
plot(diff(drive$deaths),lwd=2,type="l")
acf(diff(drive$deaths),col=10,lwd=2)
plot(diff(drive$deaths,lag=12),type="l",lwd=2)
acf(diff(drive$deaths,lag=12),col=10,lwd=2)
plot(diff(diff(drive$deaths,lag=12)),type="l",lwd=2)
acf(diff(diff(drive$deaths,lag=12)),col=10,lwd=2)


my.arima1<-arima(USAccDeaths,order=c(1,1,0),seasonal=list(order=c(1,1,0)))
my.arima1
my.arima2<-arima(USAccDeaths,order=c(0,1,1),seasonal=list(order=c(0,1,1)))
my.arima2
my.arima3<-arima(USAccDeaths,order=c(1,1,1),seasonal=list(order=c(1,1,1)))
my.arima3

AIC(my.arima1,my.arima2,my.arima3)
BIC(my.arima1,my.arima2,my.arima3)

predict(my.arima1,3)$pred
predict(my.arima2,3)$pred
predict(my.arima3,3)$pred
par(mfrow=c(1,1))
acf(my.arima2$residuals,lwd=2,col=10)
par(mfrow=c(1,1))
plot(USAccDeaths,type="l",lwd=2)
install.packages("forecast")
library(forecast)

points(fitted(my.arima2),type="l",lwd=2,col=10)

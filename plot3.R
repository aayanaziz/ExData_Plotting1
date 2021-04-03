dat<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,dec=".")
#---------gettin data in right format------------
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat$Time<-format(dat$Time, format="%H:%M:%S")
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)
#---------subsetting required data---------------
sst<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02")
#---------creating timestamp and appending-------
tym<-strptime(paste(sst$Date, sst$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
sst <- cbind(sst, tym)
#---------getting PNG plot-----------------------
png("plot3.png",height=480,width=480)
plot(tym,sst$Sub_metering_1, type="l",xlab="  ",ylab="Energy Sub-Metering")
lines(tym,sst$Sub_metering_2, type="l",col="Red")
lines(tym,sst$Sub_metering_3,type="l",col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=1)
dev.off()
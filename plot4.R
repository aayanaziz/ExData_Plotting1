dat<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,dec=".")
#---------gettin data in right format------------
dat$Date<-as.Date(rep$Date,format="%d/%m/%Y")
dat$Time<-format(rep$Time, format="%H:%M:%S")
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)
dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)
dat$Voltage <- as.numeric(dat$Voltage)
#---------subsetting required data---------------
smol<-subset(rep,Date=="2007-02-01" | Date=="2007-02-02")
#---------creating timestamp and appending-------
tym<-strptime(paste(sst$Date, sst$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
sst <- cbind(sst, tym)
#---------getting PNG plot-----------------------
png("plot4.png",height=480,width=480)
par(mfrow =c(2,2))
#--------plot1-----------------------------------
plot(tym,sst$Global_active_power, type="l",xlab="  ",ylab="Global Active Power(in kilowatt)")
#--------plot2-----------------------------------
plot(tym,sst$Voltage,type="l",ylab="Volatge",xlab="datetime")
#--------plot3-----------------------------------
plot(tym,sst$Sub_metering_1, type="l",xlab="  ",ylab="Energy sub metering")
lines(tym,sst$Sub_metering_2, type="l",col="red")
lines(tym,sst$Sub_metering_3,type="l",col="blue")
legend("topright",inset=0.04,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=1,box.lty=0)
#--------plot4-----------------------------------
plot(tym,sst$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
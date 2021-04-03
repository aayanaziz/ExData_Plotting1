dat<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,dec=".")
#---------gettin data in right format------------
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat$Time<-format(dat$Time, format="%H:%M:%S")
dat$Global_active_power <- as.numeric(dat$Global_active_power)
#---------subsetting required data---------------
sst<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02")
#---------creating timestamp and appending-------
tym<-strptime(paste(sst$Date, sst$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
sst <- cbind(sst, tym)
#---------getting PNG plot-----------------------
png("plot2.png",height=480,width=480)
with(sst,plot(tym,sst$Global_active_power, type="l",xlab=" ",ylab="Global Active Power(in kilowatt)"))
dev.off()
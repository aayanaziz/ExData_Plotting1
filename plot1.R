dat<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,dec=".")
#---------gettin data in right format-----------
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat$Time<-format(dat$Time, format="%H:%M:%S")
dat$Global_active_power <- as.numeric(dat$Global_active_power) 
#---------subsetting required data--------------
sst<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02")
#---------getting PNG plot----------------------
png("plot1.png",height=480,width=480)
hist(sst$Global_active_power, main = "Global Active Power",col="Red", xlab="Global Active Power")
dev.off()
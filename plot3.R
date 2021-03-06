Sys.setlocale("LC_TIME", "en_US.UTF-8")
consumption<-read.csv("household_power_consumption.txt",sep=";",dec=".",na.strings=c("?"))
consumption$Time<-strptime(paste(consumption$Date,consumption$Time),"%d/%m/%Y %H:%M:%S")
consumption$Date<-as.Date(consumption$Date,"%d/%m/%Y")
consumptionData<-subset(consumption,Date=="2007-02-01" | Date=="2007-02-02")

png("plot3.png",480,480,bg="transparent")
attach(consumptionData)
plot(Time,Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(Time,Sub_metering_2,col="red")
lines(Time,Sub_metering_3,col="blue")
legend("topright", lty=1, col =c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

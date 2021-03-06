data1=read.table('household_power_consumption.txt',sep=';',header=TRUE,stringsAsFactors=FALSE)
head(data1)
data1$Date=as.Date(data1$Date,format='%d/%m/%Y')
data2=rbind(data1[(data1$Date=='2007-02-01'),],data1[(data1$Date=='2007-02-02'),])
head(data2)
data2$Days=weekdays(data2$Date)
data2$Time1=strptime(paste(data2$Days,data2$Date,data2$Time),format='%a %Y-%m-%d %H:%M:%S')
par(mfrow = c(3, 2))
with(data2, {
  plot(data2$Time1,data2$Global_active_power, type = "l",ylab='Global Active Power (kilowatts)',main=NA,xlab=NA)
  plot(data2$Time1,data2$Voltage, type = "l",ylab='Global Active Power (kilowatts)',main=NA,xlab='datetime')
  plot(data2$Time1,data2$Sub_metering_1, type = "l",ylab='Energy sub metering',main=NA,xlab=NA)
  lines(data2$Time1,data2$Sub_metering_2,col='red')
  lines(data2$Time1,data2$Sub_metering_3,col='blue')
  legend('topright',adj = c(0, 0.6),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'),bty='n')
  plot(data2$Time1,Global_reactive_power, type = "l",ylab='Global_reactive_power',main=NA,xlab='datetime')
})

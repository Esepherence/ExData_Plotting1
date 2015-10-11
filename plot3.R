# Load data, assumes file in current working directory
if (nrow(data) < 2880){  
  data = read.delim('household_power_consumption.txt', sep=';')
}

#Reformat date and limit data to desired range
data$Date = as.Date(data$Date, '%d/%m/%Y')

data = data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

png(filename='plot3.png')
plot(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Sub_metering_1),
     type='l', ylab='Energy sub metering', xlab='12AM Thursday to 12AM Saturday')
lines(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Sub_metering_2), col='Tomato')
lines(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Sub_metering_3), col='Cadetblue')
mtext('by Esepherence', col='Darkgray')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('Black', 'Tomato', 'Cadetblue'))

dev.off()
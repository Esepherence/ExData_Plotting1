# Load data, assumes file in current working directory
data = read.delim('household_power_consumption.txt', sep=';')


#Reformat date and limit data to desired range
data$Date = as.Date(data$Date, '%d/%m/%Y')

data = data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

png(filename='plot4.png')

par(mfrow = c(2, 2))
plot(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Global_active_power)/1000, type='l',xlab='12AM Thursday to 12AM Saturday', ylab='Global Active Power')
plot(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Voltage), type='l', xlab='12AM Thursday to 12AM Saturday', ylab='Voltage')
plot(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Sub_metering_1), type='l', xlab='12AM Thursday to 12AM Saturday', ylab='Energy Seb-Metering')
lines(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Sub_metering_2), col='Tomato')
lines(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Sub_metering_3), col='Cadetblue')
plot(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Global_reactive_power)/1000, type='l', xlab='12AM Thursday to 12AM Saturday', ylab='Global Reactive Power')

dev.off()
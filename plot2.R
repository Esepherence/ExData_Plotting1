# Load data, assumes file in current working directory 
data = read.delim('household_power_consumption.txt', sep=';')


#Reformat date and limit data to desired range
data$Date = as.Date(data$Date, '%d/%m/%Y')

data = data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

png(filename='plot2.png')

plot(as.POSIXct(paste(data$Date, data$Time, sep=' '), tz='GMT', '%Y-%m-%d %H:%M:%S'), as.numeric(data$Global_active_power)/1000,
     type='l', ylab='Global Active Power (kilowatts)', xlab='12AM Thursday to 12AM Saturday')
mtext('by Esepherence', col='Darkgray')

dev.off()
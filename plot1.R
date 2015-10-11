# Load data, assumes file in current working directory
data = read.delim('household_power_consumption.txt', sep=';')


#Reformat date and limit data to desired range
data$Date = as.Date(data$Date, '%d/%m/%Y')

data = data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

png(filename='plot1.png')

hist(as.numeric(data$Global_active_power)/1000, col='Tomato', main='Global Active Power', xlab='Global Active Power (kilowatts)')
mtext('by Esepherence', col='darkgray')

dev.off()





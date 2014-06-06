#
# look the README.md  for an explanation on how I read the data
#

## now ill be Reading Relevent data
data <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors = F, na.strings = '?', skip = 66636, nrow = 2880)

colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

## Draw the histogram of plot 1 in a png 
png('plot1.png', bg = 'transparent')
       ### is No need to specify ylab 
       hist(data$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylim = c(0, 1200))
dev.off()

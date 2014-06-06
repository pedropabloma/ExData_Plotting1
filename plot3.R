#
# look the README.md  for an explanation on how I read the data
#

## now to get Reading Relevent data
data <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors = F, na.strings = '?', skip = 66636, nrow = 2880)

colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

## now i will Merging Date and Time columns into one vector with format.
datetime <- strptime(paste(data$Date, data$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')

## now Build a new data frame with  required data for plot 3
data <- data.frame(datetime, data[, 7:9])


## now i Draw the histogram for  plot 3 in a png 
png('plot3.png', bg = 'transparent')
       ### again Set days names to english
       Sys.setlocale(category = "LC_TIME", locale = "en_GB.UTF-8")
       with(data,{
               plot(Sub_metering_1 ~ datetime, col = c('black', 'red', 'blue'), type='l', xlab='', ylab='Energy sub metering')
               lines(Sub_metering_2 ~ datetime, col = 'red')
               lines(Sub_metering_3 ~ datetime, col = 'blue')
               legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = 1, lwd = 1)
              }
       )
dev.off()

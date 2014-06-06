#
# look the README.md  for an explanation on how I read the data
#

## now Reading Relevent data
data <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors = F, na.strings = '?', skip = 66636, nrow = 2880)

colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

## now ill be Merging Date and Time columns into one vector with the format.
datetime <- strptime(paste(data$Date, data$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')

## now ill Build a new data frame with only the required data of  plot 2
data <- data.frame(datetime, data[,3:3])

## now Name the columns appropriately
colnames(data) <- c('datetime', 'Global_Active_power')

## now ill Draw plot 2 in a png 
png('plot2.png', bg = 'transparent')
### Set days names to english
       Sys.setlocale(category = "LC_TIME", locale = "en_GB.UTF-8")
       with(data,
              ### No need to specify xlabel since the default is ok
              
              plot(datetime, Global_Active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
       )
dev.off()

#
# look the README.md  for an explanation on how I read the data
#

## Reading the data
data <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors = F, na.strings = '?', skip = 66636, nrow = 2880)

colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

## Now ill merging Date and Time  into one vector with format.
datetime <- strptime(paste(data$Date, data$Time, sep=' '), format = '%d/%m/%Y %H:%M:%S')

## Now Build a new data frame with only the required data for the case of plot 4
data <- data.frame(datetime, data[, c(3:5,7:9)])

## Now Draw the histogram of case plot 4 in a .png 
png('plot4.png', bg = 'transparent')
       ### now Set days names to english
       Sys.setlocale(category = "LC_TIME", locale = "en_GB.UTF-8")
       par(mfrow=c(2,2))

       with(data,{
              ### now the First Graph
              plot(Global_active_power ~ datetime, type = 'l', xlab = '', ylab = 'Global Active Power')
       
              ### now the Second graph. No need to specify xlabel and ylabel  defaults are the needed
              plot(Voltage ~ datetime, type = 'l')
       
              ### now the Third Graph
              plot(Sub_metering_1 ~ datetime, col = c('black', 'red', 'blue'), type = 'l', xlab = '', ylab = 'Energy sub metering')
                     lines(Sub_metering_2 ~ datetime, col = 'red')
                     lines(Sub_metering_3 ~ datetime, col = 'blue')
                     legend('topright', bty = 'n', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = 1, lwd = 1, cex=0.95)

              ### now the Fourth Graph. No need to specify xlabel and ylabel 
              plot(Global_reactive_power ~ datetime, type = 'l')
              }
       )
dev.off()

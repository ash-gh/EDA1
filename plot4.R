#read the file
HPC<- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", check.names=F, stringsAsFactors=F, comment.char="",quote='\"')

##new column added of time and data
HPC$DateTime <- strptime(paste(HPC$Date,HPC$Time), format="%d/%m/%Y %H:%M:%S")

#remove the redundant date and time column
HPC$Date=NULL
HPC$Time=NULL

#subset the required data
subHPC= subset(HPC,as.Date(HPC$DateTime) >= "2007-02-01" & as.Date(HPC$DateTime) < "2007-02-03")

## Plot 4
# Create a 2x2 split

par(mfrow=c(2,2))

# SUBPLOT 1 - same as Plot 2

plot(subHPC$DateTime, subHPC$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# SUBPLOT 2 - voltage vs time

plot(subHPC$DateTime, subHPC$Voltage, type="l", xlab="DateTime",  ylab="Voltage")

# SUBPLOT 3 - same as Plot 3

# Plot the first sub-meter
plot(subHPC$DateTime, subHPC$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

# Plot the second sub-meter
lines(subHPC$DateTime, subHPC$Sub_metering_2, type="l",  col="red")

# Plot the third sub-meter
lines(subHPC$DateTime, subHPC$Sub_metering_3, type="l", col="blue")

# Add the legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),lwd=2,col=c("black","red","blue"),bty="n")

# SUBPLOT 4

plot(subHPC$DateTime, subHPC$Global_reactive_power, type="l", xlab="DateTime", ylab="Global_reactive_power")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
#set the working directory
#read the file

HPC<- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", check.names=F, stringsAsFactors=F, comment.char="",quote='\"')

##new column added of time and data
HPC$DateTime <- strptime(paste(HPC$Date,HPC$Time), format="%d/%m/%Y %H:%M:%S")

#remove the redundant date and time column
HPC$Date=NULL
HPC$Time=NULL

#subset the required data
subHPC= subset(HPC,as.Date(HPC$DateTime) >= "2007-02-01" & as.Date(HPC$DateTime) < "2007-02-03")

#plot to a file
png(filename="plot1.png", height=480, width=480, bg="transparent")

hist(subHPC$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()
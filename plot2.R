# read the data assumes raw file is in your directory
data<-read.csv("household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep = ";", quote = "\"", na.strings = "?")

#put the dates in usable form and subset the data

data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data<-data[data$Date =="2007-02-01" | data$Date == "2007-02-02" ,]
combined_dateTime<- as.data.frame(as.POSIXct(paste(as.Date(data$Date),data$Time, sep = " ")))
data<-cbind.data.frame(combined_dateTime,data)
colnames(data)[1]<-"combined_dateTime"

#create the plot
plot(data$combined_dateTime,data$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png,file = "plot2.png", height = 500, width = 500)
dev.off()
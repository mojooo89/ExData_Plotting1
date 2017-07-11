# Loading Data
Power_Dataset <- read.table("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# Subsetting according to dates specified in this repositories readme file
Subset_Dataset <- Power_Dataset[(Power_Dataset$Date=="1/2/2007" | Power_Dataset$Date=="2/2/2007" ), ]

# Formatting date and time for correctly displaying weekdays incl. time in the plot 
Subset_Dataset$Date <- as.Date(Subset_Dataset$Date, format="%d/%m/%Y")
newDateVar<- paste(Subset_Dataset$Date, Subset_Dataset$Time)
Subset_Dataset$newDateVar <- as.POSIXct(newDateVar)

# Plot 3 with additionally variables displayed according to the new date variable from Plot 2; colouring according to legend
# Note: German Axis Labels (Do = Thu...)
with(Subset_Dataset, {
  plot(Sub_metering_1~newDateVar, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex=0.8) 
  lines(Sub_metering_2~newDateVar, col='Red') 
  lines(Sub_metering_3~newDateVar, col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

# Writing Plot to a PNG file
dev.copy(png, file="plot3.png", height=500, width=500)
dev.off()

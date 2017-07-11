# Loading Data
Power_Dataset <- read.table("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# Subsetting according to dates specified in this repositories readme file
Subset_Dataset <- Power_Dataset[(Power_Dataset$Date=="1/2/2007" | Power_Dataset$Date=="2/2/2007" ), ]

# Formatting date and time for correctly displaying weekdays incl. time in the plot 
Subset_Dataset$Date <- as.Date(Subset_Dataset$Date, format="%d/%m/%Y")
newDateVar<- paste(Subset_Dataset$Date, Subset_Dataset$Time)
Subset_Dataset$newDateVar <- as.POSIXct(newDateVar)

# Plot 2 | Note: German Axis Labels (Do = Thu...)
plot(Subset_Dataset$Global_active_power~Subset_Dataset$newDateVar, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Writing Plot to a PNG file
dev.copy(png, file="plot2.png", height=500, width=500)
dev.off()

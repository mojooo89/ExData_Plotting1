setwd("c:/Users/Mojoo/Desktop")

# Loading Data
Power_Dataset <- read.table("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# Subsetting according to dates specified in this repositories readme file
Subset_Dataset <- Power_Dataset[(Power_Dataset$Date=="1/2/2007" | Power_Dataset$Date=="2/2/2007" ), ]

## Plot 1's Histogram
hist(Subset_Dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

# Writing Plot to a PNG file
dev.copy(png, file="plot1.png", height=500, width=500)
dev.off()
  
getPowerData <- function() {
    if (!file.exists("data")) {
        dir.create("data")
    }
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = "./data/household_power_consumption.txt", method = "curl")
    datafile <- read.csv("./data/household_power_consumption.txt"
                         ,header = TRUE
                         ,sep = ";"
                         ,na.strings = "?"
    )
    sub_data <- subset(datafile, (Date %in% c("1/2/2007","2/2/2007")))
    png(file = "./plot1.png", width = 480, height = 480, units = "px")
    hist(sub_data$Global_active_power, col= "red", main = "Global Active Power"
         , xlab = "Global Active Power (kilowatts)", ylim=c(0,1200))
    dev.off()  
    hist(sub_data$Global_active_power, col= "red", main = "Global Active Power"
         , xlab = "Global Active Power (kilowatts)", ylim=c(0,1200))
}

png(filename = "Rplot%03d.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, ...,
    type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)
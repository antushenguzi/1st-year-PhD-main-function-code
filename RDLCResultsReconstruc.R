library(ggplot2)
library(readr)

# read data from CSV

data <- read.csv(file.choose(), header = TRUE, skip = 3)

head(data)


# Plot 
plot_coordinates <- function(data, row_num) {
  x <- data[row_num, "X1123.0343017578125"]
  y <- data[row_num, "X927.3070678710938"]
  
  ggplot(data[1:row_num,], aes(x = X1123.0343017578125, y = X927.3070678710938), group=1) +
    geom_point(aes(x = x, y = y), color = "red", size = 3) +
    geom_line(aes(x = X1123.0343017578125, y = X927.3070678710938), color = "blue") +
    xlim(min(data$X1123.0343017578125) - 10, max(data$X1123.0343017578125) + 10) + 
    ylim(min(data$X927.3070678710938) - 10, max(data$X927.3070678710938) + 10) + 
    labs(title = paste("Time Point:", row_num), x = "X axis", y = "Y axis") +
    theme_minimal()
}

# loop
for(i in 1:nrow(data)) {
  print(plot_coordinates(data, i))
  Sys.sleep(0.5)
}


library(ggplot2)
library(tidyr)
# Reading CSV files
data1 <- read.csv('C:\\Users\\g93116ym\\Dropbox (The University of Manchester)\\Github\\1st-year-PhD-main-function-code\\ResNet50 and ResNet101 csvs and code\\camera_1_trial_1_20230917-112320-0000DLC_resnet50_cvBC15Oct16shuffle1_500000_v2.csv', header = FALSE, nrows = 1000)
data2 <- read.csv('C:\\Users\\g93116ym\\Dropbox (The University of Manchester)\\Github\\1st-year-PhD-main-function-code\\ResNet50 and ResNet101 csvs and code\\camera_1_trial_1_20230917-112320-0000DLC_resnet101_cvBC15Oct16shuffle1_500000_v2.csv', header = FALSE, nrows = 1000)

# Extract the third column of data
data1_confidence <- data1[, 13]
data2_confidence <- data2[, 13]


# Create a data frame to store the data
plot_data <- data.frame(Frame=1:length(data1_confidence), 
                        Resnet50=data1_confidence, 
                        Resnet101=data2_confidence)

# Convert data to long format for plotting
library(tidyr)
long_data <- pivot_longer(plot_data, 
                          cols = c("Resnet50", "Resnet101"), 
                          names_to = "Key", 
                          values_to = "Confidence")

# Make sure the data is numeric
long_data$Frame <- as.numeric(as.character(long_data$Frame))
long_data$Confidence <- as.numeric(as.character(long_data$Confidence))

# Plotting line graphs with ggplot2
library(ggplot2)
ggplot(long_data, aes(x = Frame, y = Confidence, group = Key, colour = Key)) + 
  geom_line() + 
  scale_colour_manual(values = c("blue", "red")) + 
  labs(x = 'Frame', y = 'Confidence', colour = 'Key') + 
  ggtitle('Right eye confidence score of ResNet-50 and ResNet-101') + 
  theme_minimal()


# Load ggplot2 lib
library(ggplot2)

# read csv file
data <- read.csv("C:/Users/g93116ym/Dropbox (The University of Manchester)/1st Year/cvBC15-YMu-2023-10-16/analysis/camera_1_trial_1_2023-09-17-112320-0000DLC_resnet50_cvBC15Oct16shuffle1_500000V2.csv", header = FALSE)

# Select data, ensure the confidence score of snout, right ear and left ear are in right column
frames <- data[,1] # the first line is frame
snout_confidence <- data[,4] # The fourth line is confidence score of snout
right_ear_confidence <- data[,7] # The seventh line is the confidence score of right ear
left_ear_confidence <- data[,10] # The tenth line is the confidence score of left ear
# Create a dataset frame to store the data
plot_data <- data.frame(Frame=frames, Snout=snout_confidence, RightEar=right_ear_confidence, LeftEar=left_ear_confidence)

# Converts data to long format so ggplot2 can plot them more easily
library(tidyr)
long_data <- gather(plot_data, Key, Confidence, -Frame)

# Sort the data in descending order of confidence.
#install.packages("dplyr")
#library(dplyr)
#sorted_data <- long_data %>% 
#  arrange(desc(Confidence))

# Assuming that long_data is already in long format and that ggplot2 has been loaded, it is possible to use ggplot2 as an example.

# Heat mapping using ggplot
#p <- ggplot(long_data, aes(x = Frame, y = Key, fill = Confidence)) + 
#  geom_tile() + # Using geom_tile to create heat maps
#  theme_minimal() + # Use a clean theme
#  labs(x = "Frame Index", y = "Key", fill = "Confidence Level", title = "Confidence Level Heatmap") + # Update Tags
#  scale_fill_gradient(low = "blue", high = "red") # Using gradient colours to fill heat maps


# Display heat mapping
#print(p)

# Load Highcharter lib
library(highcharter)
# Firstly, make sure the data is numerical, as highcharter needs numerical data to plot heat maps
long_data$Frame <- as.numeric(as.character(long_data$Frame))
long_data$Confidence <- as.numeric(as.character(long_data$Confidence))

# Creating heat maps with highcharter
# Using Highcharts' built-in themes
hchart_object <- hchart(long_data, "heatmap", hcaes(x = Frame, y = Key, value = Confidence)) %>%
  hc_title(text = "Confidence Level Heatmap") %>%
  hc_xAxis(title = list(text = "Frame Index")) %>%
  hc_yAxis(title = list(text = "Confidence Score")) %>%
  hc_colorAxis(stops = color_stops(n = 10, colors = c("blue", "red"))) %>%
  hc_legend(title = list(text = "Confidence Level")) %>%
  hc_add_theme(hc_theme_darkunica()) # Using Highcharts' built-in themes

# Load htmlwidgets
library(htmlwidgets)
# Save heat mapping as HTML file in the same folder
saveWidget(hchart_object, file = "Confidence_Level_Heatmap.html")

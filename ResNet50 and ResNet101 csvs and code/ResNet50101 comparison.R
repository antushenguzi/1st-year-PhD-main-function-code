library(ggplot2)
library(tidyr)
# 读取CSV文件
data1 <- read.csv('C:\\Users\\g93116ym\\Dropbox (The University of Manchester)\\Github\\1st-year-PhD-main-function-code\\ResNet50 and ResNet101 csvs and code\\camera_1_trial_1_20230917-112320-0000DLC_resnet50_cvBC15Oct16shuffle1_500000_v2.csv', header = FALSE, nrows = 1000)
data2 <- read.csv('C:\\Users\\g93116ym\\Dropbox (The University of Manchester)\\Github\\1st-year-PhD-main-function-code\\ResNet50 and ResNet101 csvs and code\\camera_1_trial_1_20230917-112320-0000DLC_resnet101_cvBC15Oct16shuffle1_500000_v2.csv', header = FALSE, nrows = 1000)

# 提取第三列数据
data1_confidence <- data1[, 4]
data2_confidence <- data2[, 4]


# 创建一个数据框来存储数据
plot_data <- data.frame(Frame=1:length(data1_confidence), 
                        Resnet50=data1_confidence, 
                        Resnet101=data2_confidence)

# 将数据转换为长格式，用于绘图
library(tidyr)
long_data <- pivot_longer(plot_data, 
                          cols = c("Resnet50", "Resnet101"), 
                          names_to = "Key", 
                          values_to = "Confidence")

# 确保数据是数值型
long_data$Frame <- as.numeric(as.character(long_data$Frame))
long_data$Confidence <- as.numeric(as.character(long_data$Confidence))

# 使用ggplot2绘制折线图
library(ggplot2)
ggplot(long_data, aes(x = Frame, y = Confidence, group = Key, colour = Key)) + 
  geom_line() + 
  scale_colour_manual(values = c("blue", "red")) + 
  labs(x = 'Frame', y = 'Confidence', colour = 'Key') + 
  ggtitle('Snout confidence score of ResNet-50 and ResNet-101') + 
  theme_minimal()


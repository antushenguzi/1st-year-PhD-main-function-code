library(ggplot2)
library(tidyr)
# 读取CSV文件
data1 <- read.csv('C:\\Users\\g93116ym\\Dropbox (The University of Manchester)\\Github\\1st-year-PhD-main-function-code\\ResNet50 and ResNet101 csvs and code\\camera_1_trial_1_20230917-112320-0000DLC_resnet50_cvBC15Oct16shuffle1_500000_v2.csv', header = FALSE, nrows = 1000)
data2 <- read.csv('C:\\Users\\g93116ym\\Dropbox (The University of Manchester)\\Github\\1st-year-PhD-main-function-code\\ResNet50 and ResNet101 csvs and code\\camera_1_trial_1_20230917-112320-0000DLC_resnet101_cvBC15Oct16shuffle1_500000_v2.csv', header = FALSE, nrows = 1000)


# 提取数据
x_snout50 <- data1[, 2]
y_snout50 <- data1[, 3]
x_rightear50 <- data1[, 5]
y_rightear50 <- data1[, 6]
x_snout101 <- data2[, 2]
y_snout101 <- data2[, 3]
x_rightear101 <- data2[, 5]
y_rightear101 <- data2[, 6]

# 创建一个数据框来存储数据
plot_data <- data.frame(
  Frame = 1:1000, 
  X_Snout50 = x_snout50, 
  Y_Snout50 = y_snout50,
  X_RightEar50 = x_rightear50, 
  Y_RightEar50 = y_rightear50,
  X_Snout101 = x_snout101, 
  Y_Snout101 = y_snout101,
  X_RightEar101 = x_rightear101, 
  Y_RightEar101 = y_rightear101
)

# 绘制折线图
ggplot() + 
  geom_line(data = plot_data, aes(x = Frame, y = X_Snout50, group = 1, colour = "Snout50")) + 
  geom_line(data = plot_data, aes(x = Frame, y = Y_Snout50, group = 1, colour = "Snout50")) + 
  geom_line(data = plot_data, aes(x = Frame, y = X_RightEar50, group = 1, colour = "RightEar50")) + 
  geom_line(data = plot_data, aes(x = Frame, y = Y_RightEar50, group = 1, colour = "RightEar50")) + 
  geom_line(data = plot_data, aes(x = Frame, y = X_Snout101, group = 1, colour = "Snout101"), linetype = "dashed") + 
  geom_line(data = plot_data, aes(x = Frame, y = Y_Snout101, group = 1, colour = "Snout101"), linetype = "dashed") + 
  geom_line(data = plot_data, aes(x = Frame, y = X_RightEar101, group = 1, colour = "RightEar101"), linetype = "dashed") + 
  geom_line(data = plot_data, aes(x = Frame, y = Y_RightEar101, group = 1, colour = "RightEar101"), linetype = "dashed") + 
  scale_colour_manual(values = c("Snout50" = "blue", "RightEar50" = "green", "Snout101" = "red", "RightEar101" = "orange")) + 
  labs(x = 'Frame', y = 'Value', colour = 'Legend') + 
  ggtitle('Comparison of Snout and Right Ear Positions for ResNet-50 and ResNet-101') + 
  theme_minimal()


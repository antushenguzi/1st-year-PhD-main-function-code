# 安装并加载 ggplot2 包
install.packages("ggplot2")
library(ggplot2)

# 读取 CSV 文件
data <- read.csv("C:/Users/antus/Dropbox (The University of Manchester)/1st Year/cvBC15-YMu-2023-10-16/analysis/camera_1_trial_1_2023-09-17-112320-0000DLC_resnet50_cvBC15Oct16shuffle1_500000V2.csv", header = FALSE)

# 选择数据，假设你的 CSV 文件中的帧数是第一列，置信度分别在第四、第七、第十列
frames <- data[,1] # 第一列数据为帧数
snout_confidence <- data[,4] # 第四列为 snout 的置信度
right_ear_confidence <- data[,7] # 第七列为右耳的置信度
left_ear_confidence <- data[,10] # 第十列为左耳的置信度

# 创建一个数据框架来容纳这些数据
plot_data <- data.frame(Frame=frames, Snout=snout_confidence, RightEar=right_ear_confidence, LeftEar=left_ear_confidence)

# 将数据转换为长格式，这样 ggplot2 可以更容易地绘制它们
library(tidyr)
long_data <- gather(plot_data, Key, Confidence, -Frame)

# 对数据按照置信度（Confidence）降序排列
install.packages("dplyr")
library(dplyr)
sorted_data <- long_data %>% 
  arrange(desc(Confidence))

# 绘制图形
p <- ggplot(long_data, aes(x=Frame, y=Confidence, color=Key, group=Key)) +
  geom_line() + # 绘制折线图
  theme_minimal() + # 使用简洁的主题
  labs(x="Frame Index", y="Confidence Level", title="Confidence Level Over Frames") + # 添加标签
  scale_color_manual(values=c("blue", "orange", "red")) # 为不同的变量指定颜色

# 显示图形
print(p)

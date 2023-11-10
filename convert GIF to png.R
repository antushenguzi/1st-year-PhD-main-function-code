# 安装和加载magick包
install.packages("magick")
library(magick)

# 读取GIF文件
gif_image <- image_read('C:/Users/g93116ym/Downloads/camera_1_trial_1_2023-09-17-112320-0000dlc_resnet.gif')

# 将每帧转换为单独的图片
gif_frames <- image_convert(gif_image, format = 'png')

# 保存每帧为PNG
image_write(gif_frames, path = 'camera_1_trial_1_2023-09-17-112320-0000dlc_resnet.png')

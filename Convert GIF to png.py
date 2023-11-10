import imageio
import os
# 打开GIF文件
reader = imageio.get_reader(r'F:\dlc237.gif')

# 获取GIF中的帧数
num_frames = reader.get_length()

# 计算间隔
interval = num_frames // 108



# 指定保存图片的文件夹路径
save_path = r'D:\frames'

# 检查文件夹是否存在，如果不存在则创建
if not os.path.exists(save_path):
    os.makedirs(save_path)

# 提取并保存帧
for i in range(0, num_frames, interval):
    frame = reader.get_data(i)
    # 构建每个文件的完整路径
    filename = f'frame_{i//interval+1:03d}.png'
    filepath = os.path.join(save_path, filename)
    imageio.imwrite(filepath, frame)

# 关闭reader
reader.close()

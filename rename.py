import os

# 指定包含图像的目录
directory = r'C:\Users\g93116ym\Dropbox (The University of Manchester)\Github\1st-year-PhD-main-function-code\DLCgiftoPNG'

# 遍历目录中的所有文件
for filename in os.listdir(directory):
    if filename.startswith("frame_") and filename.endswith(".png"):
        # 分解文件名以提取数字，这里假设文件名格式为 "frame_XXX.png"
        number_part = filename.replace('frame_', '').replace('.png', '')  # 去掉 "frame_" 和 ".png"
        number = int(number_part)  # 转换为整数，去掉前导零
        new_filename = f'frame{number}.png'  # 创建新文件名
        old_file = os.path.join(directory, filename)  # 旧文件完整路径
        new_file = os.path.join(directory, new_filename)  # 新文件完整路径
        os.rename(old_file, new_file)  # 重命名文件

print("Renaming completed.")
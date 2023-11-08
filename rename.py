import os

# 指定包含图像的目录
directory = r'C:\Users\g93116ym\OneDrive - The University of Manchester\Year 1\Progression\Progress Report\images\Results\3D recon'

# 遍历目录中的所有文件
for filename in os.listdir(directory):
    if filename.startswith("recon") and filename.endswith(".png"):
        # 分解文件名以提取数字，这里假设文件名格式为 "frame_XXX.png"
        number_part = filename.replace('recon', '').replace('.png', '')  # 去掉 "frame_" 和 ".png"
        number = int(number_part) // 100# 转换为整数，去掉前导零
        new_filename = f'recon{number}.png'  # 创建新文件名
        old_file = os.path.join(directory, filename)  # 旧文件完整路径
        new_file = os.path.join(directory, new_filename)  # 新文件完整路径
        os.rename(old_file, new_file)  # 重命名文件

print("Renaming completed.")
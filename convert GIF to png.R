# Installing and loading magick packages
install.packages("magick")
library(magick)

# Reading GIF files
gif_image <- image_read('F:\\dlc237.gif')

# Get GIF frames
num_frames <- image_info(gif_image)$frames

# Select every 100 frames
frames_to_save <- seq(1, num_frames, by = 100)

# Convert selected frames to individual images and save them
for (i in frames_to_save) {
  frame <- image_read(gif_image[i])
  frame <- image_convert(frame, format = 'png')
  image_write(frame, path = sprintf('frame_%03d.png', i))
}


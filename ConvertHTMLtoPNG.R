# Install and load webshot lib
install.packages("webshot")
webshot::install_phantomjs() # Install Phantomjs
library(webshot)

# Save HTML as a seperate file
html_content <- '<html><body><h1>Hello, World!</h1></body></html>'
writeLines(html_content, "my_html_file.html")

# Convert HTML into png file with webshot
webshot("my_html_file.html", "my_image.png", vwidth = 480, vheight = 320)

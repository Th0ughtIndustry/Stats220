library(magick)

# Read the meme image
meme <- image_read("https://i.etsystatic.com/7545759/r/il/75101a/2874628173/il_fullxfull.2874628173_tlke.jpg")

# Apply background color, border, annotation, and scale to the meme image
meme <- image_background(meme, "blue", flatten = TRUE) %>%
  image_border("red", "10x10") %>%
  image_annotate("Stonks", gravity = "southeast", size = 500, color = "white") %>%
  image_scale("300")

# Create a template with dimensions matching the meme image
template <- image_blank(width = image_info(meme)$width, height = image_info(meme)$height)

# Combine the template and meme images vertically
img <- image_append(c(template, meme))

# Read the French flag image
french_flag <- image_read("https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/255px-Flag_of_France.svg.png")

# Adjust the size of the French flag image to match the dimensions of the meme image
french_flag <- image_scale(french_flag, geometry = "300x300")

# Apply transparency to the French flag image
french_flag <- image_transparent(french_flag, alpha = "white")

# Overlay the French flag on top of the meme image
composite_image <- image_composite(img, french_flag, offset = "+0+0")

# Write the composite image to a file
image_write(composite_image, "composite_meme.png")

# Write the combined image to a file
image_write(img, "My_meme.png")

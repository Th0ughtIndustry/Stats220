library(magick)

template <- image_blank(width = "700",height = "700")
meme <- image_read("https://i.etsystatic.com/7545759/r/il/75101a/2874628173/il_fullxfull.2874628173_tlke.jpg")
#setup
meme <- image_background(meme,"white", flatten = TRUE) %>%
  image_border("red", "10x10") %>%
  image_annotate("Stonks", gravity = "southeast",size = 500, color = "white") %>%
  image_scale("300")

#frame creations
meme1 <- image_background(meme,"blue", flatten = TRUE) %>%
  image_rotate(45) %>%
  image_scale("400")
meme2 <- image_background(meme1,"blue", flatten = TRUE) %>%
  image_rotate(45) %>%
  image_scale("500")
meme3 <- image_background(meme2,"blue", flatten = TRUE) %>%
  image_rotate(45) %>%
  image_scale("600")
meme4 <- image_background(meme3,"blue", flatten = TRUE) %>%
  image_rotate(45)
meme5 <- image_background(meme4,"blue", flatten = TRUE) %>%
  image_rotate(45)
meme6 <- image_background(meme5,"blue", flatten = TRUE) %>%
  image_rotate(45)
meme7 <- image_background(meme6,"blue", flatten = TRUE) %>%
  image_rotate(45)
meme8 <- image_background(meme7,"blue", flatten = TRUE) %>%
  image_rotate(45)
img <- c(template, meme, meme1,meme2,meme3,meme4,meme5,meme6,meme7,meme8)
animation <- image_animate(img,5)
image_write(animation, "my_animation.gif")
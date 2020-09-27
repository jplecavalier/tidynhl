logo_subplot <- ggplot() + theme_sticker()

sticker(
  subplot = logo_subplot,
  package = "tidynhl",
  p_color = gray(0.8),
  h_fill = "black",
  h_color = gray(0.8),
  url = "https://github.com/jplecavalier/tidynhl",
  u_color = gray(0.8),
  u_size = 1.25,
  filename = "man/figures/logo.png"
)

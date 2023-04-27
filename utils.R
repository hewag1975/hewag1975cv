## prepare icons
library(magick)

fls = list.files(
  "pic/raw"
  , pattern = "\\.png$|\\.jpeg|\\.jpg"
  , full.names = TRUE
)

# fls = grep(
#   "profile"
#   , x = fls
#   , value = TRUE
#   , invert = TRUE
# )

pic = Map(
  image_read
  , path = fls
)

## convert to png
png = Map(
  image_convert
  , image = pic
  , format = "png"
)

## rescale
rsc = Map(
  image_scale
  , image = png
  , geometry = "x120"
)

## save
ofl = basename(fls)
ofl = tools::file_path_sans_ext(ofl)
ofl = paste0(ofl, ".png")
ofl = file.path("pic", ofl)

Map(
  image_write
  , image = rsc
  , path = ofl
  , format = "png"
)


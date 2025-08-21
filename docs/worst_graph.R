library(tidyverse)
library(here)
library(paletteer)
library(ggpattern)
library(png)
library(janitor)
library(ggimage)
library(ggpubr)

#read in space launch data
space_launch <- read_csv(here("data", "space_launches.csv"))

cc <- scales::seq_gradient_pal("#FB00FF", "green")(seq(0, 1, length.out = 72))

img<- png::readPNG("/Users/sofiarodas/Documents/MEDS/Summer/EDS-221/eds-221-day8-activity/figs/r-studio-logo.png")

# image path saved
img_path <- here::here("figs", "r-studio-logo.png")
# Check if image is found
if (!file.exists(img_path)) stop("Image not found at:", img_path)

#worst graph
ugly <- ggplot(data = space_launch, aes(x = launch_year, y = variant)) +
 geom_jitter(aes(color = variant)) +
  geom_line(aes(color = variant))+
 scale_colour_manual(values = cc)+
  theme_dark() +
  labs(title = "R", x = "variant", y = "launch.      year")+
  font("axis.title", size = 40, color = "red", face = "bold.italic")

# adds background to graph
ggbackground(ugly, img_path)























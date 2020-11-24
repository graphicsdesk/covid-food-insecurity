#load packages
library(tidyverse)
library(scales)
library(extrafont)
library(hrbrthemes)

#import data
regions <- read_csv("pop.csv")

#colors for text and graph
tfff_dark_gray <- "#545454"
tfff_medium_gray <- "#a8a8a8"
tfff_light_gray <- "#eeeeee"

#colors for regions (4F87EC = color of sad boi)
tfff_blue <- "#4F87EC" 
tfff_purple <- "#8150ED"
tfff_orange <- "#ED8150"
tfff_yellow <- "#EDEA50"
tfff_pink <- "#ED50D5"
tfff_lime <- "#87ED50"
tfff_light_blue <- "#50EDEA"
tfff_red <- "#F53227"

#themes
tfff_theme <- theme_ipsum(base_family = "serif",
                          base_size = 10) +
  theme(legend.position = "none",
        axis.title = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank())

tfff_fill_colors <- scale_fill_manual(values = rev(c(tfff_light_blue,
                                                     tfff_red,
                                                     tfff_purple,
                                                     tfff_orange,
                                                     tfff_yellow,
                                                     tfff_pink,
                                                     tfff_lime,
                                                     tfff_blue))) 

#plot
regions_plot <- ggplot(data = regions, 
                       aes(x = date_label, 
                           y = n, 
                           fill = region)) +
  scale_x_continuous(breaks=pretty_breaks(n=20)) +   
  scale_y_continuous(breaks=pretty_breaks(n=10)) +
  geom_area() +
  tfff_theme +
  tfff_fill_colors +
  labs(title = "Homeless Population of NYC",
       fill = "")

regions_plot + 
  theme(legend.position = "right") 

#saving results of plot as object
regions_plot +
  facet_grid(cols = vars(region)) +
  theme(axis.title = element_blank())
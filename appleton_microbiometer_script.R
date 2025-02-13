library(tidyverse)
library(readr)
setwd("C:/Users/ahouh/OneDrive/hedgerows")
underhillmicro <- read_csv("Appleton_Underhill_W_microBIOMETER_data(in).csv")
###############################################################################
#analyzing how microbe density changes with distance from hedgerow
ggplot(underhillmicro, aes(x = factor(distance_fom_hedgerow_ft), y = microbes_ugC_per_g))+
  geom_point(aes(color = sample_depth)) +
  labs(
    y = "Microbes (ugC/g soil)", x = "Distance from Hedgerow (ft)",
    title = "Microbe Density with Distance from Hedgerow"
  )
ggplot(underhillmicro, aes(x = factor(distance_fom_hedgerow_ft), y = microbes_ugC_per_g))+
  geom_point() +
  facet_wrap(~sample_depth) +
  labs(
    y = "Microbes (ugC/g soil)", x = "Distance from Hedgerow (ft)",
    title = "Microbe Density with Distance from Hedgerow, by Depth"
  )
##########################################################################
ggplot(underhillmicro, aes(x = factor(sample_depth), y = microbes_ugC_per_g)) +
  geom_boxplot() +
  labs(
    y = "Microbes (ugC/g soil)", x = "Sample Depth (cm)",
    title = "How Microbe Density Changes with Soil Depth"
  )
ggplot(underhillmicro, aes(x = factor(sample_depth), y = microbes_ugC_per_g)) +
  geom_point() +
  facet_wrap(~distance_fom_hedgerow_ft) +
  labs(
    y = "Microbes (ugC/g soil)", x = "Sample Depth (cm)",
    title = "How Microbe Density Changes with Soil Depth and Distance"
  )
##########################################################################
underhillmicro |>
  mutate(
    fungal_ugC_per_g = fungal_percent / 100 * microbes_ugC_per_g ,
    bacterial_ugC_per_g = bacterial_percent / 100 * microbes_ugC_per_g
  ) 
#############################################################################
ggplot(underhillmicro, aes(x = factor(sample_depth), y = fungal_percent)) +
  geom_point() +
  facet_wrap(~distance_fom_hedgerow_ft) +
  labs(
    y = "Fungal Percent", x = "Sample Depth"
  )

ggplot(powmicro, aes(x = factor(sample_depth), y = bacterial_percent)) +
  geom_boxplot()+
  labs(
    y = "Bacterial Percent", x = "Sample Depth"
  )


    
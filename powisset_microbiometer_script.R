library(tidyverse)
setwd("C:/Users/ahouh/OneDrive - TTOR/Documents/hedgerows")
powmicro <- read_csv("powisset_hedgerows_microbiom2024.csv")

powmicro |>
  select(hedgerow, sample_depth_cm, distance_from_hedgerow_ft, microbes_ugC_per_gsoil, FB_ratio, fungal_percent, bacterial_percent)

#this is a box plot that shows how microbe density changes with distance from the hedgerow
ggplot(powmicro, aes(x = factor(distance_from_hedgerow_ft), y = microbes_ugC_per_gsoil))+
  geom_boxplot() +
  labs(
    y = "Microbes (ugC/g soil)", x = "Distance from Hedgerow (ft)",
    title = "How Microbe Density Changes with Distance from Hedgerow"
  )

#this box plot shows how microbe density changes with distance from the hedgerow, and is divided by hedgerow type
ggplot(powmicro, aes(x = factor(distance_from_hedgerow_ft), y = microbes_ugC_per_gsoil))+
  geom_boxplot() +
  facet_wrap(~hedgerow) +
  labs(
    y = "Microbes (ugC/g soil)", x = "Distance from Hedgerow (ft)",
    title = "How Microbe Density Changes with Distance from Each Hedgerow Type"
  )

#this box plot shows how microbe density changes with sample depth for each hedgerow
ggplot(powmicro, aes(x = factor(sample_depth_cm), y = microbes_ugC_per_gsoil)) +
  geom_boxplot() +
  labs(
    y = "Microbes (ugC/g soil)", x = "Sample Depth (cm)",
    title = "How Microbe Density Changes with Soil Depth"
  ) +
  facet_wrap(~hedgerow)


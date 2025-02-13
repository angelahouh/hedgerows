library(tidyverse)
library(readr)
setwd("C:/Users/ahouh/OneDrive/hedgerows")
powmicro <- read_csv("powisset_hedgerows_microbiometer.csv")
#####################################################################
#analyzing how microbial density changes with distance from hedgerow
ggplot(powmicro, aes(x = factor(Distance_from_hedgerow_feet), y = microbes_ugC_per_gsoil))+
  geom_boxplot() +
  labs(
    y = "Microbes (ugC/g soil)", x = "Distance from Hedgerow (ft)",
    title = "Microbe Density with Distance from Hedgerow"
  )
#vs
ggplot(powmicro, aes(x = factor(Distance_from_hedgerow_feet), y = microbes_ugC_per_gsoil))+
  geom_boxplot() +
  facet_wrap(~sampling_layer) +
  labs(
    y = "Microbes (ugC/g soil)", x = "Distance from Hedgerow (ft)",
    title = "Microbe Density with Distance from Hedgerow, by Depth"
  )
#vs
ggplot(powmicro, aes(x = factor(Distance_from_hedgerow_feet), y = microbes_ugC_per_gsoil))+
  geom_point(aes(color = sampling_layer)) +
  facet_wrap(~Hedgerow) +
  labs(
    y = "Microbes (ugC/g soil)", x = "Distance from Hedgerow (ft)",
    title = "Microbe Density with Distance from Hedgerow, by Type"
  )
####################################################################
#analyzing relationship between microbe density and sample depth
ggplot(powmicro, aes(x = factor(sampling_layer), y = microbes_ugC_per_gsoil)) +
  geom_boxplot() +
  labs(
    y = "Microbes (ugC/g soil)", x = "Sample Depth (cm)",
    title = "How Microbe Density Changes with Soil Depth, by Type"
  ) +
  facet_wrap(~Hedgerow)
####################################################################
#analyzing relationship between sample depth and fungal/bacterial %
ggplot(powmicro, aes(x = factor(sampling_layer), y = Fungal_percent)) +
  geom_boxplot()+
  facet_wrap(~Hedgerow)+
  labs(
    y = "Fungal Percent", x = "Sample Depth"
  )

ggplot(powmicro, aes(x = factor(sampling_layer), y = Bacterial_percent)) +
  geom_boxplot()+
  facet_wrap(~Hedgerow)+
  labs(
    y = "Bacterial Percent", x = "Sample Depth"
  )

  

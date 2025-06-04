library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)


df <- read.csv("C:/Clases/Data science/Reto 04/Ander_Sainzdelamaza_examen_reto4/netflix.csv")

### Data discovering
summary(df, na.rm = T)

max(df$Minutes, na.rm = T)
max(df$Seasons, na.rm = T)

quantile(df$Minutes, na.rm = T)
quantile(df$Seasons, na.rm = T)

mean(df$Minutes, na.rm = T)
mean(df$Seasons, na.rm = T)

median(df$Minutes, na.rm = T)
median(df$Seasons, na.rm = T)

min(df$Minutes, na.rm = T)
min(df$Seasons, na.rm = T)

miss_var_summary(df)

sd(df$Minutes, na.rm = T)
sd(df$Seasons, na.rm = T)

length(unique(df$type))
length(unique(df$country))
length(unique(df$director))

### Data cleaning
miss_var_summary(df)
vis_miss(df , cluster = T)

df_peliculas <- df %>% filter(type == "Movie") 
df_peliculas <- df_peliculas[,-11]
vis_miss(df_peliculas , cluster = T)
miss_var_summary(df_peliculas)
df_peliculas <- kNN(df_peliculas, k = 3)
miss_var_summary(df_peliculas)

df_series <- df %>% filter(type == "TV Show") 
df_series <- df_series[,-10]
vis_miss(df_series , cluster = T)
miss_var_summary(df_series)
df_series <- kNN(df_series, k = 3)
miss_var_summary(df_series)





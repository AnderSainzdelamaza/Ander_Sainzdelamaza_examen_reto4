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

df_peliculas <- df %>% filter(type == "Movie") 
df_peliculas <- df_peliculas[,-11]
df_peliculas <- kNN(df_peliculas, k = 3)
df_peliculas <- df_peliculas[,-c(11:20)]
miss_var_summary(df_peliculas)

### Histograma
#* @post  /Realizar Histograma
#* @param Transformacion

function(Transformacion = F) {
  histo <- hist(df_peliculas[,10])
  if (Transformacion == T) {
    histo <- hist(log(df_peliculas[,10]))
  } 
  return(list(plot(histo)))
}


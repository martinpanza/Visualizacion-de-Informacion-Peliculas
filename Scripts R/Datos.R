library(stringr)
library(ggplot2)

# Importar
movies <- read.csv("~/Escritorio/Mineria/Proyecto/Datasets/movies.csv")
links <- read.csv("~/Escritorio/Mineria/Proyecto/Datasets/links.csv")
ratings <- read.csv("~/Escritorio/Mineria/Proyecto/Datasets/ratings.csv")
tags <- read.csv("~/Escritorio/Mineria/Proyecto/Datasets/tags.csv")
movie_metadata <- read.csv("~/Escritorio/Mineria/Proyecto/Datasets/movie_metadata.csv")

#Regex - Extraer los links
movie_metadata$movie_imdb_link <- str_extract(movie_metadata$movie_imdb_link,"[[:digit:]]+")
# As Numeric
movie_metadata$movie_imdb_link <- as.numeric(movie_metadata$movie_imdb_link)

# Join 
join <- merge(movie_metadata,links,by.x = "movie_imdb_link",by.y = "imdbId")

# Eliminar repoiazos
clean <- join[ unique(join$movie_imdb_link),]

#Filtrar movies
movies <- merge(movies,movie_metadata[,c(5,11,13,23,26,29)],by.x = "movieId",by.y = "movieId")
movies <- movies[,1:3]

#Filtrar Tags
tags <- merge(tags,movie_metadata,by.x = "movieId",by.y = "movieId")
tags <- tags [,1:4]
tags$tag <- tolower(tags$tag)

#Filtrar Ratings
ratings  <- merge(ratings[,c(2,3)],movie_metadata[,c(13,29)],by.x = "movieId",by.y = "movieId")


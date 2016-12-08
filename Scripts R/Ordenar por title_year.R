movie_metadata <- movie_metadata[order(movie_metadata$title_year),]

write.csv(movie_metadata, file = "movie_metadata.csv", row.names = FALSE)
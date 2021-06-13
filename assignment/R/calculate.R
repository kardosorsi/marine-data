# calculates the distance based on coordinates
calculate_distance <- function(df) {
  return(as.double(unlist(mclapply(mclapply(2:nrow(df),function(x) df[(x-1):x,c('LAT', 'LON')]),function(x) distm(c(x$LON[1], x$LAT[1]), c(x$LON[2], x$LAT[2]),fun = distGeo)))))
}

# constructs the data frame containing the coordinates for the map
construct_coordinate_mtx <- function(max_id, df) {
  coordinate_df <- data.frame(c(df[max_id+1, c('LON')], df[max_id, c('LON')]), c(df[max_id+1, c('LAT')], df[max_id, c('LAT')]), c("start", "end"))
  colnames(coordinate_df) <- c("longitude", "latitude", "type")
  return(coordinate_df)
}

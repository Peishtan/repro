data.getAndClean.Example <- function() {
  d <- data.get.Example()
  names( d ) <- normVarNames( names( d ) )
  d
}

data.get.Example <- function() {
  read.csv('./data/example.csv', head = TRUE, sep = ',' )
}
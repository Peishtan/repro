data.getAndCleanExample <- function() {
  d <- data.get.Example()
  names( d ) <- normVarNames( names( d ) )
  d
}

data.getExample <- function() {
  read.csv('./data/example.csv', head = TRUE, sep = ',' )
}
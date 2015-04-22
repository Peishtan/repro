# source('init.r')

# ----------- # # ----------- # # ----------- #
# DEPENDENCIES

library( reshape )
library( knitr )
library( markdown )
library( rattle )
library( ggplot2 )
library( scales )
library( dplyr )
library( RColorBrewer )

# ----------- # # ----------- # # ----------- #
# SET UP

# helper functions

loadDir <- function( dir ) {
  if ( file.exists( dir ) ) {
    # message( '\n --------------------' )
    # message( '# Loading dir: ', dir )
    files <- dir( dir , pattern = '[.][rR]$' )
    lapply( files, function( file ) loadFile( file, dir ) )
  }
}

loadFile <- function( file, dir ) {
  filename <- paste0( dir, '/', file )
  # message( paste0( '* Loading file: ', filename ) )
  source( filename )
}

setReportingWd <- function() {
  # message( paste0( '\n Working dir is: ', getwd() ) )
  if( basename( getwd() ) == 'templates' ) {
    setwd( '../../' )
    # message( paste0( '\n Changing into dir: ', getwd() ) )
  }
}

knitrGlobalConfig <- function() {
  opts_chunk$set( fig.width = 14, fig.height = 6,
    fig.path = paste0( getwd(), '/reports/output/figures/',
    set_comment = NA ) )
}

# Config env
setReportingWd()
knitrGlobalConfig()

# Load code
dirs <- c( 'extract', 'load', 'transform', 'graphs', 'lib' )
lapply( dirs, loadDir )
source( './reports/run.R' )

# No scientific notation
options( scipen = 999 )
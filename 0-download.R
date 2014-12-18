# Kate E. Jones, et al. PanTHERIA: a species-level database
# of life history, ecology, and geography of extant and
# recently extinct mammals. Ecology 90:2648.
# http://esapubs.org/archive/ecol/E090/184/

pantheria <- "http://esapubs.org/archive/ecol/E090/184/PanTHERIA_1-0_WR05_Aug2008.txt"
download.file(pantheria, destfile = "mammals.txt")

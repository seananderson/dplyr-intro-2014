# Read in, clean, and simplify the data:
mammals <- read.table("mammals.txt", sep = "\t", header = TRUE,
  stringsAsFactors = FALSE)
names(mammals) <- sub("X[0-9._]+", "", names(mammals))
names(mammals) <- sub("MSW05_", "", names(mammals))
mammals <- dplyr::select(mammals, Order, Binomial,
  AdultBodyMass_g, AdultHeadBodyLen_mm, AgeatFirstBirth_d,
  GestationLen_d, HomeRange_km2, LitterSize, MaxLongevity_m,
  SexualMaturityAge_d)
names(mammals) <- gsub("([A-Z])", "_\\L\\1", names(mammals), perl = TRUE)
names(mammals) <- gsub("^_", "", names(mammals), perl = TRUE)
mammals[mammals == -999] <- NA
names(mammals)[names(mammals) == "binomial"] <- "species"
mammals <- dplyr::tbl_df(mammals) # for prettier printing

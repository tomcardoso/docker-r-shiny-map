install.packages("renv", quiet = TRUE)

package_list <- c(
  "here",
  "leaflet",
  "dplyr",
  "feather",
  "stringr",
  "lubridate",
  "scales",
  "glue"
)

renv::init()
renv::install(package_list)
renv::snapshot()
renv::status()
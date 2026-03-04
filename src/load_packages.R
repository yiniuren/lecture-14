# Load required packages; install from CRAN if not present. Run from project root.

packages <- c("tidyverse", "tidymodels")

for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, repos = "https://cloud.r-project.org")
  }
  library(pkg, character.only = TRUE)
}

# Create frequency plot for each variable in train.csv. Run from project root.
# Writes one PDF per variable to output/figures/<varname>.pdf.

train <- read.csv("data/processed/train.csv", sep = ";")

dir.create("output/figures", recursive = TRUE, showWarnings = FALSE)

for (col in names(train)) {
  x <- train[[col]]
  n_unique <- length(unique(x))
  pdf(paste0("output/figures/", col, ".pdf"), width = 7, height = 5)
  if (n_unique <= 15) {
    barplot(table(x), main = col, xlab = col, ylab = "Frequency", col = "steelblue")
  } else {
    hist(x, main = col, xlab = col, ylab = "Frequency", col = "steelblue", breaks = 30)
  }
  dev.off()
}

message("Wrote ", ncol(train), " PDFs to output/figures/")

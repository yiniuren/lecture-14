# Combine red and white wine quality CSVs and add binary is_red column.
# Run from project root.

red <- read.csv("data/raw/winequality-red.csv", sep = ";")
white <- read.csv("data/raw/winequality-white.csv", sep = ";")

red$is_red <- 1L
white$is_red <- 0L

combined <- rbind(red, white)

dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)
write.table(combined, "data/processed/output.csv", sep = ";", row.names = FALSE)

message("Combined dataset: ", nrow(combined), " rows x ", ncol(combined), " columns")

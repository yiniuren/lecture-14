# Split output.csv into 80% train and 20% test. Run from project root.
# Seed 42 for replicability.

dat <- read.csv("data/processed/output.csv", sep = ";")

set.seed(42)
n <- nrow(dat)
train_idx <- sample(n, size = round(0.8 * n))

train <- dat[train_idx, ]
test <- dat[-train_idx, ]

write.table(train, "data/processed/train.csv", sep = ";", row.names = FALSE)
write.table(test, "data/processed/test.csv", sep = ";", row.names = FALSE)

message("Train: ", nrow(train), " rows x ", ncol(train), " columns")
message("Test:  ", nrow(test), " rows x ", ncol(test), " columns")

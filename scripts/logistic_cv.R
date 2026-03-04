# Logistic regression to predict quality (binarized) using all other features.
# Uses tidyverse + tidymodels; assesses accuracy via 5-fold CV. Run from project root.

source("src/load_packages.R")

train <- read_delim("data/processed/train.csv", delim = ";", show_col_types = FALSE)
train <- train %>%
  mutate(quality_class = factor(if_else(quality >= 6, "good", "not_good"))) %>%
  select(-quality)

recipe <- recipe(quality_class ~ ., data = train)

model <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")

wf <- workflow() %>%
  add_recipe(recipe) %>%
  add_model(model)

set.seed(42)
folds <- vfold_cv(train, v = 5, strata = quality_class)

fit_cv <- fit_resamples(
  wf,
  folds,
  metrics = metric_set(accuracy, roc_auc, sens, spec)
)

metrics <- fit_cv %>% collect_metrics()
print(metrics)

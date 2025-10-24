# 02_analysis.R
source("/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/code/00_setup.R")

# Load cleaned dataset
dat <- read_csv("/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/data/analysis_ready.csv", show_col_types = FALSE)

# Table 1: descriptives
tab1 <- dat %>%
  filter(!is.na(educ3), !is.na(yrarri)) %>%
  count(yrarri, educ3) %>%
  group_by(yrarri) %>%
  mutate(pct = round(n / sum(n) * 100, 1))

write_csv(tab1, "/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/outputs/table_descriptives.csv")

# Plot descriptives
p1 <- ggplot(tab1, aes(x = yrarri, y = pct/100, fill = educ3)) +
  geom_col(position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Education distribution by year of arrival in Canada (GSS 2017)",
    x = "Year of Arrival", y = "Percentage", fill = "Education level"
  ) +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/outputs/descriptive_plot.png", p1, width = 9, height = 5, dpi = 300)

# Regression

dat$educ3 <- as.factor(dat$educ3) #had to recode as factor for this to work

fit <- polr(educ3 ~ yrarri, data = dat, Hess = TRUE) #Error when trying to run "polr response must be a factor"

modelsummary(
  fit,
  output = "/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/outputs/table_regression.csv",
  exponentiate = TRUE,
  gof_omit = "AIC|BIC|Log.Lik"
)

# Predicted probabilities
eff <- effects::Effect("yrarri", fit)
png("/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/outputs/regression_predictions.png", width = 900, height = 600)
plot(eff,
     main="Predicted probabilities of education levels by year of arrival",
     xlab="Year of arrival", ylab="Predicted probability")
dev.off()

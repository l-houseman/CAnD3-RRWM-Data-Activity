# 01_clean.R
source("/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/code/00_setup.R")

# Import raw CSV #Had to change file path
gss <- read_csv("/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/data/gss-12M0025-E-2017-c-31_F1.csv") %>%
  clean_names()

# Recode education
gss <- gss %>%
  mutate(
    educ3 = case_when(
      ehg3_01b %in% c(1, 2) ~ "HighSchoolOrLess",
      ehg3_01b %in% c(3, 4, 5) ~ "PostSecondaryNonUniversity",
      ehg3_01b %in% c(6, 7) ~ "UniversityPlus",
      TRUE ~ NA_character_
    ),
    educ3 = factor(educ3,
                   levels = c("HighSchoolOrLess",
                              "PostSecondaryNonUniversity",
                              "UniversityPlus"),
                   ordered = TRUE)
  )

# Recode year of arrival
gss <- gss %>%
  mutate(
    yrarri = ifelse(yrarri %in% c(96,97,98,99), NA, yrarri),
    yrarri = factor(yrarri,
                    levels = 1:14,
                    labels = c("pre1946","1946-59","1960-64","1965-69",
                               "1970-74","1975-79","1980-84","1985-89",
                               "1990-94","1995-99","2000-04","2005-09",
                               "2010-14","2015-17"),
                    ordered = TRUE)
  )

# Save cleaned dataset
write_csv(gss, "/Users/leahj/Desktop/CAnD3/CAnD3/CAnD3_RWork/RRWM Exercise/CAnD3-RRWM-Exercise/Partner Submission/data/analysis_ready.csv")
message("Data cleaning complete, saved to data/analysis_ready.csv")

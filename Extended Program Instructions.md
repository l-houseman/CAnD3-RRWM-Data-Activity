# Replicability Instructions – CAnD3 RRWM Exercise
### author: "Leah Houseman"
### date: "`r.Sys.Date()`"

## Table of Contents

- Overview
- 1. Survey Design Notes
- 2. Software Requirements
- 3. Data Access
- 4. Data Preparation
- 5. Descriptive Statistics
- 6. Regression Model

### Overview
This analysis investigates fertility intentions among Canadians aged 14–49 using the 2017 General Social Survey (GSS). The goal is to identify associations between fertility intentions and self-rated physical health, controlling for demographic variables.

--------------------------------------------------------------------------------

### 1. Survey Design Notes

> ⚠️ This analysis does **not** apply survey weights or design corrections. Results reflect **unweighted estimates**.

---

### 2. Software Requirements

Use **R** (version ≥ 4.2 recommended). Required packages:

- tidyverse
- tidymodels
- knitr
- kableExtra
- gt
- broom
- ggplot2
- naniar

Session Info:
- R version and platform, locale settings, and attached packages with versions documented in `session_info.txt`
---

### 3. Data Access

- Dataset: 2017 General Social Survey (GSS), Statistics Canada  
- File: `Dataset_gss-12M0025-E-2017-c-31_F1.csv`  
- Access: Available to CAnD3 fellows via Canvas. For external use, refer to the Data Accessibility Statement.

Place the dataset in your working directory and name the data frame `data`.

---

### 4. Data Preparation

#### Sample Restrictions

- **Age filter**: Keep only respondents under age 50 (`AGEC < 50`).
- **Fertility eligibility**: Exclude respondents or spouses who answered "Yes" to being told they cannot have (more) biological children. These are coded as `1` in variables `FI_140` and `FI_240`.
- Treat values `6–9` in these variables as missing and exclude them.

#### Outcome Variable: Fertility Intentions (`CH3YRS`)

- Source: `FI_105`
- Recode:
  - Values `1` and `2` → “Yes”
  - Values `3`, `4`, and `5` → “No”
  - Values `6–9` → treated as missing and excluded
- Convert to a binary factor variable with levels: `"1_Yes"` and `"2_No"`

#### Independent Variables

**Self-Rated Physical Health (`SRPH`)**
- Source: `SRH_110`
- Recode:
  - `1` → “Excellent”
  - `2` → “Very Good”
  - `3` → “Good”
  - `4` → “Fair”
  - `5` → “Poor”
- Reverse the scale so that “Poor” = 1 and “Excellent” = 5
- Treat values `6–9` as missing and exclude them
- Convert to an ordered factor

**Sex (`SEX`)**
- Recode:
  - `1` → “Male”
  - `2` → “Female”
- Convert to factor

**Marital Status (`MARSTAT`)**
- Recode:
  - `1` → “Married”
  - `2` → “Common Law”
  - `3`, `4`, `5` → “Widowed/Separated/Divorced”
  - `6` → “Single”
- Convert to factor

**Education Level (`EDULVL`)**
- Source: `EHG3_01B`
- Recode:
  - `1` → “Less than High School”
  - `2` → “High School or Equivalent”
  - `3`, `4`, `5` → “Post-Secondary below Bachelor’s”
  - `6` → “Bachelor’s Degree”
  - `7` → “Post-Bachelor Level”
- Treat values `96–99` as missing and exclude them
- Convert to factor

**Age (`AGEC`)**
- Retain as-is (whole number format)

#### Final Filtering

Exclude any rows with missing values in the following variables:

- `CH3YRS`, `SRPH`, `AGEC`, `SEX`, `MARSTAT`, `EDULVL`

---

### 5. Descriptive Statistics 

- Generate a table showing the percent distribution of fertility intentions (CH3YRS) by education level (EDULVL) using gt(). Expected results include higher percentege of positive fertility intention for education levels lower than the post bachelor level.
- Table was generated using the `gt` package and saved with `gtsave()`
- The descriptive table is saved in the repository folder and can be viewed directly:
`edulvl_table`

---

### 6. Regression Model

- **Model type**: Logistic regression
- **Outcome**: Fertility intentions (`CH3YRS`)
- **Predictors**: `SRPH`, `SEX`, `EDULVL`, `MARSTAT`, `AGEC`
- **Seed**: Set to `567` to ensure reproducibility of any random processes
- **Reference Categories** are the **first level** of each factor variable:
    - `SEX`: “Male”
    - `EDULVL`: “Less than High School”
    - `MARSTAT`: “Married”
    - `SRPH`: “Poor”
    
    
- **Logistic regression results table should include the following columns:**
  - Term: The name of the predictor variable or level (e.g., SEX2_Female, SRPH5_Excellent)
  - Odds Ratio (OR): The exponentiated coefficient from the logistic regression
  - 95% Confidence Interval:
  - CI Lower: Lower bound of the confidence interval for the OR
  - CI Upper: Upper bound of the confidence interval for the OR
  - P-value: The significance level of the predictor
- These values are extracted using broom::tidy() with the arguments: `tidy(model, exponentiate = TRUE, conf.int = TRUE)`
- Table was generated using the `gt` package and saved with `gtsave()`
- Expected results: The regression table is saved in the repository folder and can be viewed directly:
`LogR_table`

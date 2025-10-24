# Program (Analysis Design)

## Research Question
How does the year of arrival in Canada shape immigrants’ educational attainment?
We examine whether more recent immigrant cohorts have higher levels of education compared to earlier arrivals.

## Analytic Sample
- Respondents from the 2017 General Social Survey (Canada, Cycle 31: Family).
- Restricted to foreign-born individuals (immigrants with valid YRARRI values).
- Adults aged 18+.
- Listwise deletion for missing values on the DV and key IVs.
- Weighting: apply WGHT_PER (person-level survey weight).

## Variables & Recodes
**DV: Education** (EHG3_01B)
   HighSchoolOrLess: less than high school (1) or high school diploma/equivalent (2)
   PostSecondaryNonUniversity: trade certificate (3), college/CEGEP (4), or university certificate below bachelor (5)
   UniversityPlus: bachelor’s degree (6) or graduate/professional (7)
   Recode 96–99 as missing.
   Treated as ordered factor with three categories.
**IV: Year of Arrival** (YRARRI)
   14 ordered categories, from pre1946 (1) to 2015–2017 (14).
   Keep full detail; no collapsing.
   Recode 96–99 as missing.


## Tables
1. **Table 1 (Descriptive Statistics):**
   Cross-tabulation of education levels by year of arrival.
   Weighted proportions (using WGHT_PER).
   Report percentages and N for each cell.
2. **Table 2 (Regression Results):**
Ordered logistic regression:
   Education = f(YearofArrival + Controls)
DV = ordered education level (HighSchoolOrLess < PostSecondary < UniversityPlus).
IV = year of arrival (14 categories, ordered).
Report odds ratios, 95% CIs, N, pseudo R², weight application.

## Exports
- education distribution
- predicted probabilities of education level by year of arrival

## Run Order
1. `code/00_setup.R`  – load packages, set options, define helper functions.
2. `code/01_clean.R`  – import GSS, recode variables, define analytic sample, save analysis-ready data.
3. `code/02_analysis.R` – compute descriptives and run regression.
4. `code/03_export.R` – export visualization.

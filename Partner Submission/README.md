# CAnD3-RRWM
Research Replicability and Workflow Management exercise using GSS data.

## Purpose
Produce one descriptive statistics table and one regression table from the GSS Public Use Microdata, with a minimal reproducible workflow.

## How to run (high level)
1. Obtain the GSS public dataset (see `DATA_ACCESS.md`). Do **not** commit raw data to Git.
2. Place the raw files under `data/` (or use your own local path but keep scripts with **relative paths**).
3. Run scripts in order:
   - `code/00_setup.R`
   - `code/01_clean.R`
   - `code/02_analysis.R`
   - `code/03_export.R`
4. The exported tables will appear in `outputs/`.

## Environment
- R version 4.x
- Suggested packages: tidyverse, haven, labelled, modelsummary (or stargazer), broom
- Reproducibility: record `sessionInfo()` or use `renv` (optional).

## Notes
- Use GSS weights as appropriate (e.g., WTSS or WTSSALL) and document your choice in README and tables.
- Keep all file paths **relative**; avoid absolute paths.

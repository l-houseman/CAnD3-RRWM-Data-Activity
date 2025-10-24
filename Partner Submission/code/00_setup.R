# 00_setup.R
# Install required packages (only run once)
# install.packages(c("tidyverse", "readxl", "janitor", "MASS", "modelsummary", "effects"))

# Load libraries
library(tidyverse)
library(readxl)
library(janitor)
library(MASS)          # for polr()
library(modelsummary)  
library(ggplot2)
library(effects)

# Global options
options(stringsAsFactors = FALSE, scipen = 999)
set.seed(1234)

message("Setup complete.")


# PART 1: BLOCK RANDOMIZATION WITH blockrand PACKAGE
# -------------------------------------------------------

# Install and load the blockrand package
if (!require("here")) install.packages("here")
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("blockrand")) install.packages("blockrand")
library(here)
library(tidyverse)
library(blockrand)

# Block Randomization for 3 Treatment Groups
# -----------------------------------------------------------

# Set seed for reproducibility
set.seed(42)

# For each Create a block randomization with:
# - 3 treatment groups (1=F2F, 2=App_Expert, 3=App_NonExpert)
# - Block sizes of 3 
# - Total sample size of 90 participants

# First, create block randomization without stratification
low <- blockrand(
  n = 90,               # Total sample size
  num.levels = 3,       # Number of treatment groups
  levels = c("F2F", "App_Expert", "App_NonExpert"),  # Group labels
  block.sizes = c(3),   # Block sizes (will be used randomly)
  id.prefix = "L",      # Prefix for participant IDs
  stratum = "Low"       # Single stratum name
)

high <- blockrand(
  n = 90,               # Total sample size
  num.levels = 3,       # Number of treatment groups
  levels = c("F2F", "App_Expert", "App_NonExpert"),  # Group labels
  block.sizes = c(3),   # Block sizes (will be used randomly)
  id.prefix = "H",      # Prefix for participant IDs
  stratum = "High"      # Single stratum name
)

randomization_df = rbind(low, high)
write_csv(here('data', 'randomization.csv'))

# Check distribution of treatments
table(basic_randomization$treatment)

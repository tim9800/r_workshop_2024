
################################################################################
##  THIS IS SYNTHETIC DATA. The following script was used to generate         ##
##  synthetic data from real participant data collected for the Neurobiology  ##
##  Youth Follow-up Study. See https://pubmed.ncbi.nlm.nih.gov/34145010/      ##
################################################################################

# Load and install required packages
# install.packages("synthpop")
library(synthpop)
library(tidyverse)


# Read in csv
source("./NeurobiologyStudyII.r")

# Select relevant variables
data2 <- data %>%
  # Only baseline visits
  filter(redcap_event_name == "baseline_arm_1") %>%
  # Select relevant variables
  select(age, sex_at_birth.factor, clinical_stage.factor, sofas_score, isi_total,
         qidsc_total_score,
         scid_completed.factor,
         matches("scid_mdd___[0-9].factor$")) %>%
  # Simplify current and lifetime MDD variables
  mutate(scid_mdd_current = fct_recode(
    scid_mdd___1.factor,
    Yes = "Checked",
    No = "Unchecked"
  ),
  scid_mdd_lifetime = fct_recode(
    scid_mdd___3.factor,
    Yes = "Checked",
    No = "Unchecked"
  )) %>%
  # Remove extraneous MDD dummy variables
  select(-matches("scid_mdd___[0-9].factor"))
  

# Define rules for the synthetic dataset
rules.list <- list(
  sex_at_birth.factor = "is.na(age)",
  clinical_stage.factor = "is.na(age)",
  sofas_score = "is.na(age)",
  isi_total = "is.na(age)",
  qidsc_total_score = "is.na(age)",
  scid_completed.factor = "is.na(age)",
  scid_mdd_lifetime = "scid_mdd_current == 'Yes'",
  scid_mdd_current = "is.na(scid_completed.factor)",
  scid_mdd_lifetime = "is.na(scid_completed.factor)"
)

rules.value.list <- list(
  sex_at_birth.factor = "NA",
  clinical_stage.factor = "NA",
  sofas_score = "NA",
  isi_total = "NA",
  qidsc_total_score = "NA",
  scid_completed.factor = "NA",
  scid_mdd_lifetime = "Yes",
  scid_mdd_current = "No",
  scid_mdd_lifetime = "No"
)


# Synthesise
synth <- syn(data2, rules = rules.list, rvalues = rules.value.list, seed = 123)
synth_data <- synth$syn

# Post processing
synth_data <- synth_data %>%
  mutate(
    # When is.na(scid_completed.factor), make current and lifetime mdd equal "No"
    # For reasons unknown, synthpop won't respect this rule when passing it to syn()
    across(
      .cols = c(scid_mdd_current, scid_mdd_lifetime),
      .fns = ~ case_when(
        is.na(scid_completed.factor) ~ "No",
        TRUE ~ .x
      )
    ),
    # Introduce some 999s for the sake of the workshop
    across(
      .cols = c(sofas_score, isi_total, qidsc_total_score),
      .fns = ~ ifelse(is.na(.x), 999, .x)))



# Write to csv
write.csv(synth_data, 'neurobio_synthetic.csv', row.names = F)

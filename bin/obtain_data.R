library(NHANES)
library(dplyr)

#proportions representing a simple random sample
prop <- as.numeric(table(NHANES$Race1)/nrow(NHANES))

set.seed(1000) #reproducible

#take sample from NHANESraw that represents a simple random sample
dat <- NHANESraw %>%
  
  #add sample weights
  mutate(weight = case_when(Race1 == "Black" ~ prop[1],
                            Race1 == "Hispanic" ~ prop[2],
                            Race1 == "Mexican" ~ prop[3],
                            Race1 == "White" ~ prop[4],
                            Race1 == "Other" ~ prop[5])) %>%
  group_by(Race1) %>%
  sample_n(10000 * weight) %>% #sample from each according to prop to obtain 10000 obvs in total
  select(-weight) #remove weighting column

rm(prop)

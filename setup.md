---
title: Setup
---
Please make sure the following packages are loaded before starting this lesson:

~~~
library(NHANES)
library(ggplot2)
library(cowplot)
library(jtools)
library(dplyr)
library(tidyr)
library(Hmisc)
~~~
{: .language-r}

To obtain the data for this lesson, run the following code:

~~~
# proportions representing a simple random sample
prop <- as.numeric(table(NHANES$Race1)/nrow(NHANES))

set.seed(1000) # reproducible

# take sample from NHANESraw that represents a simple random sample
dat <- NHANESraw %>%
  
  # add sample weights
  mutate(weight = case_when(Race1 == "Black" ~ prop[1],
                            Race1 == "Hispanic" ~ prop[2],
                            Race1 == "Mexican" ~ prop[3],
                            Race1 == "White" ~ prop[4],
                            Race1 == "Other" ~ prop[5])) %>%
  group_by(Race1) %>%
  sample_n(10000 * weight) %>% # sample from each according to prop to obtain 10000 obvs in total
  select(-weight) # remove weighting column

rm(prop)
~~~
{: .language-r}

Our data comes from the National Health and Nutrition Examination Survey (NHANES), run by the CDC in the US. This data describes the demographics, physical properties, health and lifestyle of children and adults. Every year 5,000 participants are enrolled and the data is used for research and policy-making purposes. We are using data from the 2009-2010 and 2011-2012 editions of this survey. You can find out more about NHANES on the CDC website [here](https://www.cdc.gov/nchs/nhanes/).

In the original data, particular subsets of the population are oversampled, such that conclusions based on the data are also representative of ethnic minorities. This introduces complications into the analysis. Therefore, we are using a subset of the data that can be treated as a simple random sample of the US population. This subset is suitable for educational purposes, but may not be useful for research applications. The subsetting is done by the code above.



{% include links.md %}

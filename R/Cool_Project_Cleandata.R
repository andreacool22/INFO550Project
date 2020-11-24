#! /usr/bin/env Rscript

# load packages
library(dplyr)
library(tidyverse)
library(lubridate)
library(table1)

# read data
Cool_Project_RawData <- read.csv(file = 'data/Cool_Project_RawData.csv')

# clean data
Cool_Project_Data <- Cool_Project_RawData %>%
filter(!is.na(new_start)) %>%
 mutate(start_dt = ymd(startdate),
 		 study_int = interval(start = ymd("2019/1/1"), end = ymd("2020/4/30")),
         treat_site = factor(treat_site, levels = c(1:11), 
                             labels = c("BJI", "BSI", "ENT", "GI",
                                        "LRI", "SSI", "SST", "UTI",
                                        "UND", "Unknown", "Other")),
         treat_site_cat = ifelse(treat_site == "UTI", treat_site,
                                 ifelse(treat_site == "LRI", treat_site, 
                                        ifelse(treat_site == "SST", treat_site, 11))),
         treat_site_binary = ifelse(treat_site == "UTI",treat_site, 11),
         treat_site_binary = factor(treat_site_binary, levels = c(8,11), labels = c("UTI", "Other")),
         uti = ifelse(treat_site == "UTI", 1, 0),
         sbar = factor(sbar, levels = c(0:3), 
                       labels = c("No", "Yes", "Not Applicable",
                                  "Unknown")),
         criteria_met = factor(criteria_met, levels = c(0:3), 
                               labels = c("No", "Yes", "Not Applicable",
                                          "Unknown")),
         fac_name = factor(fac_name, levels = c(1:5), 
                           labels = c("Nursing Home A", 
                                      "Nursing Home B",
                                      "Nursing Home C", 
                                      "Nursing Home D", 
                                      "Other")),
         indicatn = factor(indicatn, levels = c(1:6), 
                               labels = c("Active Infection (Imperic)", 
                                          "Active Infection (modification based on test result)", 
                                          "Prophylaxis",
                                          "Non Infectious",
                                          "Not Documented",
                                          "Other")),
         # eliminating UTIs with NAs, except for Nursing Home C
         new_start = ifelse(fac_name == "Nursing Home C", new_start, 
                            ifelse(treat_site == "UTI", 
                            ifelse(sbar == "Not Applicable", 0,
                                   ifelse(sbar == "Unknown", 0, new_start)), new_start)),
         new_start = factor(new_start, labels = 
                              c("Transfer Orders", "New Start")),
         year.int = (year + 2016),
         month.name = month(month, label = TRUE),
         month.int = as.integer(month(month, label = TRUE))) %>%
unite(q.year, year.int, quarter, sep = " Q") %>% 
mutate(q.year = ifelse(q.year == "NA_4", "2018_4", q.year),
         q.year = as.factor(q.year),
         q.year.i = as.integer(q.year),
         
         new_start = factor(new_start, labels = 
                              c("Transfer Orders", "New Start")),
         
         year.int = (year + 2016)) %>%
unite(m.year, year.int, month.int, sep = "_") %>%
mutate(m.year = ifelse(m.year == "NA_11", "2018_11", m.year), 
         m.year = as.factor(m.year),
         m.year = fct_relevel(m.year, 
                              c("2018_1", "2018_2", "2018_3", "2018_4",  "2018_5",  
                                "2018_6",  "2018_7",
                                "2018_8", "2018_9", "2018_10", "2018_11", "2018_12", 
                                "2019_1", 
                                "2019_2", "2019_3", "2019_4", 
                                "2019_5", "2019_6", "2019_7",
                                "2019_8", "2019_9", "2019_10",
                                "2019_11", "2019_12", "2020_1", 
                                "2020_2", "2020_3", "2020_4")),
          rec.dur.uti = ifelse(abxnm == "CEPHLX", 5,
                          ifelse(abxnm == "NITRO", 5,
                                 ifelse(abxnm == "SULFAET", 3,
                                 ifelse(abxnm == "DOXY", 5,
                                 ifelse(abxnm == "AMOXWC", 5,
                                 ifelse(abxnm == "CIPRO", 3,
                                 ifelse(abxnm == "LEVO", 3,
                                 ifelse(abxnm == "AMOX", 5,
                                 ifelse(abxnm == "CEFUR", 5, NA ))))))))),
         ov_rec = ifelse(days_of_therapy > rec.dur.uti, 1, 0),
         un_rec = ifelse(days_of_therapy <= rec.dur.uti, 1, 0)) %>%
filter(start_dt %within% study_int)

# save data
write.csv(Cool_Project_Data, "data/Cool_Project_Data.csv", quote=FALSE, row.names=FALSE)

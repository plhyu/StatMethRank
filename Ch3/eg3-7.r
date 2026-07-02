# Example 3.7
# Data from the public opinion survey
library(StatMethRank)
data(HKPOS)
# Expand the contingency table to case form data
freq_data = as.data.frame.table(HKPOS)
case_data = freq2case(freq_data)
# Incomplete sample
independence.test(case_data$Resp, case_data$Edu, method = "spearman")
# Reduced sample
ind = (is.na(case_data$Edu) + is.na(case_data$Resp) == 0)
Edu_reduced = case_data$Edu[ind]
Resp_reduced = case_data$Resp[ind]
independence.test(Edu_reduced, Resp_reduced, method = "spearman")

" Purpose: This file performs discretization of data
  Input:  iqr_cleaned_data.csv was created using interquartile range analysis
          to remove outliers from the raw dataset.
  Returns: n/a
  
  Lessons learned:
          1) R transactions and discretization of data
          2) adding rows to existing dataframes
"

install.packages("funModeling")
library(funModeling)
install.packages("dplyr")
library(dplyr)
head(iqr_cleaned_data, 1)
d_bins = funModeling::discretize_get_bins(data = iqr_cleaned_data, input = c("price", "item_id",
          "cluster"), n_bins = 3)
#find the data type of d_bins (a data frame)
class(d_bins)
#see what is stored in d_bins
print(d_bins)
#see the structure of d_bins
str(d_bins)
#adding a row to a data frame
d_bins <- rbind(d_bins, data.frame(
  variable = "cluster",
  cuts = "1|2|3"
))

discretized_data = funModeling::discretize_df(data=iqr_cleaned_data, data_bins = d_bins, 
                  stringsAsFactors = T)
Hmisc::describe(discretized_data)


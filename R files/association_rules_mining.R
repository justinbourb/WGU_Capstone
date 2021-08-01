" Purpose: This file performs association rules mining (ARM)
  Input:  iqr_cleaned_data.csv was created using interquartile range analysis
          to remove outliers from the raw dataset.
  Returns: n/a
  
  Lessons learned:
          1) using arlues package 
          2) R transactions and discretization of data
          3) histogram analysis for discretization
"

#install arules
install.packages("arules")
library(arules)
#import data frame from the csv file
iqr_cleaned_data <- read.csv("iqr_cleaned_data_with_clusters.csv") 
#convert the data frame to the transaction format
#this is a required step for further analysis with the arules package
tdata <- as (iqr_cleaned_data, "transactions")
#create the most frequent items
frequentItems <- eclat(tdata, parameter = list(supp = 0.07, maxlen = 15))
#inspect the frequent items
inspect(frequentItems)

head(iqr_cleaned_data,3)
summary(tdata)
image(tdata)
inspect(tdata)
hist(iqr_cleaned_data$cluster)

test_tdata <- transactions(split(iqr_cleaned_data[,"price"], iqr_cleaned_data[,"item_id"]))
inspect(test_tdata)

"
Discretization levels are based on histogram analysis
Price discretization:
0-60 = Low price
60-150 = Medium price
150+ = High price

Item_ID discretization:
1 = Low
2-5 = Medium
5+ = High

#The default discretization conversion was grouping clusters
Cluster discretization:
1 = 1
2 = 2
3 = 3
"
" Purpose: This file performs association rules mining (ARM)
  Input:  1)iqr_cleaned_data.csv was created using interquartile range analysis
            to remove outliers from the raw dataset.
          2)discretized_data is generated from discretization_of_data.R
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
#create a transaction data type from the discretizated data
dis_tdata <- transactions(discretized_data)
#find the most frequent items
frequentItems <- eclat (dis_tdata, parameter = list(supp = 0.07, maxlen = 15))
inspect(frequentItems)
#plot the frequent items as a barplot
arules::itemFrequencyPlot(dis_tdata, topN=10, type="absolute", main="Item Frequency")
# Min Support as 0.001, confidence as 0.8.
#calculate the association rules using the apriori method
rules <- apriori (dis_tdata, parameter = list(supp = 0.001, conf = 0.5))
# sort by 'high-confidence' rules.
rules_conf <- sort (rules, by="confidence", decreasing=TRUE) 
#sort by 'high-lift' rules.
rules_lift <- sort (rules, by="lift", decreasing=TRUE)
# show the support, lift and confidence for all rules
inspect(head(rules_lift)) 
#results, rules seem to be nonsensical they associate sellers with items,
#items with sellers and clusters with sellers.
#Desired result would be items with items purchased together
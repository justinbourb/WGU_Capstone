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

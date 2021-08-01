" Purpose: import raw data from the csv file and
          remove outliers
  Input: working_data.csv was created using JOIN in MySQL to combine
          the needed data from multiple tables
  Returns: This script removes the outliers from the working_data.csv
          using the interquartile range on the price($price) and number of items
          purchased($item_id).
          Items that are 1.5 times greater than the third quartile or 
          1.5 times smaller than the first quartile are considered outliers and
          are removed.
  Sources: https://www.statology.org/remove-outliers-r/
          This site explains how to remove rows based on outliers in a single column.
  Lessons learned:
          1) importing csv files into R
          2) data manipulation (calculating interquartile range, plotting, etc)
          3) cleaning data via interquartile range calculations
          4) accessing data frame via variables inside functions
            a) data[,variable] is equivalent to data$name
"
#import data into R from a csv file
#note: <- is used for storing information into variables
working_data <- read.csv("working_data.csv")

#create function to remove data outliers by IQR
remove_outliers_by_iqr_func <- function(data_set, column_to_filter_by){
  #[,variable] is equivalent to data$name
  #calculate the first quartile
  q1 <- quantile(data_set[,column_to_filter_by], .25)
  #calculate the third quartile
  q3 <- quantile(data_set[,column_to_filter_by], .75)
  #calculate the interquartile range
  interqr <- IQR(data_set[,column_to_filter_by])
  #remove outliers 1.5 times beyond q1 and q3 based on column_to_filter_by
  return_value <- subset(data_set, data_set[,column_to_filter_by]>(q1 - 1.5*interqr) 
                         & data_set[,column_to_filter_by]<(q3 + 1.5*interqr))
  return(return_value)
}
#price_iqr_filter is our cleaned dataset
#outlier item prices have been removed
price_iqr_filter <- remove_outliers_by_iqr_func(data_set = working_data, column_to_filter_by = "price")
#calculate percent reduction in data
price_outliers_percent_reduction <- (100-(dim(price_iqr_filter)/dim(working_data))*100)
print(price_outliers_percent_reduction)
dim(price_iqr_filter)
dim(working_data)

#112650 is the number of rows before outlier removal
#104223 is the number of rows after IQR outlier removal
#This is a 7.480692 percent reduction in the number of rows
write.csv(price_iqr_filter, "C:\\git_local\\BrazilianEcommerceData\\iqr_cleaned_data.csv", row.names=FALSE)

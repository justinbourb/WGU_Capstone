" Purpose: Import cleaned data from the csv file andkmeans clutering in R
  Input:  iqr_cleaned_data.csv was created using interquartile range analysis
          to remove outliers from the raw dataset.
  Returns: This script assigns the cluster number to each row of the dataset

  Lessons learned:
  1) importing csv files into R
  2) kmeans clusters analysis in R, based on two rows of a data frame
  3) adding columns to a data frame  (cluster number)
  4) barplotting in R
"
iqr_cleaned_data <- read.csv("iqr_cleaned_data.csv", 
set.seed(1)
#visualize a summary of the dataset
summary(iqr_cleaned_data)
#columns 3,4 are price and order_id (number of items ordered)
iqr_cleaned_data[,3:4]
#perform kmeans analysis based on price and # of items ordered
clusters <- kmeans(iqr_cleaned_data[,3:4],3)
#save the cluster number in the dataset
iqr_cleaned_data$cluster <- as.numeric(clusters$cluster)
#visulize the distribution of clusters with a barplot
#a table of the dataset is required to create the barplot
#else each row will be a column
barplot(table(iqr_cleaned_data$cluster), col = c("red", "green", "blue"), main = "Cluster Distribution",
        xlab = "Cluster Number")
write.csv(iqr_cleaned_data, "C:\\git_local\\BrazilianEcommerceData\\iqr_cleaned_data_with_clusters.csv", row.names=FALSE)

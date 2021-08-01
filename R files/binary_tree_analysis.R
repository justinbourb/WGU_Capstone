" Purpose: Create and visualize a binary tree
  Input:  iqr_cleaned_data_with_clusters.csv was created using 
       interquartile range analysis and kmeans cluster analysis
  Returns: n/a

  Lessons learned:
    1) creating and visualizing binary trees with rpart
"

#install rpart to create the tree
install.packages("rpart")
library(rpart)
install.packages("rpart.plot")
library(rpart.plot)

#install rattle and RcolorBrewer to view the tree
install.packages("rattle")
library(rattle)
install.packages("RColorBrewer")
library(RColorBrewer)

#load the data from the csv
iqr_cleaned_data <- read.csv("iqr_cleaned_data_with_clusters.csv") 
#create the tree with clusters modeled as price
mytree <- rpart(
  iqr_cleaned_data$cluster ~ iqr_cleaned_data$price,
  data = iqr_cleaned_data,
  method = "class"
)
print(mytree)
#plot the tree
fancyRpartPlot(mytree, caption = "price Tree")

#create the tree with clusters modeled as price and # items
mytree_priceanditems <- rpart(
  iqr_cleaned_data$cluster ~ iqr_cleaned_data$price + iqr_cleaned_data$item_id,
  data = iqr_cleaned_data,
  method = "class"
)
#plot the tree
fancyRpartPlot(mytree_priceanditems, caption = "price and items tree")
#results price and price and item trees are the same

plot(mytree_priceanditems)

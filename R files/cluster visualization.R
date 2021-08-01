" Purpose: This file creates a cluster visualization
  Input:  iqr_cleaned_data.csv was created using interquartile range analysis
          to remove outliers from the raw dataset.
  Returns: n/a
  Requirements: This file requires ggpubr and factoextra which only run
		on R 4+. This file was run in RGui 64-bit because Anaconda
		comes with R 3.6 as of 07-2021.

  Lessons learned:
  1) RGui vs. Rstudio
  2) fviz_cluster visualization
  3) R package installation troubleshooting
"
#Install ggpubr and factoextra for visualization
install.packages("ggpubr")
library(ggpubr)
install.packages("factoextra")
library(factoextra)
#set working directory where data is found
setwd("C:/git_local/BrazilianEcommerceData")
#import data from csv
iqr_cleaned_data <- read.csv("iqr_cleaned_data.csv") 
#set the seed so the data is reproducable
set.seed(1)
#perform kmeans cluster analysis
clusters <- kmeans(iqr_cleaned_data[,3:4],3)
#visualize the kmeans data
#clusters is the kmeans cluster data
#iqr_cleaned_data[,3:4] is the orignal data
#[,3:4] is the price and number of items bought columns
fviz_cluster(clusters, data = iqr_cleaned_data[,3:4],
             palette = c("#2E9FDF", "#00AFBB", "#E7B800"), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
             )
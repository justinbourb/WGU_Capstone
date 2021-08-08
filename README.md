# WGU_Capstone


Note: This project has been shelved in favor of WGU_Capstone_Python.  R is not a user friendly language and I've found using Python to be more productive.  

The working_dataset.csv is based upon the Brazilian E-Commerce Public Dataset.  Working_data.csv was created using JOIN in MySQL to combine
          the needed data from multiple tables in the Brazlian dataset.  
Brazilian E-Commerce Public Dataset by Olist is licensed under CC BY-NC-SA 4.0.  
Source: https://www.kaggle.com/olistbr/brazilian-ecommerce?select=olist_order_items_dataset.csv  
Owner: https://olist.com/  
License: https://creativecommons.org/licenses/by-nc-sa/4.0/  
  
Lessons learned (an incomplete list):  
<i>remove_outliers_by_IQR.R</i>
1. importing csv files into R  
2. data manipulation (calculating interquartile range, plotting, etc)  
3. cleaning data via interquartile range calculations  
4. accessing a data frame via variables inside of functions  
a. data[,variable] is equivalent to data$name  

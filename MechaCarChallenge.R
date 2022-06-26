install.packages("tidyverse")
library(dplyr)

# Read CSV as a dataframe
MechaCar_mpg <- read.csv(file = "MechaCar_mpg.csv",check.names = FALSE,stringsAsFactors = FALSE)

# Perform linear regression using the lm() function
lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data= MechaCar_mpg)

#generate summary statistics
summary(lm) 

# Read CSV as a table
suspension_data <- read.table(file = "Suspension_Coil.csv", sep = ",",header = TRUE)

# creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation
total_summary <- suspension_data %>% summarize(Mean = mean(PSI),Median = median(PSI),Variance = var(PSI),SD= sd(PSI))

# creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI),Variance = var(PSI),SD= sd(PSI))

#generate 50 randomly sampled data points
sample_suspension <- suspension_data %>% sample_n(50)

#compare sample versus population means
all_lots_test <- t.test(sample_suspension$PSI, mu=mean(suspension_data$PSI)) 

#Lot1 data sampling
lot1_data <- sample_n(subset(suspension_data, Manufacturing_Lot== "Lot1"),50)

# Lot1 t test 
lot1_test <- t.test(lot1_data$PSI, mu=mean(suspension_data$PSI)) 

#Lot2 data sampling
lot2_data <- sample_n(subset(suspension_data, Manufacturing_Lot== "Lot2"),50)

# Lot2 t test 
lot2_test <- t.test(lot2_data$PSI, mu=mean(suspension_data$PSI))

#Lot3 data sampling
lot3_data <- sample_n(subset(suspension_data, Manufacturing_Lot== "Lot3"),50)

# Lot3 t test 
lot3_test <- t.test(lot3_data$PSI, mu=mean(suspension_data$PSI))

install.packages("tidyr")
install.packages("car")
# Step 1: Load Necessary Libraries
library(ggplot2)  # For data visualization
library(dplyr)    # For data manipulation
library(tidyr)    # For reshaping data
library(car)      # For Levene's test

# Step 2: Load the Data
combined_survey_data <- read.csv(file.choose())  # Choose your dataset file

# Step 3: Summary Statistics for Each Category
cat("Ambiance Summary:\n")
print(summary(combined_survey_data$Ambiance))

cat("\nDrink Quality Summary:\n")
print(summary(combined_survey_data$Drink_Quality))

cat("\nPrice Summary:\n")
print(summary(combined_survey_data$Price))

cat("\nCustomer Service Summary:\n")
print(summary(combined_survey_data$Customer_Service))

# Step 5: Perform Levene's Test
cat("\nLevene's Test Results:\n")
levene_ambiance <- leveneTest(Ambiance ~ Coffee_Shop, data = combined_survey_data)
cat("Ambiance:\n")
print(levene_ambiance)

levene_drink_quality <- leveneTest(Drink_Quality ~ Coffee_Shop, data = combined_survey_data)
cat("\nDrink Quality:\n")
print(levene_drink_quality)

levene_price <- leveneTest(Price ~ Coffee_Shop, data = combined_survey_data)
cat("\nPrice:\n")
print(levene_price)

levene_customer_service <- leveneTest(Customer_Service ~ Coffee_Shop, data = combined_survey_data)
cat("\nCustomer Service:\n")
print(levene_customer_service)

# Step 6: Calculate Total Average Satisfaction Score
combined_survey_data <- combined_survey_data %>%
  rowwise() %>%
  mutate(Total_Average = mean(c(Ambiance, Drink_Quality, Price, Customer_Service), na.rm = TRUE))

# Step 7: Perform ANOVA on Total Averages
anova_total_average <- aov(Total_Average ~ Coffee_Shop, data = combined_survey_data)
cat("\nANOVA Results for Total Average Satisfaction Scores:\n")
print(summary(anova_total_average))

# Step 8: Visualization - Overall Average Ratings
ggplot(combined_survey_data, aes(x = Coffee_Shop, y = Total_Average, fill = Coffee_Shop)) +
  geom_boxplot() +
  labs(
    title = "Overall Average Rating by Coffee Shop",
    x = "Coffee Shop",
    y = "Average Score Across All Categories"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Step 9: Visualization - Individual Category Ratings by Store
long_data <- combined_survey_data %>%
  pivot_longer(cols = c("Ambiance", "Drink_Quality", "Price", "Customer_Service"), 
               names_to = "Category", values_to = "Score")

ggplot(long_data, aes(x = Coffee_Shop, y = Score, fill = Coffee_Shop)) +
  geom_boxplot() +
  facet_wrap(~Category, scales = "free") +
  labs(
    title = "Individual Category Ratings by Coffee Shop",
    x = "Coffee Shop",
    y = "Score"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Step 10: Visualization - Average Scores for Each Category Per Store
# Calculate total average satisfaction
combined_survey_data <- combined_survey_data %>%
  rowwise() %>%
  mutate(Total_Average = mean(c(Ambiance, Drink_Quality, Price, Customer_Service), na.rm = TRUE))

# Plot total average satisfaction
ggplot(combined_survey_data, aes(x = Coffee_Shop, y = Total_Average, fill = Coffee_Shop)) +
  geom_boxplot() +
  labs(
    title = "Overall Average Satisfaction by Coffee Shop",
    x = "Coffee Shop",
    y = "Average Satisfaction Score"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Step 11: Perform ANOVA for Individual Categories
anova_ambiance <- aov(Ambiance ~ Coffee_Shop, data = combined_survey_data)
anova_drink_quality <- aov(Drink_Quality ~ Coffee_Shop, data = combined_survey_data)
anova_price <- aov(Price ~ Coffee_Shop, data = combined_survey_data)
anova_customer_service <- aov(Customer_Service ~ Coffee_Shop, data = combined_survey_data)

cat("\nANOVA Results for Individual Categories:\n")
cat("Ambiance:\n")
print(summary(anova_ambiance))

cat("\nDrink Quality:\n")
print(summary(anova_drink_quality))

cat("\nPrice:\n")
print(summary(anova_price))

cat("\nCustomer Service:\n")
print(summary(anova_customer_service))


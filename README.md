# Analyzing Student Satisfaction in Local Coffee Shops

## Introduction
Coffee shops are an important part of student life — spaces for studying, socializing, and relaxing. Despite the number of local coffee shops near SJSU, many students default to larger chains like Starbucks. This project investigates whether satisfaction differs meaningfully across local and chain coffee shops, and what that means for how local businesses can compete.

## Problem Statement
Local coffee shops near SJSU offer unique, student-focused environments but struggle to attract students compared to larger chains. Understanding whether — and why — satisfaction differs across shops is critical to helping these businesses compete effectively.

## Objectives
1. Identify whether satisfaction differs significantly across coffee shops in four categories: Ambiance, Drink Quality, Price, and Customer Service.
2. Provide actionable recommendations for local coffee shops to strengthen their appeal to students.
3. Help local businesses build a stronger connection with the SJSU student community.

## Data Set
Survey data collected from SJSU students (n = 240; 60 responses per shop) across four coffee shops: **7Leaves, Break Time, Gong Cha,** and **Starbucks**.

**Variables:**
- `Coffee_Shop` — shop name (categorical)
- `Ambiance` — satisfaction with atmosphere (1–5)
- `Drink_Quality` — satisfaction with beverage quality (1–5)
- `Price` — satisfaction with price fairness (1–5)
- `Customer_Service` — satisfaction with staff friendliness/efficiency (1–5)
- `Total_Average` — mean of the four category scores

[View Dataset](Combined_Coffee_Shop_Survey_Data_Quality.csv)

## Tools
RStudio — `ggplot2`, `dplyr`, `tidyr`, `car`

[View R script](coffee_satisfaction_script.R)

## Methodology
Satisfaction was compared across the four coffee shops using one-way ANOVA, run separately for each category and for the overall average score.

**Hypotheses:**
- H₀: μ₁ = μ₂ = μ₃ = μ₄ (mean satisfaction is equal across all shops)
- Hₐ: at least one shop's mean satisfaction differs

**Assumptions tested before running ANOVA:**
- **Equal variances** — Levene's test, run separately for each category
- **Significance level** — α = 0.05 throughout

## Exploratory Data Analysis

#### Category Ratings by Shop
<img width="678" height="449" alt="image" src="https://github.com/user-attachments/assets/b81dd4e6-8db2-4dc3-bfc2-c291f8b8deac" />


Boxplots of each satisfaction category (Ambiance, Drink Quality, Price, Customer Service) across the four shops show broadly overlapping distributions, with medians clustered around 3 out of 5 for every shop and category.

#### Overall Average Satisfaction
<img width="639" height="441" alt="image" src="https://github.com/user-attachments/assets/0fa4b980-eadf-4260-a303-d36546d2c205" />


The overall average satisfaction score (mean of all four categories) was also visualized by shop. Medians were close across all four shops, with some differences in spread — Starbucks showed the widest range including one high outlier, while other shops showed more consistent distributions.

## Statistical Testing

#### Levene's Test (Equal Variances)
| Category | F value | p-value |
|---|---|---|
| Ambiance | 0.378 | 0.769 |
| Drink Quality | 0.960 | 0.412 |
| Price | 0.402 | 0.751 |
| Customer Service | 0.173 | 0.914 |

All p-values exceed 0.05, so the equal-variance assumption for ANOVA is satisfied for every category.

#### ANOVA Results
| Category | F value | p-value | Result |
|---|---|---|---|
| Ambiance | 0.606 | 0.611 | No significant difference |
| Drink Quality | 1.291 | 0.278 | No significant difference |
| Price | 0.932 | 0.426 | No significant difference |
| Customer Service | 2.255 | 0.083 | No significant difference |
| Total Average | 0.830 | 0.479 | No significant difference |

All p-values are above the α = 0.05 threshold. We fail to reject the null hypothesis in every category — satisfaction with ambiance, drink quality, price, and customer service does not differ significantly across 7Leaves, Break Time, Gong Cha, and Starbucks.

## Conclusion
Across all four measured categories, student satisfaction is statistically indistinguishable between local coffee shops and Starbucks. This means ambiance, drink quality, price, and customer service — the factors this study measured — do not explain why students gravitate toward one shop over another. The preference gap is more likely driven by factors outside this survey's scope, such as proximity to campus, WiFi reliability, or safety/location.

## Recommendations
- **Loyalty programs** — incentivize repeat visits with rewards for frequent purchases
- **Student ambassadors** — recruit students to promote local shops within their peer networks
- **University partnerships** — collaborate with campus clubs and organizations to increase visibility
- **Differentiate on unmeasured factors** — since core satisfaction categories are statistically equivalent, competing on WiFi reliability, study-friendly space, or menu creativity may matter more than closing gaps in the categories tested here

## Limitations
- The four categories tested (ambiance, drink quality, price, customer service) may not capture the factors that actually drive shop choice — location, convenience, and WiFi were identified as likely differentiators but weren't measured directly
- Sample is limited to SJSU students and may not generalize to other campuses or demographics
- Self-reported satisfaction ratings on a 1–5 scale are inherently subjective and may not reflect actual visit frequency or spending behavior

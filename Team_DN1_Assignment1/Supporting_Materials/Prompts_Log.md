
# 📋 Lab 1 – SuperStore Prompts Consolidated

## Sales & Revenue Analyst Prompts
1. Go to bucket named "mgmt599-senthilm-data-lake" and analyze the dataset
"Sample - Superstore.csv " and and suggest cleaning steps (handling missing
values, converting data types etc.
2. Go to bucket named "mgmt599-senthilm-data-lake" and analyze the dataset
"Sample - Superstore.csv " and suggest getting data statistics for this data.
3. Can you please me create a bigquery to get the - Total sales: $X - Profit margin: Y% -
Top category: Z
4. Can you please help Create atleast 3 visualizations exploring different aspects:
    - Sales distribution by category
    - Profit trends over time
    - Regional performance comparison
5. Can you please help create visualizations for:
    - Sales trends over time with seasonality
    - Revenue drivers and correlations
    - Predictive factors for high-sales periods
6. Can you please help Create bar charts for sales by categorical variables.
7. I am a Sales & Revenue Analyst. Please refer the data from "Sample -
Superstore.csv" and the analysis from "SalesAnalysisSuperStore" pdf. Using DIVE Framework, answer:
    - What drives sales performance?
    - Which factors impact revenue most?
    - Where are the growth opportunities?
    - Clearly label each stage with findings and recommendations.

## Customer Behavior Analyst Prompts
1. Using the data frame df, do an analysis to answer the following focus questions
and required analysis
Focus Questions:
    - Who are most valuable customers?
    - What patterns exist?
    - How to improve retention?
Required Analysis:
    - Customer segmentation and profiling
    - Purchase pattern analysis
    - Customer lifetime value indicators
2. Create useful visualizations for the findings above.
3. Explain the findings from the visualizations created.
4. Apply this framework to the analysis above
D - Discover (Basic Finding)
Start with a simple query and finding. Document:
Your initial question
The basic answer/metric
Your first impression
I - Investigate (Dig Deeper)
Ask "why" questions about your discovery:
Why does this pattern exist?
What factors contribute to this?
How does it vary across dimensions?
Use Gemini to help generate hypotheses and additional queries.
V - Validate (Challenge Assumptions)
Question your findings:
What could make this conclusion wrong?
What data limitations exist?
Are there alternative explanations?
E - Extend (Strategic Application)
Transform insights into action:
What should the business do?
How can we measure impact?  

## Product Performance Analyst Prompts
1. The original dataset has 9,994 rows which indicates the number of
product orders from all unique order ID.
    - Identify missing values
        - The dataset has no missing values
    - Convert zip column to appropriate data type
        - Convert zip column to appropriate data type as STRING.
    - Date range based on order_date and ship_date
        - Order date range is from January 2019 to December 2022. 
    - ship_date should not be before order_date, identify for inconsistent
        - There is no inconsistency found where ship_date is dated prior to order_date.
    - Ensure category and subcategory are consistently categorized
        - Category and Subcategory are categorized consistently.
    - Check if the calculation of profit divided by sales is equal to profit_margin
        - Profit margin calculation is correct throughout the dataset
2. Calculate profit margin: Assuming profit_margin = (sales - cost) / sales. We don't have a 'cost' column, so we can use 'profit' instead: profit_margin = profit
/ sales. Handle cases where sales is 0 to avoid division by zero. Plot: Profit Margin vs. Discount Correlation analysis
3. Analyze profitability by Category by year. Visualize the top performing categories by Profitability by year. Analyze and Visualize the top performing sub-categories by Profitability by year
4. Analyze which product_name and subcategory are often discounted. Count occurrences of each product name and subcategory in discounted items. Visualize the top 10 most discounted subcategories.
5. Based on the analysis and findings from the provided code, here's an analysis
structured around the Discover, Investigate, Validate, and Extend (DIVE) stages:
6. Investigate the existence of an
'optimal' discount level that balances increased sales volume with
maintaining healthy profit margins. This could involve analyzing profitability
within specific discount ranges for diSerent product groups.
7. Based on the negative profit analysis,
identify specific subcategories or products where high discounts are most
detrimental to profitability. Recommend reducing or eliminating high
discounts for these items, or exploring alternative pricing strategies.

## Regional/Operational Analyst Prompts
1. How does performance vary by location?
2. Discover stage: Make a chart that shows Sales by region.
3. For Investigate stage, Why is the sales in West highest? Looking at number of orders, quantity, profit, profit margin,
identify patterns to explain why sales in West could be higher than
other regions. Based on the available columns in this dataframe df, identify 3
hypothesis that can explain sales. eg: Does zipcode or geographic
clusters influence sales
4. For Validate stage, Validate the sales comparison, I ran SQL on Bigquery to
compare the reported sales vs Sales generated by Gemini. What are limitations in the data that prevent understanding
regional differences in sales.
5. For Extend stage, Based on the above regional analysis, what are the growth
opportunities, If we pursue the above strategy, what should the KPI to measure
success and what would be the right threshold for this KPI, What are the risks to pursuing the above strategy of improving
performance in Central and South regions, What are the risks to pursuing the above strategy of improving
performance in Central and South regions.
6. Make a chart that shows Sales by region
7. Why is the sales in West highest? 
8. Looking at number of orders, quantity, profit, profit margin, identify patterns
to explain why sales in West could be higher than other regions. Based on the available columns in this dataframe df, identify 3 hypothesis that
can explain sales. eg: Does zipcode or geographic clusters influence sales
9. What are limitations in the data that prevent understanding regional differences
in sales
10. Based on the above regional analysis, what are the growth opportunities
11. If we pursue the above strategy, what should the KPI to measure success and
what would be the right threshold for this KPI
12. What are the risks to pursuing the above strategy of improving performance in
Central and South regions
13. Required Analysis: Analyse sales and profit by region and arrange in descending order of
sales. What operational factors impact success? (Shipping and operational
efficiency)
    - Using the following multiple PROMPTS to guide the operational analysis:
        - Based on the columns, what would you define as operational factors
        - How does each of these operational factor impact sales and profit
        - Implement code to execute each of the above analysis, summarise findings as visuals
        - Summarize findings: Present the observations for each operational factor and their potential impact on sales and profit.
        - Market opportunity identification
14. Based on all the analysis done so far, what would you define as the Market opportunity

## Prompts on Team Deliverables
1. I'm sharing with you a data from "Sample - Superstore.csv". Please refer the
attached pdf which contains the DIVEFramework analysis from Sales & Revenue
Analyst, Customer Behavior Analyst, Product Performance Analyst,
Regional/Operational Analyst. Can you please help create Executive Summary,
answering and explaining
    - Top 3 unified insights from all analyses
    - Critical business challenges identified
    - Recommended priority actions
2. I'm sharing with you a data from "Sample - Superstore.csv". Please refer the
attached pdf which contains the DIVEFramework analysis from Sales & Revenue
Analyst, Customer Behavior Analyst, Product Performance Analyst,
Regional/Operational Analyst. Also, please refer the Executive summary. Can you
please help create an Integrated Analysis explaining
3. What individual findings from Sales & Revenue Analyst, Customer Behavior Analyst,
Product Performance Analyst, Regional/Operational Analyst connect
    - Cross-functional implications
    - Conflicting findings and resolution
4. I'm sharing with you a data from "Sample - Superstore.csv". Please refer the
attached pdf which contains the DIVEFramework analysis from Sales & Revenue
Analyst, Customer Behavior Analyst, Product Performance Analyst,
Regional/Operational Analyst. Also, please refer the Executive summary. Can you
please help create a Strategic Recommendations, explaining
    - 5 specific, actionable recommendations
    - Implementation timeline (30-60-90 days)
    - Success metrics for each recommendation
5. I'm sharing with you a data from "Sample - Superstore.csv". Please refer the
Executive Summary, Integrated Analysis and Strategic Recommendations. Can you
please help create a Team Presentation of 5 slides, on the below title and explain
    - Problem statement
    - Key findings from each analyst
    - Integrated insights
    - Top 3 recommendations
    - Expected impact
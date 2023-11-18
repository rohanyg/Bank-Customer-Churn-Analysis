# Bank-Customer-Churn-Analysis
In this project , we aim to perform the data analysis on bank customers data to identify the reasons why customers leave the bank. Tools used for the analysis are Power BI and SQL.

## Table of Contents
- [Project Overview](#project-overview)
- [Problem Statement](#problem-statement)
- [Data Source](#data-source)
- [Data Cleaning/Preparation](#data-cleaningpreparation)
- [Live Dashboard](#live-dashboard)
- [Inferences](#inferences)
- [Recommendations](#recommendations)
- [Limitations](#limitations)
  
### Project Overview
1. The aim of this project is to analyze the bank customers data to identify the factors contributing the customers churn using Power BI and SQL.
2. To gather valuable insights from the analysis to understand patterns, trends and correlations associated with bank customers data.
3. To provide recommendations to the bank to mitigate churn.it allows banks to address customer needs, improve retention strategies, and save costs associated with acquiring new customers. Identifying at-risk customers allows banks to implement personalized retention strategies, improving customer experience and reducing attrition rates.

### Problem Statement
The bank is facing significant challenge with high churn rates and it is aiming to reduce costs linked to customer acquisition. Understanding the reasons behind customer churn is pivotal for tailoring services and implementing targeted retention efforts. This allows the bank to address customer needs, refine retention strategies and identify at-risk customers for personalized retention strategies.

### Data Source
- Domain:
Banking Domain
- Dataset Name:
Bank_Churn.csv
ActiveCustomer.xlsx
CreditCard.xlsx
CustomerInfo.csv
ExitCustomer.xlsx
Gender.xlsx
Geography.xlsx
- Dataset Type: 
Excel and CSV Datatypes
- Dataset Size: 
10,000 customers data spanning 4 years.

### Data Cleaning/Preparation

- Checked for presence of duplicates and eliminated them.
- Removing irrelevant columns which does not associated with customer churn.
- Data type standardization.
- Formatting dates for consistency.
- Formatted numerical data for consistency.
- Handling the text values and removed special characters in name
- 

### Live Dashboard:
Power BI:



### Inferences
inferences from the analysis:
1. Total customers associated with the bank are 10,000.
2. Churn Rate is 20.37 % .Which is higher than the healthy range , churn rate of 5-7% annually is considered average in the banking industry. So the bank should consider this as the serious problem and take necessary actions.
3. Retention Rate 79.63 %. High retention rate indicates customer satisfaction and loyalty. Anything above 90% might be considered healthy.
4. Active Customer Rate 51.51 %. Desired range for active customer rate is above 70-80%. These desired ranges can vary based on the bank's services and customer engagement strategies.
5. Credit Card Holder Rate is 70.55 %. Bank is doing good in this case. Typically, a rate higher than 50-60% might be considered good, but this can vary widely.
6. Customers have a varying number of products, typically ranging from 1 to 4. Products Per Customers is 1.53. Around 3-4 products per customer is often seen as a good benchmark.
7. Average Tenure is 5 Years, Indicating the level of loyalty and the bank's ability to retain its customer base. 
8. average age 39 . 
9. Average Balance Per Customer is around 75k . Customers with a higher balance churn more which would be worrying to the bank as this impacts their source of loan capital.
10. Churn Rate is minimum in Year 2016 that is 19.27 % and maximum in year 2017 that is 22.35 % . Also we have forecasted the Churn rate for the next four quarter predicting churn rate between
lower bound 15 0r 16 % and the upper bound is 24 to 25 %  with 95 % confidence level.
11. Churn rate is high in Female that is 60 % and on the other hand 40 % in case of male.
12.	Churn Rate is highest in Germany that is  32.44 % and for both france and spain churn rate is around 16%. 


### Recommendations:
1. Enhance customer service, resolving customers issues , offer personalized experiences to increase satisfaction
2. Retention Programs: Implement loyalty programs, rewards for long-term customers to reduce churn.
3. Communication: Regularly engage with customers via multiple channels, offering relevant updates and personalized offers.
4. Collect and act on customer feedback to address pain points and enhance overall satisfaction
5. Customer Engagement: Encourage active participation in banking activities, offer exclusive benefits, and personalize services based on customer behavior.
6. Train staff to recommend complementary products or services to existing customers based on their profiles and behavior.
7. Customer Segmentation: Segment customers based on behavior and preferences, offering tailored packages to each segment. Like Investment products and insurance , credit cards , loans
8. Financial Advisory Services: Provide personalized financial advice to customers to help them optimize their finances.Targeted Loan Products
9. all these increses Average Customer Lifetime Value (CLV):The predicted net profit attributed to the entire future relationship with a customer.
10. Upselling and Cross-Selling: Encourage additional purchases or upgrades of existing services by showcasing added value.
11. Profitability: Longer-tenured customers tend to be more profitable as they utilize more services and products over time.  by incresing average tenure.
12. Cost Savings: Acquiring new customers is more expensive than retaining existing ones; longer tenure indicates lower customer acquisition costs.



### Limitations 
- The datasets might lack certain contextual information about the employees, such as personal challenges, external factors affecting their work, or specific project details. This missing context could limit the depth of your analysis.
-The analysis might not cover all relevant factors contributing to attrition, such as organizational culture, leadership styles, or macroeconomic factors. A more comprehensive analysis would require a broader scope.
- The analysis appears to focus on descriptive statistics and visualization. While these provide insights into historical data, incorporating predictive models could enhance the project by forecasting future attrition trends.
- Implementing A/B testing methodologies could provide a more scientific approach to understanding the impact of specific interventions or policies on employee attrition.
- Machine learning algorithms, like classification or clustering, could offer deeper insights. Not utilizing advanced ML techniques might limit the depth of your analysis.


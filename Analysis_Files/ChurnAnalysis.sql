Create database churnanalysis;

show databases;

use churnanalysis;

# first 10 records 
select * 
from bank_churn
order by CustomerId asc
limit 10;

# last 5 records 
select * 
from bank_churn
order by CustomerId desc
limit 5;


# Checked For Duplicates
select CustomerId, count(*) as count
from bank_churn
group by CustomerId
having count(*) > 1;

-- > No duplicates found in data

# range of CustomerId
select min(CustomerId) as mincustid , max(CustomerId) as maxcustid
from bank_churn;

# Total Customers :

select count(distinct CustomerId) as TotalCustomer
from bank_churn;

# minimum and maximum of Credit Scores
select min(CreditScore) as minimum_CreditScore, max(CreditScore) as maximum_CreditScore  
from bank_churn;

# Average CreditScore 
select round(avg(CreditScore),0) as averageCreditScore 
from bank_churn;


# Distinct Countries 

select distinct Geography as countries
from bank_churn;

# Total Number of France Customers and their percent of total

select count(distinct CustomerId) as FranceCustomers
from bank_churn
where Geography = "France";

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as TotalCustomer
from bank_churn
where Geography = "France";


# Total Number of Spain Customers

select count(distinct CustomerId) as FranceCustomers
from bank_churn
where Geography = "Spain";

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as TotalCustomer
from bank_churn
where Geography = "France";


# Total Number of Germany Customers and their percent of total

select count(distinct CustomerId) as FranceCustomers
from bank_churn
where Geography = "Germany";

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as TotalCustomer
from bank_churn
where Geography = "Germany";

# Total Number of female customers and their percent of total

select count(distinct CustomerId) as FemaleCustomers
from bank_churn
where Gender = "Female";

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as TotalCustomer
from bank_churn
where Gender = "Female";

# Total Number of male customers and their percent of total;

select count(distinct CustomerId) as MaleCustomers
from bank_churn
where Gender = "Male";

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as TotalCustomer
from bank_churn
where Gender = "Male";


# Range of Age 
select min(age) as minimum_age, max(age) as maximum_age  
from bank_churn;

# Average Age 
select round(avg(age),0) as averageage 
from bank_churn;

# Range of Tenure
select min(tenure) as minimum_tenure, max(tenure) as maximum_tenure  
from bank_churn;

# Average Tenure
select round(avg(tenure),0) as averagetenure
from bank_churn;

# Range of Balance
select min(Balance) as minimum_Balance, max(Balance) as maximum_Balance
from bank_churn;

# Average Balance
select round(avg(Balance),2) as averagebalance
from bank_churn;

# Range of Number of Products
select min(NumOfProducts) as minimum_NumOfProducts, max(NumOfProducts) as maximum_NumOfProducts
from bank_churn;

# Average of Number of Products
select round(avg(NumOfProducts),2) as average_productscount
from bank_churn;

# Total Number of Credit Card Holders 

select count(distinct CustomerId) as Credit_Card_Holders 
from bank_churn
where HasCreditCard = "Yes";

# Credit Card Holder Rate 

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as Credit_Card_Holder_Rate 
from bank_churn
where HasCreditCard = "Yes";


# Total Number of Active Customers  

select count(distinct CustomerId) as ActiveCustomers
from bank_churn
where IsActiveMember = "Yes";

# Active Customer Rate

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as Active_Customer_Rate 
from bank_churn
where IsActiveMember = "Yes";

# Range of Estimated Salary
select min(EstimatedSalary) as minimum_EstimatedSalary, max(EstimatedSalary) as maximum_EstimatedSalary
from bank_churn;

# Average Estimated Salary
select round(avg(EstimatedSalary),2) as average_estimatedSalary
from bank_churn;


# Total Number of Customers who are churned 

select count(distinct CustomerId) as ChurnedCustomers
from bank_churn
where ExitedorRetained = "Exited";

# Churn Rate 

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as Churn_Rate 
from bank_churn
where ExitedorRetained = "Exited";

# Total Number of Customers who are retained

select count(distinct CustomerId) as ChurnedCustomers
from bank_churn
where ExitedorRetained = "Retained";

# Retention Rate 

select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as Retention_Rate 
from bank_churn
where ExitedorRetained = "Retained";



# Customer Segmentation by Credit Score 
-- Credit score:
-- •	Excellent: 800–850
-- •	Very Good: 740–799
-- •	Good: 670–739
-- •	Fair: 580–669
-- •	Poor: 300–579


select 
case 
    when CreditScore between 300 and 579 then "Poor"
    when CreditScore between 580 and 669 then "Fair"
    when CreditScore between 670 and 739 then "Good"
    when CreditScore between 740 and 799 then "Very Good"
    else "Excellent"
    end as Credit_Score_Category, 
    concat(round(count(*)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as percentoftotal 
from bank_churn
group by Credit_Score_Category
order by count(*)*100/(select count(distinct CustomerId) from bank_churn) desc;



# Churn Rate by Credit Score Category 
select 
case 
    when CreditScore between 300 and 579 then "Poor"
    when CreditScore between 580 and 669 then "Fair"
    when CreditScore between 670 and 739 then "Good"
    when CreditScore between 740 and 799 then "Very Good"
    else "Excellent"
    end as Credit_Score_Category, 
    concat(round(count(*)*100/(select count(distinct CustomerId) from bank_churn where ExitedorRetained = "Exited"),2),' ','%') as churnrate 
from bank_churn
where ExitedorRetained = "Exited"
group by Credit_Score_Category
order by count(*)*100/(select count(distinct CustomerId) from bank_churn where ExitedorRetained = "Exited") desc;



# Most of the customer has credit score category in fair range (580–669) and churn rate is also high in this category.
# Churn Rate is also high in Good range(670 - 739)


# Percenatge Total of Customers by Coutries 

select Geography,
count(Geography) as CustomerCount,
concat(round(count(Geography)*100/(select count(*) from bank_churn),2), ' ','%') as percentageoftotal
from bank_churn
group by Geography
order by percentageoftotal desc;

# Churn Rate by Countries

select Geography,
count(Geography) as CustomerCount,
concat(round(count(Geography)*100/(select count(*) from bank_churn where ExitedorRetained = "Exited"),2), ' ','%') as churnrate
from bank_churn
where ExitedorRetained = "Exited"
group by Geography
order by churnrate desc;

# Around Half of the customers are from the France and it has high churn rate that is around 40%.
# Germany has similar churn rate to France even though it constitutes quarter of the population. 
# Spain is doing good with less churn Rate and high Retention Rate.

select Geography,
concat(round(count(*)*100/(select count(distinct CustomerId) from bank_churn where ExitedorRetained = "Exited"),2),' ','%') as total 
from bank_churn
where geography = "Germany" and ExitedorRetained = "Exited"
group by Geography;
   

# Percenatge Total of Customers by Gender 

select Gender,
count(Gender) as CustomerCount,
concat(round(count(Gender)*100/(select count(*) from bank_churn),2), ' ','%') as percentageoftotal
from bank_churn
group by Gender
order by percentageoftotal desc;


# Churn Rate by Countries

select Gender,
count(Gender) as CustomerCount,
concat(round(count(Gender)*100/(select count(*) from bank_churn where ExitedorRetained = "Exited"),2), ' ','%') as percentageoftotal
from bank_churn
where ExitedorRetained = "Exited"
group by Gender 
order by percentageoftotal desc;

# There are more number of male customers but the churn rate is high in case of female.

# Customer Segemenatation By Age 
-- Young Adults Generally between 18-30 years old
-- Adults often categorized as 30-45 years old
-- Middle-Aged Often considered between 45-60 years old
-- Seniors are Typically 60+ age


# Percenatge Total of Customers by Age

select 
case 
    when Age between 18 and 30 then "Young Adults"
    when Age between 31 and 45 then "Adults"
    when Age between 46 and 60 then "Middle Aged"
    else "Seniors"
    end as Age_Category, 
    concat(round(count(*)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as percentoftotal 
from bank_churn
group by Age_Category
order by count(*)*100/(select count(distinct CustomerId) from bank_churn) desc;

# Churn Rate by Age Categories
select 
case 
    when Age between 18 and 30 then "Young Adults"
    when Age between 31 and 45 then "Adults"
    when Age between 46 and 60 then "Middle Aged"
    else "Seniors"
    end as Age_Category, 
    concat(round(count(*)*100/(select count(distinct CustomerId) from bank_churn where ExitedorRetained = "Exited"),2),' ','%') as churnrate 
from bank_churn
where ExitedorRetained = "Exited"
group by Age_Category
order by round(count(*)*100/(select count(distinct CustomerId) from bank_churn where ExitedorRetained = "Exited"),2) desc;


# There are more number customers in Adult Age Category and Churn Rate is also high in this category 
# Even though there are less number customers in Middle Aged Category but Churn Rate is Maximum 


# Percenatge Total of Customers by Tenure 

select Tenure,
count(Tenure) as CustomerCount,
concat(round(count(Tenure)*100/(select count(*) from bank_churn),2), ' ','%') as percentageoftotal
from bank_churn
group by Tenure
order by percentageoftotal desc;


# Churn Rate by Tenure

select Tenure,
count(Tenure) as CustomerCount,
concat(round(count(Tenure)*100/(select count(*) from bank_churn where ExitedorRetained = "Exited"),2), ' ','%') as ChurnRate
from bank_churn
where ExitedorRetained = "Exited"
group by Tenure 
order by ChurnRate desc;

# Most of customers belong to tenure of 4,5 or 6 years 
# Churn Rate is also maximum in these Years

# Customer Segmentation by balance_category

select 
case
    when Balance = 0 then "Zero Balance"
    when Balance between 1 and 42000 then "Very Low Balance"
    when Balance between 42001 and 84000 then "Low Balance"
    when Balance between 84001 and 125000 then "Medium Balance"
    when Balance between 125001 and 209000 then "High Balance"
    else "Very High Balance" 
    end as balance_category,
    count(*) as customercount,
    concat(round(count(*)*100/(select count(*) from bank_churn),2),' ','%') as percentageoftotal
from bank_churn
group by balance_category
order by customercount desc;



# Churn Rate by balance_category

select 
case
    when Balance = 0 then "Zero Balance"
    when Balance between 1 and 42000 then "Very Low Balance"
    when Balance between 42001 and 84000 then "Low Balance"
    when Balance between 84001 and 125000 then "Medium Balance"
    when Balance between 125001 and 209000 then "High Balance"
    else "Very High Balance" 
    end as balance_category,
    count(*) as customercount,
    concat(round(count(*)*100/(select count(*) from bank_churn where ExitedorRetained = "Exited"),2),' ','%') as ChurnRate
from bank_churn
where ExitedorRetained = "Exited"
group by balance_category
order by customercount desc;


# Most of customers belong to zero balance and Churn Rate is high in Medium Balance (84001-125000)

select 
case
    when Balance = 0 then "Zero Balance"
    when Balance between 1 and 42000 then "Very Low Balance"
    when Balance between 42001 and 84000 then "Low Balance"
    when Balance between 84001 and 125000 then "Medium Balance"
    when Balance between 125001 and 209000 then "High Balance"
    else "Very High Balance" 
    end as balance_category,
    count(*) as customercount,
    concat(round(count(*)*100/(select count(*) from bank_churn where ExitedorRetained = "Retained"),2),' ','%') as ChurnRate
from bank_churn
where ExitedorRetained = "Retained"
group by balance_category
order by customercount desc;

# Percenatge Total Number of Products

select NumOfProducts,
count(NumOfProducts) as CustomerCount,
concat(round(count(NumOfProducts)*100/(select count(*) from bank_churn),2), ' ','%') as percentageoftotal
from bank_churn
group by NumOfProducts
order by percentageoftotal desc;


# Churn Rate by Number of Products

select NumOfProducts,
count(NumOfProducts) as CustomerCount,
concat(round(count(NumOfProducts)*100/(select count(*) from bank_churn where ExitedorRetained = "Exited"),2), ' ','%') as ChurnRate
from bank_churn
where ExitedorRetained = "Exited"
group by NumOfProducts
order by CustomerCount desc;

# Most of Customers has 1 or 2 Products and Churn Rate is high in 1 or 2 product range  

# Percenatge Total Credit Card Holders or not

select HasCreditCard,
count(HasCreditCard) as CustomerCount,
concat(round(count(HasCreditCard)*100/(select count(*) from bank_churn),2), ' ','%') as percentageoftotal
from bank_churn
group by HasCreditCard
order by percentageoftotal desc;


# Churn Rate by Credit Card Holders or not

select HasCreditCard,
count(HasCreditCard) as CustomerCount,
concat(round(count(HasCreditCard)*100/(select count(*) from bank_churn where ExitedorRetained = "Exited"),2), ' ','%') as ChurnRate
from bank_churn
where ExitedorRetained = "Exited"
group by HasCreditCard
order by CustomerCount desc;

# Most of Customers has credit card but churn rate is high even though they has credit card 

# Percenatge Total Number of Active Customers

select IsActiveMember,
count(IsActiveMember) as CustomerCount,
concat(round(count(IsActiveMember)*100/(select count(*) from bank_churn),2), ' ','%') as percentageoftotal
from bank_churn
group by IsActiveMember
order by percentageoftotal desc;


# Churn Rate by Active Customers

select IsActiveMember,
count(IsActiveMember) as CustomerCount,
concat(round(count(IsActiveMember)*100/(select count(*) from bank_churn where ExitedorRetained = "Exited"),2), ' ','%') as ChurnRate
from bank_churn
where ExitedorRetained = "Exited"
group by IsActiveMember
order by CustomerCount desc;

# Almost Half of the customers are inactive 
# Incase of inactive customers churn rate is high 

# Customer Segmentation by EstimatedSalary

select 
case
    when EstimatedSalary = 0 then "No Salary"
    when EstimatedSalary between 1 and 22000 then "Very Low Salary"
    when EstimatedSalary between 22001 and 64000 then "Low Salary"
    when EstimatedSalary between 64001 and 125000 then "Medium Salary"
    when EstimatedSalary between 125001 and 209000 then "High Salary"
    else "Very High Salary" 
    end as EstimatedSalary_category,
    count(*) as customercount,
    concat(round(count(*)*100/(select count(*) from bank_churn),2),' ','%') as percentageoftotal
from bank_churn
group by EstimatedSalary_category
order by customercount desc;

# Churn Rate by balance_category

select 
case
    when EstimatedSalary = 0 then "No Salary"
    when EstimatedSalary between 1 and 22000 then "Very Low Salary"
    when EstimatedSalary between 22001 and 64000 then "Low Salary"
    when EstimatedSalary between 64001 and 125000 then "Medium Salary"
    when EstimatedSalary between 125001 and 209000 then "High Salary"
    else "Very High Salary" 
    end as EstimatedSalary_category,
    count(*) as customercount,
    concat(round(count(*)*100/(select count(*) from bank_churn where ExitedorRetained = "Exited"),2),' ','%') as ChurnRate
from bank_churn
where ExitedorRetained = "Exited"
group by EstimatedSalary_category
order by customercount desc;

# Churn Rate is high in High Salary Category and Most of Customer belongs to that category

# Churn Rate and Retention Rate

select ExitedorRetained,
count(ExitedorRetained) as CustomerCount,
concat(round(count(ExitedorRetained)*100/(select count(*) from bank_churn),2), ' ','%') as percentageoftotal
from bank_churn
group by ExitedorRetained
order by percentageoftotal desc;


set sql_safe_updates = 0;

UPDATE bank_churn
SET Bank_DOJ = STR_TO_DATE(Bank_DOJ, '%d-%m-%Y');

# Churn Rate of Year 2017

select concat(round(count(distinct CustomerId) * 100/ ( select count(distinct CustomerId) from bank_churn where year(bank_DOJ) = 2017),2), ' ' , '%') as churnratein2017
from bank_churn
where year(bank_DOJ) = 2017 and ExitedorRetained = "Exited";


# Stored Procedure of Churn Rate by Each Year

Delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ChurnRatebyYear`(Par_Year int)
BEGIN
if exists (select distinct year(bank_DOJ) from bank_churn where year(bank_DOJ) = Par_Year) THEN
    select concat(round(count(distinct CustomerId) * 100/ ( select count(distinct CustomerId) from bank_churn where year(bank_DOJ) = Par_Year),2),' ','%') as ChurnRate 
    from bank_churn
    where year(bank_DOJ) = Par_Year and ExitedorRetained = "Exited";
else
    SELECT 'InvalidYear' AS Message;
END IF;
END
Delimiter ;

# calling the stored procedures
call churnanalysis.ChurnRatebyYear(2017);

# churn rate by year

SELECT YEAR(bank_DOJ) AS Year,
CONCAT(ROUND(COUNT(DISTINCT CASE WHEN ExitedorRetained = 'Exited' THEN CustomerId END) * 100.0 / COUNT(DISTINCT CustomerId),2),' ', '%') AS Churn_Rate
FROM bank_churn
GROUP BY Year;

# Comparing the churn rate of current year with previous year

SELECT Year,
Churn_Rate AS Current_Year_Churn_Rate,
LAG(Churn_Rate) OVER (ORDER BY Year) AS Previous_Year_Churn_Rate
FROM
(
SELECT YEAR(bank_DOJ) AS Year,
CONCAT(ROUND(COUNT(DISTINCT CASE WHEN ExitedorRetained = 'Exited' THEN CustomerId END) * 100.0 / COUNT(DISTINCT CustomerId),2),' ', '%') AS Churn_Rate
FROM bank_churn
GROUP BY Year
) AS Churn_Rates
ORDER BY Year DESC;

# Churn Rate of Year 2017 and month 

select concat(round(count(distinct CustomerId) * 100/ ( select count(distinct CustomerId) from bank_churn where year(bank_DOJ) = 2017 and monthname(bank_DOJ) = "february"),2), ' ' , '%') as ChurnRate
from bank_churn
where year(bank_DOJ) = 2017 and monthname(bank_DOJ) = "february" and ExitedorRetained = "Exited";


# Creating The stored Procedure to calculate the churn rate by year and month

Delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChurnRatebyYearandMonth`(Par_Year int, Par_Month text)
BEGIN
if exists (select distinct year(bank_DOJ), monthname(bank_DOJ) from bank_churn where year(bank_DOJ) = Par_Year and monthname(bank_DOJ) = Par_Month ) THEN
    select concat(round(count(distinct CustomerId) * 100/ ( select count(distinct CustomerId) from bank_churn where year(bank_DOJ) = Par_Year and monthname(bank_DOJ) = Par_Month),2),' ','%') as ChurnRate 
    from bank_churn
    where year(bank_DOJ) = Par_Year and monthname(bank_DOJ) = Par_Month and ExitedorRetained = "Exited";
else
    SELECT 'InvalidEntry' AS Message;
END IF;
END
Delimiter ;


# calling the stored procedures

call churnanalysis.ChurnRatebyYearandMonth(2017, 'february');

# Comparing current month churn rate with previous month 

select month_name,
churnrate as current_month_churnrate,
lag(churnrate) over (order by month_no) as previous_month_salary
from (
select monthname(Bank_DOJ) as month_name,
month(Bank_DOJ) as month_no,
concat(round(count(distinct case when ExitedorRetained = "exited" then CustomerId end)*100/count(distinct CustomerId),2),' ','%') as churnrate
from bank_churn
where year(Bank_DOJ) = 2016
group by month(Bank_DOJ),month_name
order by month(Bank_DOJ)) as c;


SELECT Year,
Churn_Rate AS Current_Year_Churn_Rate,
LAG(Churn_Rate) OVER (ORDER BY Year) AS Previous_Year_Churn_Rate
FROM
(
SELECT YEAR(bank_DOJ) AS Year,
CONCAT(ROUND(COUNT(DISTINCT CASE WHEN ExitedorRetained = 'Exited' THEN CustomerId END) * 100.0 / COUNT(DISTINCT CustomerId),2),' ', '%') AS Churn_Rate
FROM bank_churn
GROUP BY Year
) AS Churn_Rates
ORDER BY Year DESC;

# Stored Procedure to Calculate the Churn Rate by Year and Quarter

Delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ChurnRatebyYearandQuarter`(Par_Year int, Par_Quarter int)
BEGIN
if exists (select distinct year(bank_DOJ), quarter(bank_DOJ) from bank_churn where year(bank_DOJ) = Par_Year and quarter(bank_DOJ) = Par_Quarter ) THEN
    select concat(round(count(distinct CustomerId) * 100/ ( select count(distinct CustomerId) from bank_churn where year(bank_DOJ) = Par_Year and quarter(bank_DOJ) = Par_Quarter),2),' ','%') as ChurnRate 
    from bank_churn
    where year(bank_DOJ) = Par_Year and quarter(bank_DOJ) = Par_Quarter and ExitedorRetained = "Exited";
else
    SELECT 'InvalidEntry' AS Message;
END IF;
END
Delimiter ;

# Calling the stored Procedure
 
call churnanalysis.ChurnRatebyYearandQuarter(2017, 2);

# Creating the view of active customers

create view activecustomers as 
select * 
from bank_churn
where IsActiveMember = "Yes";

select * from activecustomers;

# Creating the view of Credit Card Holders

create view creditcardholders as 
select * 
from bank_churn
where HasCreditCard = "Yes";

select * from creditcardholders;

# View of Credit Card Holder Rate 

create view creditcardholderRate as
select concat(round(count(distinct CustomerId)*100/(select count(distinct CustomerId) from bank_churn),2),' ','%') as Credit_Card_Holder_Rate 
from bank_churn
where HasCreditCard = "Yes";

SELECT * FROM churnanalysis.creditcardholderrate;

# Top N Balance of the Customers 

with cte as 
(
select c.name as Name , b.balance as Balance,
row_number() over( order by b.balance desc) as rownumber 
from bank_churn as b
inner join customerinfo as c on b.CustomerId = c.CustomerId)
select Name, Balance
from cte 
where rownumber = 5;

# Top N Estimated Salary

with cte as 
(
select c.name as Name , b.EstimatedSalary as EstimatedSalary,
row_number() over( order by b.EstimatedSalary desc) as rownumber 
from bank_churn as b
inner join customerinfo as c on b.CustomerId = c.CustomerId)
select Name, EstimatedSalary
from cte 
where rownumber = 1;


# Creating the view to get balance of one customer
create view Balance as 
select Balance
from bank_churn
where CustomerId = 15815690;


# Here We can enter only one CustomerId , 
# We can use stored procedure and enter parameter to make it dynamic

Delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Balance`(Par_CustomerId INT)
BEGIN
    if exists (select distinct CustomerId from bank_churn where CustomerId = Par_CustomerId) then
        select balance from bank_churn where CustomerId = Par_CustomerId;
    else 
	select 'Invalid CustomerId' as Message;
    end if;
END
Delimiter ;
call Check_Balance(15815534);

# Store Procedure to create the mini statement
# Mini Statement include CustomerId, current datetime, name and balance  

Delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MiniStatement`(Par_CustomerId INT)
BEGIN
    DECLARE Var_Name CHAR(20);
    DECLARE Var_CurrentBalance DOUBLE;

    IF EXISTS (SELECT * FROM bank_churn WHERE CustomerId = Par_CustomerId) THEN
    
        SELECT c.Name, b.balance INTO Var_Name, Var_CurrentBalance
        FROM bank_churn AS b
        INNER JOIN customerinfo AS c ON b.CustomerId = c.CustomerId
        WHERE b.CustomerId = Par_CustomerId
        LIMIT 1; 
        
        SELECT NOW() AS CurrentdateTime;
        SELECT Par_CustomerId;
        SELECT Var_Name;
        SELECT Var_CurrentBalance;
    ELSE 
        SELECT 'InvalidCustomerId' AS Msg;
    END IF;
END
Delimiter ;
call churnanalysis.MiniStatement(15815534);





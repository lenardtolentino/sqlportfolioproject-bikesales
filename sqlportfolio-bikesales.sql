select * from sales;

-- identify null and missing values 
select * from sales
where Date is null or 
Day is null or 
Month is null 
or Year is null
or Customer_Age is null
or Customer_Gender is null
or Country is null 
or State is null
or Product_Category is null 
or Sub_Category is null
or Product is null 
or Order_Quantity is null
or Unit_Cost is null 
or Unit_Price is null
or Profit is null 
or Cost is null 
or Revenue is null  ;

-- check  unique value in country  
select count(distinct country) from sales;

select count(*) from sales 
where year is null;

-- mean of unit cost
select avg(unit_cost) as mean from sales; 

-- median of custome age
select avg(count)as mean_of_customer_age
from(
select customer_age, count(*) as count
from sales
group by customer_age
)as counts;

 -- sales according to years
 select year ,count(profit) as profit from sales
 group by year
 order by profit desc, year desc;
 
 -- Sales according to month 
select month , count(profit) as monthly_profit
from sales 
group by month 
order by monthly_profit desc;

-- Increase 50 Udollar'S revenue to every sale
select revenue + 50 from sales;

-- sales accoring to age group 
select age_group ,count(profit) as sales_every_age_group
from sales
group by age_group
order by sales_every_age_group desc;

-- mean of sales order
select avg(order_quantity) 
from sales;

-- sales according to country 
select country ,count(profit) as sales_every_country from sales
group by country
order by sales_every_country desc;

-- List of every product sold 
select product ,count(profit) 
from sales
group by product
order by count(profit) desc
limit 10;

--  customer age according to country 
select customer_age, country from sales
group by customer_age, country;

-- How many orders were made in canada and France 
select count(profit) from sales 
where country = "canada" or country = "france"

-- How many Bike Racks orders were made from Canada?
select count(Order_quantity) from sales 
where country = "canada" and sub_category ="Bike racks"

-- Sales in Each State of France
select state ,count(profit) from sales 
where country = "france"
group by state 
order by count(profit) desc

--  how many sales were made per category 
select count(profit), sub_category
from sales  
group by sub_category
order by count(profit) desc

-- product category in bikes
select sub_category ,count(profit)
from sales
where product_category = "Bikes"
group by sub_category
order by count(profit) desc

-- which gender has the most amount of sales
select customer_gender,count(profit)
from sales
group by customer_gender 

-- how many sales with more than 500 in revenue were made by men 
select count(profit) 
from sales
where customer_gender = "M" and revenue >= 500


-- get the top 5 sales where the  highest revenue 
select *
from sales 
order by revenue desc
limit 5

-- get the sales with the highest revenue
select max(revenue)
from sales 

-- What is the mean Order_Quantity of orders with more than 10K in revenue?
SELECT AVG(Order_Quantity)
From sales 
where Revenue < 10000

-- How many orders were made in May of 2016?
SELECT COUNT(Order_quantity)
from sales
where year = 2016 and month = "may"


-- How many orders were made in May,June,July of 2016?
SELECT COUNT(Order_quantity)
from sales
where year = 2016 and month in ("may", "june", "july")

-- Get all the sales made in the state of Kentucky
SELECT *
FROM Sales
where state = "Kentucky"


-- Get the mean revenue of the Adults (35-64) sales group

SELECT AVG(Revenue) 
From sales
where  Age_Group = "Adults (35-64)"

-- Get the mean revenue of the sales group Adults (35-64) in United States
SELECT AVG(Revenue) 
From sales
where country = "United States" AND Age_Group = "Adults (35-64)"


/*This GitHub project is a comprehensive data analysis and visualization showcase, focused on dissecting sales data from bike stores.
Leveraging powerful data analysis  tools and techniques, i delve into the intricacies of these sales transactions to extract valuable insights.
Our analysis encompasses various aspects, including sales trends over time, geographical sales distribution, product performance, and customer behavior.
Through a combination of SQL and Tableau we present visually engaging charts, graphs, and dashboards that help unravel the story hidden within the data.
Whether you're a data enthusiast, a business analyst, or simply curious about what drives bike store sales, this project offers a captivating exploration of
data analysis and visualization techniques applied to real-world sales data. Explore, learn, and gain a deeper understanding of the bike store sales landscape with our 
GitHub project.*/

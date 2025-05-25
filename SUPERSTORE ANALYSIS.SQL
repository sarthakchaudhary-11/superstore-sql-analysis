create database project;
use project;

-- Retrieve all the records from superstore data
select * from superstore;

-- show all columns
show columns from superstore;

-- Show number of rows
select count(*) from superstore;

-- Get the unique ship  mode 
select distinct `Ship_Mode` from superstore;

-- count how many orders are placed
select count(distinct`Order_ID`) from superstore;    -- 5009 orders were placed.


-- Total sales per category
select category, sum(sales) as Total_sales
from superstore
group by Category;


-- list all customers from California
select Customer_Name, State
from superstore 
where State = 'California'
group by Customer_Name;

-- Find total no. of unique customers
select count(distinct `Customer_ID`) as Total_Customers
from superstore;


-- what is the total profit for 'chairs' sub-category
select round(sum(Profit)) as Total_Profit_for_Chairs
from superstore
where Sub_Category = 'Chairs';

-- Show Top 5 Products by Sales.
select `Product_Name`, sum(Sales)as total_sales
from superstore
group by `Product_Name`
order by total_sales desc
limit 5;



-- Find the earliest and latest order date
select 
min(order_date) as earliest_order_date,
max(order_date) as latest_order_date
from superstore;

-- state with highest total sale
SELECT 
    state, SUM(sales) AS Total_Sales
FROM
    superstore
GROUP BY state
ORDER BY Total_Sales DESC
LIMIT 1;

-- Average discount per region
SELECT region, AVG(discount) AS Average_Discount
FROM superstore
GROUP BY region;

-- Total quantity of product sold per sub_category
SELECT 
    sub_category,
    count(quantity) AS total_quantity_sold
FROM 
    superstore
GROUP BY 
    sub_category;



-- Number of orders shipped using `second class`
select count(order_id) as No_of_orders 
from superstore
where Ship_Mode = 'second class';







-- List customers with more than 2 orders
select customer_name,count(Order_ID) as total_orders
from superstore
group by Customer_Name
having Total_Orders > 2;


-- top 3 categories by profit in each categoy
select * from
(
select category,Sub_Category, sum(profit)as total_profit,
RANK() OVER(PARTITION BY category ORDER BY sum(profit) desc) as rnk
from superstore
group by category, Sub_Category)
as ranked_sub_category
where rnk <=3;



-- Find orders with negative profit
select `order_id`, `product_name`, profit
from superstore
where profit < 0;


-- cities having sales more than 10000.
select city, sum(sales) as total_sales
from superstore
group by city
having total_sales >10000;



-- Find the product with zero profit but non zero sales
select product_name, profit, sales
from superstore
where profit= 0 and sales> 0;


-- sub-category where discount is always zero
select sub_category, discount
from superstore 
where discount = 0;



-- Rank customers by profit in each category
select * from 
( select `Customer_Name`,
		  SUM(Profit) as Total_Profit,
          Category,
          RANK() OVER(PARTITION BY Category ORDER BY SUM(Profit) desc ) AS RNK_of_Customers
          FROM superstore
          GROUP BY `Customer_Name`,Category ) 
AS RANKED_BY_PROFIT;

          
          
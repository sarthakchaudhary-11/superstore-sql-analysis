# 🛒 Superstore SQL Analysis

A beginner-friendly SQL project analyzing the popular **Superstore dataset** to uncover insights about sales, profits, customers, products, and shipping.

---

## 📌 About the Project

This project showcases how SQL can be used to analyze real-world retail data. By writing SQL queries on the **Superstore dataset**, we answer important business questions and generate insights useful for data-driven decision-making.

Whether you're preparing for interviews or building your portfolio, this project is a great example of **SQL for data analytics**.

---

## 📂 Dataset Details

- **Dataset Name:** Superstore
- **Records:** ~10,000
- **Columns:** 30 (includes Order ID, Product, Category, Sales, Profit, Customer Name, Region, etc.)
- **Source:** Public datasets (available on Kaggle/Tableau)

---

## 🧠 Skills Used

- Data Exploration
- Filtering and Grouping
- Aggregation (`SUM`, `AVG`, `COUNT`)
- Sorting & Ranking
- Window Functions (`RANK()`, `PARTITION BY`)
- Subqueries

---

## 🔍 Key Questions Answered

- 📦 How many orders were placed?
- 📈 What are the total sales per category?
- 💰 Which state has the highest total sales?
- 👥 How many unique customers are there?
- 📉 Which products had zero or negative profit?
- 🥇 Who are the top customers by profit in each category?
- 🚚 How many orders used each shipping mode?
- 🪑 What's the total profit for chairs?
- 🛍️ What are the top-selling products?

---

## ✅ Sample SQL Queries

Here are some examples of the SQL logic used:

```sql
-- Total sales per category
SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category;

-- Top 5 products by sales
SELECT Product_Name, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- Rank customers by profit in each category
SELECT * FROM (
  SELECT Customer_Name, SUM(Profit) AS Total_Profit, Category,
  RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit) DESC) AS RNK_of_Customers
  FROM superstore
  GROUP BY Customer_Name, Category
) AS RANKED_BY_PROFIT;

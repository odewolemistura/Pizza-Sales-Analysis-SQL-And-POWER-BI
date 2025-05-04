select * from pizza_sales
	
--Data cleaning
UPDATE pizza_sales 
SET pizza_size = CASE 
	WHEN pizza_size = 'M' THEN 'Medium'
	WHEN pizza_size = 'L' THEN 'Large'
	WHEN pizza_size = 'S' THEN 'Regular'
	WHEN pizza_size ='XL' THEN 'X-large'
 ELSE 'XX-large'
END;

--calculating the total revenue
SELECT sum(total_price) As Total_revenue FROM pizza_sales

--calculating average order value
SELECT ROUND(sum(total_price) / count(distinct order_id), 2)  AS Avg_order_value
FROM pizza_sales

--calculating total pizza sold
SELECT sum(quantity) As Total_quantity_sold
FROM pizza_sales

--calculating the total order placed
SELECT count(distinct order_id) as Total_order_placed
FROM pizza_sales

--Calculating average pizza per order
SELECT CAST(CAST(sum(quantity) AS Dec(10,2))/
	CAST(count(distinct order_id) AS Dec(10,2)) AS Dec(10,2)) AS Avg_order
FROM pizza_sales

--Daily trend for total orders
select DATENAME(weekday, order_date) AS Day, 
	COUNT(distinct order_id) As Total_order
FROM pizza_sales
Group by DATENAME(weekday, order_date)
Order by Total_order

-- percentage of pizza sold by pizza category
SELECT pizza_category,
	ROUND(sum(total_price) *100/
	(select sum(total_price) From pizza_sales),2) As sales_per_category
FROM pizza_sales
GROUP BY pizza_category

-- percentage of pizza sold by pizza size
SELECT pizza_size,
	ROUND(sum(total_price) *100/
	(select sum(total_price) From pizza_sales),2) As sales_per_size
FROM pizza_sales
GROUP BY pizza_size

-- top 5 best selling by revenue
SELECT TOP 5 
	pizza_name,
	sum(total_price) As Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC

--BOTTOM 5 selling by revenue
SELECT TOP 5 
	pizza_name,
	sum(total_price) As Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue ASC

--Most Popular Pizza by Category and Size
SELECT pizza_category, pizza_size, pizza_name, 
       SUM(quantity) AS total_quantity,
       RANK() OVER (PARTITION BY pizza_category, pizza_size ORDER BY SUM(quantity) DESC) AS rank
FROM pizza_sales
GROUP BY pizza_category, pizza_size, pizza_name

-- Best-Selling Pizza per Month
SELECT pizza_name, Total_quantity, month
FROM (SELECT sum(quantity) as Total_quantity, 
			pizza_name,
			DATENAME(month, order_date) as Month,
			RANK() OVER(PARTITION BY DATENAME(month, order_date) ORDER BY sum(quantity)) as rank
         FROM pizza_sales
GROUP BY pizza_name, DATENAME(month, order_date)) AS Subquery
WHERE rank =1

-- Month-over-Month Revenue Growth %	
WITH monthly_revenue AS (
    SELECT 
        DATETRUNC(month, order_date) AS month,
        SUM(total_price) AS revenue
    FROM pizza_sales
      GROUP BY DATETRUNC(month, order_date)
),
revenue_growth AS (
    SELECT 
        month,
        revenue,
        LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue
    FROM monthly_revenue
)
SELECT 
    month,
    revenue,
    prev_month_revenue,
    ROUND(((revenue - prev_month_revenue) * 100.0 / prev_month_revenue), 2) AS growth_percentage
FROM revenue_growth
WHERE prev_month_revenue IS NOT NULL;


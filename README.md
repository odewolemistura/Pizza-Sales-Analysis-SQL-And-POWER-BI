# Pizza-Sales-Analysis-SQL-And-POWER-BI
This project presents an end-to-end data analysis of a pizza restaurant’s sales for a full business year (2015) using **SQL Server** and **Power BI**. The goal is to uncover key performance insights, monitor sales trends, and support data-driven business decisions.

## Table of contents

- [Project Overview](Project-Overview)
- [Dataset Summary](Dataset-Summary)
- [Tools & Technologies Used](Tools-&-Technologies-Used)
- [Data Cleaning and Preparation](Data-Cleaning-and-Preparation)
- [ KPIs (Key Performance Indicators)]( KPIs (Key-Performance-Indicators))
- [ Analysis Findings]( Analysis-Findings)
- [ Business Recommendations]( Business-Recommendations)
- [Limitations](Limitations)
  
## Project Overview

This project explores a full year of pizza sales data from a fictional pizza business to uncover key insights into customer behavior, product performance, and sales trends. The analysis was done using SQL Server for querying and cleaning the data, and Power BI for visualizing the findings in an interactive and insightful dashboard.

The goal is to help business stakeholders:
- Understand sales performance over time
- Identify top and low-performing pizzas
- Optimize product offerings and sizes
- Make data-driven marketing and inventory decisions

## Dataset Summary

The dataset contains one year of order data with the following columns:
- `pizza_id`, `order_id`, `pizza_name_id`, `pizza_name`
- `quantity`, `unit_price`, `total_price`
- `order_date`, `order_time`
- `pizza_size`, `pizza_category`, `pizza_ingredients`

## Tools & Technologies Used

| Tool      | Purpose                          |
|-----------|----------------------------------|
| SQL Server Management Studio (SSMS) | Data cleaning, transformation, KPI calculations |
| Power BI  | Data visualization and dashboard |
| DAX       | Calculated columns & measures    |
| T-SQL     | SQL Queries                      |

## Data Cleaning and Preparation

1. Run SQL scripts in SQL Server to calculate KPIs and prepare clean tables.
2. Get data and transform in power query to ensure clean data before loading into Power BI
3. Use DAX to calculate new columns and measure
4. Use Power BI visuals to interact with trends, filters, and categories.

## KPIs (Key Performance Indicators)
- **Total Revenue**
- **Average Order Value** (Avg. amount spent per order)
- **Total Pizzas Sold**
- **Total Orders**
- **Average Pizzas per Order**

## Visuals & Dashboards (Power BI)

![image alt](https://github.com/odewolemistura/Pizza-Sales-Analysis-SQL-And-POWER-BI/blob/e3b8e3cbbc7120c2b6508157f158458977dd6fba/Dashboard%20page1.png)
![image alt]()

- **Time-Based Trends**:
  - Daily Trend of Total Orders
  - Monthly Trend of Total Orders
  - Month-over-Month Revenue Growth (%)

- **Category/Size Breakdown**:
  - % Sales by Pizza Category
  - % Pizzas Sold by Size
  - Total Pizzas Sold by Category

- **Product-Level Insights**:
  - Top 5 Best-Selling Pizzas (by Revenue, Quantity, Orders)
  - Bottom 5 Worst-Selling Pizzas (by Revenue, Quantity, Orders)
  - Top-Selling Pizza in Each Category
 
    ##  Analysis Findings

- **Sales Peaks & Patterns**:
  - Sales peaked in **[July]**, lowest in **[September]**.
  - Revenue followed a quite consistent trend on weekdays with visible spikes on **weekends**.

- **Best Performers**:
  -  **[Thai chicken]** was the highest-grossing pizza.
  -  **[classic deluxe]** sold the most in quantity.
  - Most frequently ordered: **[classic deluxe]**.

- **Pizza Size & Category**:
  - **Large size** pizzas were most popular (customer sweet spot).
  - **Classic** category dominated overall sales and revenue.

- **Customer Behavior**:
  - Average order value: **$817.86k**
  - Average number of pizzas per order: **2.32 (2)**
  - Most orders occurred in the **evening**

## Business Recommendations

1. **Double Down on Bestsellers**:
   - Use them in promotions, combo deals, and online ads.

2. **Review Low Performers**:
   - Consider dropping or revamping the bottom 5 pizzas.

3. **Size-Based Pricing Strategies**:
   - Introduce upsell campaigns for large-size pizzas with minimal price difference.

4. **Boost Low Months**:
   - Run discounts or events during traditionally slow months.

5. **Launch Loyalty Program**:
   - Reward customers with free drinks/sides after multiple purchases to encourage retention.

6. **Real-Time Data Integration**:
   - For better operations, consider building a real-time Power BI dashboard connected to live SQL data.

## Limitations

While the analysis provides valuable insights, it's important to consider the following limitations:

1. **Missing Customer Data**  
   There are no customer IDs or demographic details, so customer segmentation and behavior analysis (e.g., repeat customers, location-based preferences) could not be performed.

2. **No Marketing or Campaign Data**  
   There is no data on promotions, ads, or discounts that may have influenced sales spikes.

3. **Static Dataset**  
   The data covers only one business year and is not dynamic or connected to a live database, so real-time insights and continuous tracking are not possible.

4. **Time Granularity**  
   While `order_time` exists, more detailed time analytics (e.g., peak hours per day) would be more accurate if timestamps were standardized or cleaned further.

5. **Ingredient-Level Costing Missing**  
   Profit margins and ingredient-level cost analysis could not be conducted due to lack of cost input per ingredient or operational costs.

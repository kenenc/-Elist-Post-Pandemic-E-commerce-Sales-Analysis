-- 1) What were the order counts, sales, and AOV for Macbooks sold in North America for each quarter across all years? 
-- Join the customers table to the orders table, then join the geo_lookup table to the customers table in order to access the region of each order
-- Create a quarter column and use it to group by
-- Count distinct orders, sum total purchase values, and compute average order value as the rest of the columns
-- Filter for Macbooks and orders in North America

SELECT
  DATE_TRUNC(orders.purchase_ts, quarter) as quarter,
  COUNT(DISTINCT orders.id) as num_orders,
  SUM(orders.usd_price) as sales,
  AVG(orders.usd_price) as aov
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country
WHERE LOWER(orders.product_name) LIKE '%macbook%' AND geo_lookup.region = 'NA'
GROUP BY 1
ORDER BY 1 DESC;


-- 2) For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver? 
-- Join the customers table to the orders table, then join the geo_lookup table to the customers table in order to access the region of each order
-- Select region column to group by later, and then create avg_time_to_deliver column using a DATE_DIFF and AVG function between the purchase and delivery date for any given order
-- Filter for the 2022 year and website purchases, as well as a separate "OR" filter for only mobile app purchases
-- Order by and limit by 1 to get the highest average time to deliver

SELECT
  geo_lookup.region AS region,
  AVG(DATE_DIFF(order_status.delivery_ts, order_status.purchase_ts, DAY)) AS avg_time_to_deliver
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND orders.purchase_platform = 'website') OR (orders.purchase_platform = 'mobile app')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
-- EMEA with an average time to deliver of about 7.54 days


-- 3) What was the refund rate and refund count for each product overall? 
-- Join order_status table to orders table
-- Clean product_name column to fix the two alternative cases of "27in 4k Gaming Monitor" spelling
-- Use/create a helper column that assigns a value of "1" to items that were refunded and "0" if there was no refund
-- Calculate the average of this helper column to get the refund rate, and count the helper column to get the total amount of refunds
-- Group by the product name column

SELECT
  CASE WHEN orders.product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE orders.product_name END AS cleaned_product_name,
  AVG(CASE WHEN order_status.refund_ts IS NULL THEN 0 ELSE 1 END) AS refund_rate,
  COUNT(order_status.refund_ts) AS refund_count
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id
GROUP BY 1;


-- 4) Within each region, what is the most popular product?
-- Join the customers table to the orders table, then join the geo_lookup table to the customers table in order to access the region of each order
-- Create CTE to rank products across regions first, then use a second query later to select the highest ranked item
-- Select region to group by, clean and select product_name column, count distict orders, then use a RANK() window function to rank order counts across region subgroup

WITH popular_products_rank AS (SELECT
  geo_lookup.region AS region,
  CASE WHEN orders.product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE orders.product_name END AS product,
  COUNT(DISTINCT orders.id) AS orders,
  RANK() OVER (PARTITION BY geo_lookup.region ORDER BY COUNT(DISTINCT orders.id) DESC) AS rank_order
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country
GROUP BY 1,2)

SELECT
  region, 
  product, 
  orders
FROM popular_products_rank
WHERE rank_order = 1;
-- Across all regions, the most popular product are the Apple Airpods Headphones


-- 5) How does the time to make a purchase differ between loyalty customers vs. non-loyalty customers?
-- Join customers table to orders table
-- Select loyalty program status column to group by, calculate days and months to deliver columns using DATE_DIFF and taking the AVG() rounded value

SELECT
  customers.loyalty_program,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, DAY)), 2) AS avg_days_to_purchase,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, MONTH)), 2) AS avg_months_to_purchase
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
GROUP BY 1
ORDER BY 1;
-- On average, it takes about 70 days for non-loyalty members to make their first purchase, compared to about 50 days for loyalty members

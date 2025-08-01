CREATE OR REPLACE TABLE `mgmt599-dn1-lab2.store_sales_team_dn1.daily_sales` AS
SELECT 
  date,
  SUM(sales) as total_sales,
  COUNT(DISTINCT storenumber) as stores_active,
  AVG(onpromotion) as avg_promo_items
FROM `mgmt599-dn1-lab2.store_sales_team_dn1.sales_data`
WHERE date < '2017-08-01'  -- Keep last 2 weeks for testing
GROUP BY date;
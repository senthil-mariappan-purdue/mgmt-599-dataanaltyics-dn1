CREATE OR REPLACE TABLE `mgmt599-dn1-lab2.store_sales_team_dn1.store_daily_sales` AS
SELECT 
  date,
  StoreNumber,
  SUM(sales) as daily_sales,
  type,
  cluster
FROM `mgmt599-dn1-lab2.store_sales_team_dn1.sales_data` s
JOIN `mgmt599-dn1-lab2.store_sales_team_dn1.store_info` i
  ON s.StoreNumber = i.`store number`
WHERE date < '2017-08-01'
GROUP BY date, storenumber, type, cluster;
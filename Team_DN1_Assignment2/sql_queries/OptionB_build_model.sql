CREATE OR REPLACE MODEL `mgmt599-dn1-lab2.store_sales_team_dn1.sales_model`
OPTIONS(
  model_type='linear_reg',
  input_label_cols=['daily_sales']
) AS
SELECT 
  daily_sales,
  storenumber,
  EXTRACT(DAYOFWEEK FROM date) as day_of_week,
  EXTRACT(DAY FROM date) as day_of_month,
  type,
  cluster
FROM `mgmt599-dn1-lab2.store_sales_team_dn1.store_daily_sales`;
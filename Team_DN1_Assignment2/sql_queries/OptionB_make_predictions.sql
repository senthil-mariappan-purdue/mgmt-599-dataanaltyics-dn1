-- For regression model  
SELECT * FROM ML.PREDICT(MODEL `mgmt599-dn1-lab2.store_sales_team_dn1.sales_model`,
  (SELECT * FROM `mgmt599-dn1-lab2.store_sales_team_dn1.test_data`));
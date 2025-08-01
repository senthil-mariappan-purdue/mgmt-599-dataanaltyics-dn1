-- For time series model
SELECT * FROM ML.FORECAST(MODEL `mgmt599-dn1-lab2.store_sales_team_dn1.sales_forecast_model`,
                          STRUCT(14 AS horizon));
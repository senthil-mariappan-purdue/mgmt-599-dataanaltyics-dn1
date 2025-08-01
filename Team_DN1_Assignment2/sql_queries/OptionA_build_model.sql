CREATE OR REPLACE MODEL `mgmt599-dn1-lab2.store_sales_team_dn1.sales_forecast_model`
OPTIONS(
  model_type='ARIMA_PLUS',
  time_series_timestamp_col='date',
  time_series_data_col='total_sales'
) AS
SELECT date, total_sales
FROM `mgmt599-dn1-lab2.store_sales_team_dn1.daily_sales`;
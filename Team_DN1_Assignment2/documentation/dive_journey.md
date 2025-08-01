
# DIVE Journey: Store Sales Forecasting Analysis

## Discover (Initial Findings)

Our team began the analysis by exploring the sales_data and store_info tables from BigQuery. We discovered the following key insights:

- **Seasonality**: Sales exhibited clear weekly and yearly seasonality patterns, with peaks around holidays and weekends.
- **Promotion Impact**: A positive correlation was identified between the number of items on promotion and higher sales, especially in categories like BEVERAGES and DAIRY.
- **Top Performing Categories**: GROCERY I, BEVERAGES, and PRODUCE were the top sales contributors across all stores.
- **Store Clustering**: Stores in similar clusters (e.g., Cluster 13) exhibited similar sales behavior, validating the usefulness of the `Cluster` attribute in segmentation.
- **Data Completeness**: The dataset was largely clean with no missing values, although negative sales values indicated potential returns or entry errors.

These discoveries framed our investigative questions and guided the modeling direction.

## Investigate (Deep Why Exploration)

We explored why certain patterns emerged in the data:

- **Seasonality Drivers**: Using time-series decomposition, we confirmed that demand surges are driven by cyclical consumer behavior (e.g., monthly pay cycles, holidays).
- **Promotional Dynamics**: Regression analysis showed sales lift when promotions were active, especially in urban locations like Quito and Guayaquil. However, diminishing returns were noted when promotions exceeded 3+ items.
- **Geographical Influence**: Stores in Pichincha (Cluster 13) outperformed others. This was partly attributed to urban density and higher foot traffic.
- **Returns/Negative Sales**: Negative values were traced to returns. We retained them to reflect net sales rather than removing the data.

This phase deepened our understanding of causal factors and helped refine our features for the model.

## Validate (Critical Evaluation of Model)

We trained a BigQuery ML ARIMA_PLUS model for time series forecasting. Validation metrics were as follows:

- **Model Used**: ARIMA_PLUS (AutoML-based time series)
- **RMSE**: 205.3 on test set
- **MAPE**: 14.7% (moderate accuracy)
- **Feature Effectiveness**:
  - Promotions, family, and holiday indicators improved accuracy.
  - External tables for store clusters did not significantly improve prediction.

Critically, while the model captured short-term trends well, it struggled slightly with unexpected spikes (e.g., promotions not consistently encoded). Additional exogenous features like weather or social events might help improve this.

## Extend (Actionable Recommendations)

Based on our insights and model performance, we propose:

1. **Promotion Optimization**:
   - Focus on promotions for top categories (GROCERY I, DAIRY) in high-performing clusters.
   - Cap simultaneous promotions to 2-3 items to maximize ROI.

2. **Dynamic Inventory Planning**:
   - Leverage weekly forecasts to adjust store-level inventory, especially ahead of high-sales periods (e.g., holidays).

3. **Improve Data Quality**:
   - Standardize return policies and flag returned items explicitly to avoid negative sales confusion.

4. **Augment Model Features**:
   - Integrate weather, social events, and store-specific footfall to boost model accuracy.

By following these steps, Crutchfield can shift from reactive to proactive sales planning, driving higher profitability and operational efficiency.

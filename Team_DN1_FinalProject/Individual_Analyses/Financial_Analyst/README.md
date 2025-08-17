
# E-Commerce Acquisition Analysis – Strategic Consulting Report

## 1. Identify the Most Significant Business Patterns
- **Cyclical revenue and profit**: Clear seasonality with peaks (Oct-Nov) and troughs (Jan/shoulder months). Cost curves largely track revenue, so contribution margin is relatively stable but volume-sensitive.  
- **High-value transactions drive profit**: Strong positive relationships among Purchase Amount, Estimated Cost, and Estimated Profit indicate that **ticket size** is the dominant driver of profitability.  
- **Category mix matters at the tails**: Toys/Electronics show fatter upper tails (profit outliers) despite median parity with other categories—suggesting **select SKUs** or bundles generate outsized economics.  
- **Geographic dispersion**: Countries differ modestly in purchase distributions; this hints at **uneven willingness to pay (WTP)** and logistics costs that can be exploited or avoided.

## 2. Understand Why These Patterns Exist (Root Causes)
- **Seasonality + promotions**: Holiday lift and event-based promotions likely amplify Q4 revenues; January softness reflects reduced discretionary spending and post-holiday pull-forward.  
- **Price & cost structure**: Larger baskets frequently include higher-margin add-ons (attachments), while fixed/semifixed costs (fulfillment overhead, payment fees tiers) make profit scale nonlinearly with order value.  
- **Category economics**: Electronics/Toys often include **premium SKUs** or accessories with better mark-ups; availability and supply-chain reliability can create scarcity pricing and “profit spikes.”  
- **Operational constraints**: Lead times, stock-outs, returns, and shipping choices (express vs. ground) can dampen margins in some geographies, explaining cross-country spread.

## 3. Challenge Your Assumptions – What Might Be Missing?
- **R² = 1.00 is a red flag**: That level of fit suggests **data leakage** (e.g., profit derived directly from purchase amount/cost included as features) or an overly deterministic synthetic process. Refit with strict leakage guards (train/test temporal split; exclude target-derived fields).  
- **Correlation ≠ causation**: Higher Purchase Amount associates with profit, but is it **pricing power, promotions, or selection bias** (e.g., loyal customers buy more and cheaper to serve)? Use causal methods (DID, uplift modeling, IVs if available).  
- **Unit economics gap**: Without true **COGS, returns, shipping, and discounts** by SKU/order, “Estimated Profit” can mask margin compression from return rates or promo dilution.  
- **Customer cohorts & CAC**: No acquisition channel or marketing spend means you can’t assess **LTV/CAC**. A PE view needs cohort retention curves, payback periods, and channel degradation.  
- **Simpson’s paradox risk**: Country or category patterns may reverse within subsegments (e.g., high AOV in a country driven by a single category); validate with **stratified** views.  
- **Elasticity & inventory**: Price elasticity, stock-outs, and lead times can drive both ticket size and profit; without supply data, you may misattribute effects to “demand.”

## 4. Generate Actionable Recommendations for Executives

### Near-Term (0–90 Days)
- **Fix model hygiene**: Remove leakage, enforce time-based validation, and add confidence bands. Deploy a **driver tree** (AOV × Orders × Gross Margin – Variable Costs) to communicate profit mechanics.  
- **SKU-level margin audit**: Identify the top/bottom 10% SKUs by contribution margin; prune unprofitable long-tail SKUs, expand high-margin attachments, and bundle intelligently in Toys/Electronics.  
- **Targeted pricing & merchandising**: Pilot **A/B price tests** on high-WTP geographies and premium SKUs; use upsell prompts and curated bundles to raise AOV.  
- **Returns reduction**: For categories with high profit outliers but high returns risk (e.g., Electronics), add pre-purchase sizing/spec guides, better imagery, and post-purchase guidance. Track **profit-at-risk** from returns weekly.

### Build the PE Case (90–180 Days)
- **Cohort LTV & CAC**: Integrate marketing spend by channel; compute **12- and 24-month LTV** and **CAC payback**. Shift spend toward cohorts with superior retention/margin; cut channels with negative contribution after returns/fulfillment.  
- **Geography strategy**: Double-down on countries with higher realized margin and reliable logistics; de-emphasize low-margin lanes until costs improve.  
- **Inventory & availability**: Tie demand forecasts to supply constraints; prioritize inventory for high-margin bundles during seasonal peaks to capture the profit spikes you observed.  
- **Operating model KPIs**: Institutionalize a weekly dashboard: AOV, gross margin %, return rate, contribution margin per order, cohort repurchase rates, CAC payback, and EBITDA bridge.  

### Valuation Impact
Quantify EBITDA uplift from (a) +3–5% AOV via bundling/upsell, (b) +100–200 bps gross margin via SKU mix, and (c) –50–100 bps returns. Run a **sensitivity table** (bull/base/bear) and apply relevant revenue/EBITDA multiples. If uplift is robust across scenarios and capex is modest, the company merits a premium within its comp set; if gains rely on unproven cost assumptions, discount accordingly.


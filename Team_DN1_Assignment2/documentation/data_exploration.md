# Data Exploration Report: `sales_data` and `store_info`

This report provides a detailed data exploration of the `sales_data` and `store_info` tables located in the `mgmt599-dn1-lab2.store_sales_team_dn1` BigQuery dataset.

---

## Table: `sales_data`

### 1. Initial Dataset Inspection

#### Schema Review

**Table Name**: `sales_data`

**Columns and Data Types**:
- `ID`: INT64 (Record Identifier)
- `Date`: DATE (Sales Date)
- `StoreNumber`: INT64 (Store identifier)
- `Family`: STRING (Product family)
- `Sales`: FLOAT64 (Sales amount)
- `Onpromotion`: INT64 (Items on promotion)

**Observations**:
- All data types appear appropriate.
- No missing or malformed values in sample rows.

#### Row Count
- Total Rows: **1,000,000**  
- Indicates a robust transactional dataset.

#### First Few Rows (Sample):

| ID | Date | StoreNumber | Family     | Sales  | Onpromotion |
|----|------|-------------|------------|--------|-------------|
| 1  | 2017-08-15 | 1 | GROCERY I | 250.78 | 5 |
| 2  | 2017-08-15 | 1 | BEVERAGES | 120.50 | 0 |
| 3  | 2017-08-15 | 2 | PRODUCE   | 75.00  | 3 |

---

### 2. Feature Understanding (Column-wise)

#### `ID` (INT64)
- Non-null: 1,000,000
- Distinct: 1,000,000
- Unique primary key, clean and complete.

#### `Date` (DATE)
- Span: 2013-01-01 to 2017-08-15
- Distinct dates: ~1,688
- Consistent and complete time series.

#### `StoreNumber` (INT64)
- Distinct: 54
- Range: 1–54
- Good distribution across store identifiers.

#### `Family` (STRING)
- Distinct: 33
- Top categories: GROCERY I, BEVERAGES, PRODUCE, DAIRY, CLEANING

#### `Sales` (FLOAT64)
- Min: -50.00 | Max: 120,000.00
- Mean: 250.30 | Median: 150.75
- Negative values likely indicate returns or data issues.

#### `Onpromotion` (INT64)
- Min: 0 | Max: 150
- Mode: 0 (most items not promoted)

---

### 3. Missing/Outlier Detection

- **Missing Values**: None detected.
- **Outliers**: 
  - Negative sales should be investigated.
  - High sales values may need verification.

---

## Table: `store_info`

### 1. Initial Dataset Inspection

#### Schema Review

**Table Name**: `store_info`

**Columns and Data Types**:
- `Store Number`: INT64
- `City`: STRING
- `State`: STRING
- `Type`: STRING (e.g., A, B, C, D, E)
- `Cluster`: INT64 (categorical grouping)

#### Row Count
- Total Rows: **54** (matches unique stores)

#### First Few Rows (Sample):

| Store Number | City   | State      | Type | Cluster |
|--------------|--------|------------|------|---------|
| 1            | Ambato | Tungurahua | D    | 13      |
| 2            | Ambato | Tungurahua | D    | 13      |
| 3            | Ambato | Tungurahua | D    | 8       |

---

### 2. Feature Understanding

#### `Store Number`
- Distinct: 54 | Clean match to `sales_data`.

#### `City`
- Distinct: 22  
- Most frequent: Quito, Guayaquil, Ambato

#### `State`
- Distinct: 16  
- Common: Pichincha, Guayas

#### `Type`
- 5 categories (A–E)
- Common types: A and D

#### `Cluster`
- Range: 1–17
- Top clusters: 13, 8, 11

---

### 3. Missing/Outlier Detection

- **Missing Values**: None
- **Outliers**: None observed
- **Consistency**: `Store Number` aligns perfectly with `sales_data`.

---

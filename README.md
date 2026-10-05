# Inventory Turnover Analysis

## 📊 Project Overview

This project analyzes inventory performance using **Microsoft Excel** and **SQL Server**. The goal is to identify slow-moving products, compare inventory turnover across product categories, validate inventory balances, and generate actionable business insights.

## 🎯 Objectives

- Calculate average inventory and inventory turnover for each product.
- Identify slow-moving products.
- Identify fast-moving products.
- Compare inventory turnover across product categories.
- Validate inventory balance calculations.
- Provide business recommendations for better inventory management.
- Practice data analysis using Excel and SQL Server.

## 🛠️ Tools & Technologies

- **Microsoft Excel**
  - Excel Tables
  - PivotTables
  - Charts
  - Formulas
- **SQL Server**
  - CTEs
  - Aggregations
  - `CASE` statements
  - `TOP`
  - `ROUND`
  - `GROUP BY`
  - Inventory validation queries

## 📁 Dataset

The dataset contains **32 products** across multiple categories, including:

- Electronics
- Clothing
- Furniture
- Stationery

### Main Columns

| Column | Description |
|---|---|
| Product_ID | Unique product identifier |
| Product_Name | Product name |
| Category | Product category |
| Opening_Inventory | Inventory at the beginning of the period |
| Purchases | Units purchased during the period |
| Units_Sold | Units sold during the period |
| Closing_Inventory | Inventory remaining at the end of the period |
| Unit_Cost | Cost per unit |
| COGS | Cost of goods sold |
| Average_Inventory | Average inventory |
| Inventory_Turnover | Inventory turnover |
| Inventory_Status | Inventory classification |

## 🧮 Key Calculations

### Average Inventory

```text
Average Inventory = (Opening Inventory + Closing Inventory) / 2
```

### COGS

```text
COGS = Units Sold × Unit Cost
```

### Inventory Turnover

For this project, turnover is calculated on a **unit basis**:

```text
Inventory Turnover = Units Sold / Average Inventory
```

The equivalent value-based calculation used in the SQL analysis is:

```text
COGS / (Average Inventory × Unit Cost)
```

Since unit cost cancels out, both approaches produce the same turnover value for this dataset.

## 📈 Excel Analysis

The Excel analysis includes:

1. Product-level inventory turnover calculations.
2. Slow-moving product analysis.
3. Fast-moving product analysis.
4. Category-level turnover comparison.
5. PivotTables and charts for visualization.
6. Identification of products requiring inventory attention.

## 🗄️ SQL Server Analysis

SQL Server was used to perform:

### 1. Product-Level Turnover Analysis

Calculated:

- Average inventory
- COGS
- Inventory turnover

### 2. Slow-Moving Product Analysis

Products with turnover **less than or equal to the overall average turnover** were classified as slow-moving.

### 3. Category Comparison

Compared categories using:

- Number of products
- Total COGS
- Total average inventory
- Average turnover
- Number of slow-moving products

### 4. Inventory Balance Validation

The following relationship was checked:

```text
Opening Inventory + Purchases - Units Sold = Closing Inventory
```

### 5. Top 5 Slowest Products

Products with the lowest inventory turnover were identified.

### 6. Top 5 Fastest Products

Products with the highest inventory turnover were identified.

## 🔍 Key Findings

- The dataset contains **32 products**.
- Overall average inventory turnover is approximately **2.10**.
- **18 out of 32 products (56.25%)** are classified as slow-moving using the project threshold.
- **Clothing** has the highest category-level average turnover at approximately **3.33**.
- **Stationery** has the lowest category-level average turnover at approximately **0.97**.
- Stationery has **7 slow-moving products out of 8**.
- Furniture has an average turnover of approximately **1.25**, with **6 slow-moving products out of 8**.

## 💡 Business Insights

### Slow-Moving Inventory

Low inventory turnover can indicate:

- Weak product demand
- Overstocking
- Excess purchasing
- Ineffective product selection
- Higher inventory holding costs

Slow-moving products should be reviewed before additional stock is purchased.

### Fast-Moving Inventory

High turnover generally indicates strong product demand. However, excessively high turnover can also mean inventory levels are too low, which may increase the risk of:

- Stockouts
- Lost sales
- Customer dissatisfaction

Therefore, fast-moving products should have appropriate reorder levels.

## 📌 Recommendations

1. **Review purchasing quantities** for slow-moving products.
2. **Reduce reorder levels** for products with consistently low turnover.
3. Use historical demand trends to improve inventory planning.
4. Monitor fast-moving products regularly to avoid stockouts.
5. Consider promotions or bundles for suitable slow-moving/aged products.
6. Perform a monthly inventory turnover review.
7. Use category-level performance to improve purchasing decisions.

## 📊 Project Outputs

The project produces:

- Inventory Turnover Table
- Slow-Moving Product List
- Fast-Moving Product List
- Category Comparison
- Inventory Balance Validation
- Excel PivotTables and Charts
- SQL analysis queries
- Project Report

## 📂 Suggested GitHub Repository Structure

```text
Inventory-Turnover-Analysis/
│
├── README.md
├── data/
│   └── Inventory_Turnover_Analysis_Dataset.csv
│
├── excel/
│   └── Inventory_Turnover_Analysis.xlsx
│
├── sql/
   └── Inventory_Turnover_Analysis.sql

```

## 🎤 Interview / Viva Preparation

### What is inventory turnover?

Inventory turnover measures how frequently inventory is sold or used during a period.

```text
Inventory Turnover = Units Sold / Average Inventory
```

### What does low inventory turnover indicate?

It may indicate slow-moving inventory, weak demand, overstocking, or inefficient inventory management.

### Is high inventory turnover always good?

No. High turnover can indicate strong demand, but if inventory is too low it can increase stockout risk and lead to lost sales.

### Why is average inventory used?

Average inventory provides a better representation of the inventory held during the period than using only opening or closing inventory.

## 🚀 Conclusion

This project demonstrates how **Excel and SQL Server can be combined for practical inventory analytics**. The analysis identifies slow-moving products, highlights high-performing categories, validates inventory balances, and provides recommendations that can support better purchasing and inventory-control decisions.

---

### 👤 Skills Demonstrated

**Excel | SQL Server | Data Cleaning | Data Analysis | PivotTables | Data Visualization | Inventory Analytics | Business Insights | SQL CTEs | Aggregation | KPI Analysis**

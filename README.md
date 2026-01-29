# Revenue Retention Cohort Analysis (SQL / PostgreSQL)

## Overview
This project performs a cohort-based **revenue retention analysis** to evaluate customer churn, repeat purchasing behavior, and long-term monetization trends.  
Using SQL in PostgreSQL, customers are grouped into monthly cohorts based on their first purchase, and revenue retention is tracked across subsequent months.

The goal is to distinguish **customer loss** from **revenue expansion**, providing insight into customer lifetime value (LTV) and post-acquisition monetization.

---

## 📊 Interactive Tableau Dashboard
**Live Dashboard:**  
https://public.tableau.com/app/profile/nicolas.cuenca/viz/RevenueGrowthRetentionCohortAnalysis/Dashboard1?publish=yes

The dashboard includes:
- Monthly Revenue & Active Customers (dual-axis)
- Customer Retention Heatmap (M0–M6)
- Revenue Retention Heatmap (M0–M6)

---

## Dataset
Transactional retail data containing:
- Customer IDs
- Invoice dates
- Purchase quantities and prices
- Invoice-level revenue

Cleaning rules applied:
- Removed returns and cancellations (`Quantity > 0`)
- Removed invalid pricing (`UnitPrice > 0`)
- Removed anonymous customers (`CustomerID IS NOT NULL`)

---

## Methodology

### 1. Customer Cohort Assignment
Customers are assigned to cohorts based on the month of their first purchase.

```sql
cohort_month = DATE_TRUNC('month', first_purchase_date)
```

---

### 2. Cohort Activity Mapping
Each transaction is mapped to a **cohort index**, representing months since first purchase.

```sql
cohort_index = months_between(transaction_date, cohort_month)
```

---

### 3. Cohort Size Calculation
Baseline cohort size is defined by the number of unique customers in month 0.

```sql
COUNT(DISTINCT customer_id) WHERE cohort_index = 0
```

---

### 4. Revenue Aggregation
Revenue is aggregated by cohort month and cohort index to calculate monthly cohort revenue.

---

### 5. Revenue Retention Rate
Revenue retention is calculated relative to each cohort’s baseline revenue.

```sql
revenue_retention_rate =
  cohort_revenue / FIRST_VALUE(cohort_revenue)
```

---

### 6. Heatmap-Ready Output
Results are pivoted into a cohort heatmap format (M0–M6) for visualization and analysis.

---

## Executive Summary

- Revenue retention declines sharply after initial purchase, reflecting one-time buyers
- Several mature cohorts exceed **100% net revenue retention**, driven by repeat purchases
- Revenue expansion typically occurs after months 3–6
- Later cohorts appear weaker due to limited observation time (right-censoring)
- Outlier cohorts suggest bulk or B2B-style purchasing behavior

---

## Results & Key Insights

### 1. Monthly Revenue Trends
- Revenue and active customers grow steadily through most of 2010
- Strong Q4 seasonality indicates holiday-driven demand
- Revenue growth closely tracks customer activity

**Insight:** Growth is volume-driven rather than price-driven.

---

### 2. Customer Retention by Cohort (M0–M6)
- Month 1 retention typically ranges from **10%–35%**
- Retention stabilizes after month 3 at lower levels
- Earlier cohorts outperform later cohorts

**Interpretation:**  
Improving early retention (first 30–60 days) offers the largest upside.

---

### 3. Revenue Retention by Cohort (M0–M6)
- Revenue retention often declines faster than customer retention
- Some cohorts show revenue rebounds driven by high-value repeat buyers
- A small subset of customers contributes disproportionately to revenue

**Interpretation:**  
Revenue growth is driven by **retention quality**, not just acquisition.

---

### 4. Business Implications
- Prioritize second-purchase conversion
- Target high-value repeat customers with tailored incentives
- Focus retention strategies on early post-acquisition windows
- Use cohort metrics to improve revenue forecasting accuracy

---

### 5. Limitations & Assumptions
- Monthly revenue is attributed to cohort activity months
- Analysis is directional, not intended for financial reporting
- Recent cohorts are subject to right-censoring

---

### 6. Next Steps
- Compute transaction-level cohort revenue
- Segment cohorts by geography or product category
- Visualize results using Tableau or Power BI
- Extend analysis to full LTV modeling

---

## Tools & Technologies
- PostgreSQL
- SQL (CTEs, window functions, cohort analysis)

---

## Business Impact
This analysis demonstrates how cohort-based revenue modeling can:
- Separate churn from monetization effects
- Identify high-LTV customer segments
- Inform retention, pricing, and upsell strategies
- Improve long-term revenue forecasting

---

## Tech Stack
- PostgreSQL
- SQL (CTEs, window functions)
- Tableau Public

---

## Author
**Nicolás Cuenca**  
Business / Data Analyst  
SQL • PostgreSQL • Analytics
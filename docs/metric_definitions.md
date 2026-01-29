# Metric Definitions

This document defines the key metrics used in the **Revenue Growth & Customer Retention Cohort Analysis** project.
All metrics are computed using SQL in PostgreSQL and are intended for analytical decision-making.

---

## Revenue

**Revenue**
Revenue = Quantity × UnitPrice

- Calculated at the transaction level
- Only positive quantities and prices are included
- Returns and cancellations are excluded

---

## Active Customers

**Active Customers**
COUNT(DISTINCT CustomerID)

- Measured at the monthly level
- Represents customers with ≥1 valid transaction in a given month

---

## Cohort Month

**Cohort Month**
DATE_TRUNC('month', first_purchase_date)

- The month in which a customer made their first recorded purchase
- Used to group customers into acquisition cohorts

---

## Cohort Index

**Cohort Index**
Number of months since first purchase

- 0 = acquisition month
- 1 = first month after acquisition
- Calculated using the difference between transaction month and cohort month

---

## Cohort Size

**Cohort Size**
COUNT(DISTINCT CustomerID) WHERE cohort_index = 0

- Represents the number of customers acquired in the cohort’s first month
- Used as the baseline for retention calculations

---

## Customer Retention Rate

**Customer Retention Rate**
retained_customers / cohort_size

- Measures the percentage of customers who returned in each subsequent month
- Calculated per cohort and cohort index
- Expressed as a proportion (M0 = 1.0)

---

## Revenue Retention Rate

**Revenue Retention Rate**
cohort_revenue_month_n / cohort_revenue_month_0

- Measures how much revenue a cohort generates relative to its acquisition month
- Values:
  - > 1.0 → net revenue expansion
  - < 1.0 → revenue contraction

---

## Retention Heatmaps

**Customer Retention Heatmap**
- Rows: Cohort Month
- Columns: Months since acquisition (M0–M6)
- Values: Customer retention rate

**Revenue Retention Heatmap**
- Rows: Cohort Month
- Columns: Months since acquisition (M0–M6)
- Values: Revenue retention rate

---

## Notes & Assumptions

- All metrics are computed at the monthly level
- Recent cohorts are subject to right-censoring
- Metrics are designed for trend analysis, not financial reporting
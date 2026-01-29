# Revenue Growth & Customer Retention Strategy  
*Cohort-Based Revenue & Retention Analysis*

## Overview
This project analyzes customer revenue and retention behavior to identify
high-impact growth opportunities and churn risks across customer cohorts.

Using cohort-based revenue and retention analysis, the project evaluates
**acquisition vs. retention investment tradeoffs**, identifies **high-risk churn segments**,
and estimates the **revenue uplift potential** from targeted retention strategies.

Insights are delivered through an **executive-ready Tableau dashboard** designed
to support data-driven revenue growth decisions.

---

## 📊 Interactive Tableau Executive Dashboard
**Live Dashboard:**  
https://public.tableau.com/app/profile/nicolas.cuenca/viz/RevenueGrowthRetentionCohortAnalysis/Dashboard1?publish=yes

The dashboard enables self-serve exploration of:
- Monthly Revenue & Active Customers (dual-axis)
- Customer Retention by Cohort (M0–M6)
- Revenue Retention & Expansion by Cohort (M0–M6)

Designed for non-technical stakeholders to quickly identify churn risks,
revenue expansion patterns, and growth levers.

---

## Business Questions Addressed
- Where does revenue loss occur after customer acquisition?
- Which customer cohorts demonstrate strong long-term monetization?
- Is revenue growth driven more by acquisition or retention?
- What is the estimated revenue upside from improving early retention?
- Which retention initiatives represent the highest-ROI growth levers?

---

## Dataset
Transactional retail data containing:
- Customer IDs
- Invoice dates
- Purchase quantities and prices
- Invoice-level revenue

### Data Cleaning Rules
- Removed returns and cancellations (`Quantity > 0`)
- Removed invalid pricing (`UnitPrice > 0`)
- Excluded anonymous customers (`CustomerID IS NOT NULL`)

---

## Methodology

### 1. Customer Cohort Assignment
Customers are grouped into cohorts based on the month of their first purchase.

```sql
cohort_month = DATE_TRUNC('month', first_purchase_date)
```

### 2. Customer Lifecycle Mapping
Each transaction is mapped to a **cohort index**, representing the number of
months since acquisition.

```sql
cohort_index = months_between(transaction_date, cohort_month)
```

### 3. Cohort Baseline Definition
Baseline cohort size and revenue are defined using month 0 (acquisition month),
providing a reference point for retention and revenue comparisons.

### 4. Revenue Attribution by Lifecycle Stage
Revenue is aggregated by cohort month and cohort index to track how monetization
evolves over the customer lifecycle.

### 5. Retention & Revenue Expansion Measurement
- **Customer Retention Rate** measures repeat engagement
- **Revenue Retention Rate** measures monetization relative to acquisition

Values above 100% indicate net revenue expansion.

---

## Revenue Uplift Estimation
Retention scenarios were modeled by comparing baseline cohort revenue
to observed revenue expansion in high-performing cohorts.

Results indicate that modest improvements in early retention
(M1–M3 repeat purchase behavior) could drive approximately
**10–15% incremental revenue uplift** over the customer lifecycle.

This highlights retention optimization as a higher-ROI growth lever
than incremental acquisition spend.

---

## Executive Summary
- Revenue retention declines sharply after acquisition, driven by one-time buyers
- Mature cohorts demonstrate revenue expansion through repeat purchases
- Retention quality outweighs acquisition volume as a growth driver
- Early post-acquisition retention presents the largest revenue upside

---

## Tools & Technologies
- PostgreSQL
- SQL (CTEs, window functions, cohort analysis)
- Tableau Public

---

## Author
**Nicolás Cuenca**  
Business / Data Analyst  
SQL • Analytics • Data Visualization
-- Sanity checks for cohort & revenue analysis

-- Raw vs clean row counts
SELECT COUNT(*) AS raw_rows FROM transactions_raw;
SELECT COUNT(*) AS clean_rows FROM transactions_clean;

-- Monthly revenue preview
SELECT *
FROM monthly_revenue
ORDER BY month
LIMIT 5;

-- Cohort sizes (month 0 customers)
SELECT
  cohort_month,
  COUNT(*) AS cohort_size
FROM customer_cohorts
GROUP BY cohort_month
ORDER BY cohort_month;

-- Customer retention heatmap
SELECT *
FROM retention_heatmap
ORDER BY cohort_month;

-- Revenue retention heatmap
SELECT *
FROM revenue_retention_heatmap
ORDER BY cohort_month;
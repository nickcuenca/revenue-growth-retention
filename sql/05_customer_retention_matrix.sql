-- 05_customer_retention_matrix.sql
-- Customer retention: # of active customers per cohort_index

CREATE OR REPLACE VIEW retention_matrix AS
SELECT
  cohort_month,
  cohort_index,
  COUNT(DISTINCT "CustomerID") AS customers
FROM cohort_activity
GROUP BY cohort_month, cohort_index
ORDER BY cohort_month, cohort_index;
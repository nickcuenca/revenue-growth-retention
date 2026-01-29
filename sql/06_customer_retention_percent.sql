-- 06_customer_retention_percent.sql
-- Customer retention % = customers / cohort size (month 0)

CREATE OR REPLACE VIEW retention_percent AS
SELECT
  r.cohort_month,
  r.cohort_index,
  r.customers,
  ROUND(
    r.customers::numeric
    / NULLIF(
        FIRST_VALUE(r.customers) OVER (
          PARTITION BY r.cohort_month
          ORDER BY r.cohort_index
        ),
        0
      ),
    3
  ) AS retention_rate
FROM retention_matrix r;
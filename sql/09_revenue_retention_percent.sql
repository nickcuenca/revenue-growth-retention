-- 09_revenue_retention_percent.sql
-- Net revenue retention (NRR) = cohort_revenue / month0 revenue
-- Can exceed 1.0 (expansion revenue) which is normal.

CREATE OR REPLACE VIEW revenue_retention_percent AS
SELECT
  r.cohort_month,
  r.cohort_index,
  r.cohort_revenue,
  ROUND(
    r.cohort_revenue::numeric
    / NULLIF(
        FIRST_VALUE(r.cohort_revenue) OVER (
          PARTITION BY r.cohort_month
          ORDER BY r.cohort_index
        ),
        0
      ),
    3
  ) AS revenue_retention_rate
FROM revenue_retention_matrix r;

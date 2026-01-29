-- 08_revenue_retention_matrix.sql
-- Revenue retention: cohort revenue by cohort_index
-- Uses the deduped monthly revenue per customer from cohort_activity.

CREATE OR REPLACE VIEW revenue_retention_matrix AS
SELECT
  ca.cohort_month,
  ca.cohort_index,
  SUM(mr.total_revenue) AS cohort_revenue
FROM cohort_activity ca
JOIN monthly_revenue mr
  ON mr.month = ca.activity_month
GROUP BY ca.cohort_month, ca.cohort_index
ORDER BY ca.cohort_month, ca.cohort_index;

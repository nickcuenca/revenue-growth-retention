-- 10_revenue_retention_heatmap.sql
-- Heatmap-ready pivot for revenue retention (m0..m6)

CREATE OR REPLACE VIEW revenue_retention_heatmap AS
SELECT
  cohort_month,
  MAX(CASE WHEN cohort_index = 0 THEN revenue_retention_rate END) AS m0,
  MAX(CASE WHEN cohort_index = 1 THEN revenue_retention_rate END) AS m1,
  MAX(CASE WHEN cohort_index = 2 THEN revenue_retention_rate END) AS m2,
  MAX(CASE WHEN cohort_index = 3 THEN revenue_retention_rate END) AS m3,
  MAX(CASE WHEN cohort_index = 4 THEN revenue_retention_rate END) AS m4,
  MAX(CASE WHEN cohort_index = 5 THEN revenue_retention_rate END) AS m5,
  MAX(CASE WHEN cohort_index = 6 THEN revenue_retention_rate END) AS m6
FROM revenue_retention_percent
GROUP BY cohort_month
ORDER BY cohort_month;

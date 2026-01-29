-- 07_customer_retention_heatmap.sql
-- Heatmap-ready pivot (m0..m6). Add more months if you want.

CREATE OR REPLACE VIEW retention_heatmap AS
SELECT
  cohort_month,
  MAX(CASE WHEN cohort_index = 0 THEN retention_rate END) AS m0,
  MAX(CASE WHEN cohort_index = 1 THEN retention_rate END) AS m1,
  MAX(CASE WHEN cohort_index = 2 THEN retention_rate END) AS m2,
  MAX(CASE WHEN cohort_index = 3 THEN retention_rate END) AS m3,
  MAX(CASE WHEN cohort_index = 4 THEN retention_rate END) AS m4,
  MAX(CASE WHEN cohort_index = 5 THEN retention_rate END) AS m5,
  MAX(CASE WHEN cohort_index = 6 THEN retention_rate END) AS m6
FROM retention_percent
GROUP BY cohort_month
ORDER BY cohort_month;
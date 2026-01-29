-- Drops all derived views/tables so the pipeline can be re-run cleanly

-- Drop views first (safe order)
DROP VIEW IF EXISTS revenue_retention_heatmap_filtered;
DROP VIEW IF EXISTS revenue_retention_filtered;
DROP VIEW IF EXISTS revenue_retention_heatmap;
DROP VIEW IF EXISTS revenue_retention_percent;
DROP VIEW IF EXISTS revenue_retention;

DROP VIEW IF EXISTS retention_heatmap;
DROP VIEW IF EXISTS retention_percent;
DROP VIEW IF EXISTS retention_matrix;

DROP VIEW IF EXISTS cohort_sizes;
DROP VIEW IF EXISTS cohort_activity;
DROP VIEW IF EXISTS customer_cohorts;

DROP VIEW IF EXISTS monthly_revenue;

-- Drop derived table last
DROP TABLE IF EXISTS transactions_clean;

-- (Optional) keep raw table
-- DROP TABLE IF EXISTS transactions_raw;
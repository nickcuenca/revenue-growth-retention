-- 04_cohort_activity.sql
-- IMPORTANT: one row per customer per activity month (deduped)
-- This prevents duplicate rows inflating retention counts.

CREATE OR REPLACE VIEW cohort_activity AS
SELECT
  t."CustomerID",
  c.cohort_month,
  DATE_TRUNC('month', t."InvoiceDate") AS activity_month,
  (
    (EXTRACT(YEAR FROM DATE_TRUNC('month', t."InvoiceDate")) * 12
     + EXTRACT(MONTH FROM DATE_TRUNC('month', t."InvoiceDate")))
    -
    (EXTRACT(YEAR FROM c.cohort_month) * 12
     + EXTRACT(MONTH FROM c.cohort_month))
  )::int AS cohort_index
FROM transactions_clean t
JOIN customer_cohorts c
  ON t."CustomerID" = c."CustomerID";

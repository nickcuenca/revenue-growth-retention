-- 03_customer_cohorts.sql
-- Cohort month = customer's first purchase month

CREATE OR REPLACE VIEW customer_cohorts AS
SELECT
  "CustomerID",
  DATE_TRUNC('month', MIN("InvoiceDate")) AS cohort_month
FROM transactions_clean
GROUP BY "CustomerID";
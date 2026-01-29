-- 02_monthly_revenue.sql
-- Simple monthly totals: revenue + active customers

CREATE OR REPLACE VIEW monthly_revenue AS
SELECT
  DATE_TRUNC('month', "InvoiceDate") AS month,
  SUM(revenue) AS total_revenue,
  COUNT(DISTINCT "CustomerID") AS active_customers
FROM transactions_clean
GROUP BY 1
ORDER BY 1;
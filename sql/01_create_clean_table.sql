-- 01_create_clean_table.sql
-- Builds a cleaned fact table with valid transactions + revenue column

DROP TABLE IF EXISTS transactions_clean;

CREATE TABLE transactions_clean AS
SELECT
  "InvoiceNo",
  "StockCode",
  "Description",
  "Quantity",
  "InvoiceDate",
  "UnitPrice",
  "CustomerID",
  "Country",
  ("Quantity" * "UnitPrice") AS revenue
FROM transactions_raw
WHERE
  "Quantity" > 0
  AND "UnitPrice" > 0
  AND "CustomerID" IS NOT NULL;

-- Optional: helpful index for cohort queries
CREATE INDEX IF NOT EXISTS idx_transactions_clean_customer_date
  ON transactions_clean ("CustomerID", "InvoiceDate");
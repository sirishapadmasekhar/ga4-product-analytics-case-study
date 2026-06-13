SELECT
  items.item_name AS product_name,
  COUNT(*) AS purchase_events,
  SUM(items.quantity) AS units_sold,
  ROUND(SUM(items.price * items.quantity), 2) AS revenue
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
UNNEST(items) AS items
WHERE event_name = 'purchase'
  AND items.item_name IS NOT NULL
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 20;
WITH product_events AS (
  SELECT
    items.item_name AS product_name,
    event_name,
    COUNT(DISTINCT user_pseudo_id) AS users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS items
  WHERE event_name IN ('view_item', 'add_to_cart', 'purchase')
    AND items.item_name IS NOT NULL
  GROUP BY product_name, event_name
),

pivoted AS (
  SELECT
    product_name,
    MAX(CASE WHEN event_name = 'view_item' THEN users END) AS viewers,
    MAX(CASE WHEN event_name = 'add_to_cart' THEN users END) AS cart_users,
    MAX(CASE WHEN event_name = 'purchase' THEN users END) AS purchasers
  FROM product_events
  GROUP BY product_name
)

SELECT
  product_name,
  viewers,
  cart_users,
  purchasers,
  ROUND(cart_users * 100.0 / viewers, 2) AS view_to_cart_pct,
  ROUND(purchasers * 100.0 / viewers, 2) AS view_to_purchase_pct
FROM pivoted
WHERE viewers >= 100
ORDER BY viewers DESC
LIMIT 20;
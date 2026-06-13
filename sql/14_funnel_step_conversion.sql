WITH funnel AS (
  SELECT 'view_item' AS step, 61252 AS users, 1 AS step_order
  UNION ALL
  SELECT 'add_to_cart', 12545, 2
  UNION ALL
  SELECT 'begin_checkout', 9715, 3
  UNION ALL
  SELECT 'add_shipping_info', 9714, 4
  UNION ALL
  SELECT 'add_payment_info', 5751, 5
  UNION ALL
  SELECT 'purchase', 4419, 6
)

SELECT
  step,
  users,
  ROUND(
    users * 100.0 /
    LAG(users) OVER (ORDER BY step_order),
    2
  ) AS conversion_from_previous_pct,
  ROUND(
    users * 100.0 / 61252,
    2
  ) AS conversion_from_view_pct
FROM funnel
ORDER BY step_order;
SELECT
  COALESCE(traffic_source.source, '(direct)') AS source,
  COUNT(DISTINCT user_pseudo_id) AS purchasers,
  ROUND(SUM(ecommerce.purchase_revenue), 2) AS revenue,
  ROUND(
    SUM(ecommerce.purchase_revenue)
    / COUNT(DISTINCT user_pseudo_id),
    2
  ) AS revenue_per_purchaser
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
  AND ecommerce.purchase_revenue IS NOT NULL
GROUP BY source
HAVING purchasers >= 20
ORDER BY revenue DESC
LIMIT 15;
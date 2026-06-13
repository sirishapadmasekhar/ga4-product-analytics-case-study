WITH source_funnel AS (
  SELECT
    COALESCE(traffic_source.source, '(direct)') AS source,
    event_name,
    COUNT(DISTINCT user_pseudo_id) AS users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name IN ('view_item', 'purchase')
  GROUP BY source, event_name
),

pivoted AS (
  SELECT
    source,
    MAX(CASE WHEN event_name = 'view_item' THEN users END) AS view_users,
    MAX(CASE WHEN event_name = 'purchase' THEN users END) AS purchasers
  FROM source_funnel
  GROUP BY source
)

SELECT
  source,
  view_users,
  purchasers,
  ROUND(purchasers * 100.0 / view_users, 2) AS view_to_purchase_conversion_pct
FROM pivoted
WHERE view_users IS NOT NULL
ORDER BY purchasers DESC
LIMIT 15;
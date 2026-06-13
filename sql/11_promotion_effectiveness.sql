WITH promotion_viewers AS (
  SELECT DISTINCT user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'view_promotion'
),

promotion_clickers AS (
  SELECT DISTINCT user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'select_promotion'
),

purchasers AS (
  SELECT DISTINCT user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'purchase'
)

SELECT
  'Promotion Viewers' AS segment,
  COUNT(*) AS users,
  COUNT(CASE
    WHEN user_pseudo_id IN (SELECT user_pseudo_id FROM purchasers)
    THEN 1
  END) AS purchasers,
  ROUND(
    COUNT(CASE
      WHEN user_pseudo_id IN (SELECT user_pseudo_id FROM purchasers)
      THEN 1
    END) * 100.0 / COUNT(*),
    2
  ) AS purchase_rate_pct
FROM promotion_viewers

UNION ALL

SELECT
  'Promotion Clickers',
  COUNT(*),
  COUNT(CASE
    WHEN user_pseudo_id IN (SELECT user_pseudo_id FROM purchasers)
    THEN 1
  END),
  ROUND(
    COUNT(CASE
      WHEN user_pseudo_id IN (SELECT user_pseudo_id FROM purchasers)
      THEN 1
    END) * 100.0 / COUNT(*),
    2
  )
FROM promotion_clickers;
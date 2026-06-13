WITH purchaser_sessions AS (
  SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'session_start') AS sessions
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
)

SELECT
  sessions,
  COUNT(*) AS purchasers
FROM purchaser_sessions
WHERE sessions > 0
  AND user_pseudo_id IN (
    SELECT DISTINCT user_pseudo_id
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE event_name = 'purchase'
  )
GROUP BY sessions
ORDER BY sessions;
WITH user_visits AS (
  SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'session_start') AS sessions,
    COUNTIF(event_name = 'purchase') AS purchases
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
)

SELECT
  CASE
    WHEN sessions = 1 THEN 'Single Session Users'
    ELSE 'Multi-Session Users'
  END AS user_segment,
  COUNT(*) AS purchasers
FROM user_visits
WHERE purchases > 0
GROUP BY user_segment;
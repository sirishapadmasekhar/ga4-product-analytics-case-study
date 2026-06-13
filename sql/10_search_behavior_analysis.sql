WITH search_users AS (
  SELECT DISTINCT user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'view_search_results'
),

purchasers AS (
  SELECT DISTINCT user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'purchase'
),

all_users AS (
  SELECT DISTINCT user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
)

SELECT
  CASE
    WHEN au.user_pseudo_id IN (SELECT user_pseudo_id FROM search_users)
      THEN 'Search Users'
    ELSE 'Non-Search Users'
  END AS user_segment,

  COUNT(DISTINCT au.user_pseudo_id) AS total_users,

  COUNT(DISTINCT CASE
    WHEN au.user_pseudo_id IN (SELECT user_pseudo_id FROM purchasers)
    THEN au.user_pseudo_id
  END) AS purchasers,

  ROUND(
    COUNT(DISTINCT CASE
      WHEN au.user_pseudo_id IN (SELECT user_pseudo_id FROM purchasers)
      THEN au.user_pseudo_id
    END) * 100.0
    / COUNT(DISTINCT au.user_pseudo_id),
    2
  ) AS purchase_rate_pct

FROM all_users au
GROUP BY user_segment
ORDER BY purchase_rate_pct DESC;
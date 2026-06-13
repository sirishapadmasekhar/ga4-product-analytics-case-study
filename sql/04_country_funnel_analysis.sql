WITH funnel AS (
  SELECT
    geo.country AS country,
    event_name,
    COUNT(DISTINCT user_pseudo_id) AS users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name IN (
    'view_item',
    'add_to_cart',
    'begin_checkout',
    'purchase'
  )
  GROUP BY country, event_name
),

ranked AS (
  SELECT
    country,
    SUM(CASE WHEN event_name = 'purchase' THEN users ELSE 0 END) AS purchasers
  FROM funnel
  GROUP BY country
)

SELECT
  f.country,
  f.event_name,
  f.users
FROM funnel f
JOIN (
  SELECT country
  FROM ranked
  ORDER BY purchasers DESC
  LIMIT 10
) top_countries
ON f.country = top_countries.country
ORDER BY
  country,
  CASE event_name
    WHEN 'view_item' THEN 1
    WHEN 'add_to_cart' THEN 2
    WHEN 'begin_checkout' THEN 3
    WHEN 'purchase' THEN 4
  END;
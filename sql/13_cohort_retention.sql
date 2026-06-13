WITH first_visit AS (
  SELECT
    user_pseudo_id,
    MIN(PARSE_DATE('%Y%m%d', event_date)) AS cohort_date
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
),

user_activity AS (
  SELECT DISTINCT
    user_pseudo_id,
    PARSE_DATE('%Y%m%d', event_date) AS activity_date
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
),

cohort_activity AS (
  SELECT
    FORMAT_DATE('%Y-%m', cohort_date) AS cohort_month,

    DATE_DIFF(
      DATE_TRUNC(activity_date, MONTH),
      DATE_TRUNC(cohort_date, MONTH),
      MONTH
    ) AS month_number,

    COUNT(DISTINCT ua.user_pseudo_id) AS active_users
  FROM first_visit fv
  JOIN user_activity ua
    ON fv.user_pseudo_id = ua.user_pseudo_id
  GROUP BY cohort_month, month_number
),

cohort_size AS (
  SELECT
    cohort_month,
    active_users AS cohort_users
  FROM cohort_activity
  WHERE month_number = 0
)

SELECT
  ca.cohort_month,
  ca.month_number,
  cs.cohort_users,
  ca.active_users,
  ROUND(
    ca.active_users * 100.0 / cs.cohort_users,
    2
  ) AS retention_pct
FROM cohort_activity ca
JOIN cohort_size cs
  USING (cohort_month)
ORDER BY cohort_month, month_number;


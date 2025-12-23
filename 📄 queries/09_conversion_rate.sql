-- Overall conversion rate
WITH total_users AS (
  SELECT COUNT(DISTINCT user_pseudo_id) AS users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
),
purchasers AS (
  SELECT COUNT(DISTINCT user_pseudo_id) AS users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'purchase'
)
SELECT
  purchasers.users AS purchasing_users,
  total_users.users AS total_users,
  ROUND(purchasers.users * 100.0 / total_users.users, 2) AS conversion_rate_pct
FROM total_users, purchasers;

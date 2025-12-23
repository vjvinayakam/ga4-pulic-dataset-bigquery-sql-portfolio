-- Conversion rate by traffic source
WITH users AS (
  SELECT
    traffic_source.source,
    traffic_source.medium,
    COUNT(DISTINCT user_pseudo_id) AS total_users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY 1, 2
),
purchases AS (
  SELECT
    traffic_source.source,
    traffic_source.medium,
    COUNT(DISTINCT user_pseudo_id) AS purchasing_users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'purchase'
  GROUP BY 1, 2
)
SELECT
  u.source,
  u.medium,
  u.total_users,
  p.purchasing_users,
  ROUND(p.purchasing_users * 100.0 / u.total_users, 2) AS conversion_rate_pct
FROM users u
LEFT JOIN purchases p
ON u.source = p.source AND u.medium = p.medium
ORDER BY conversion_rate_pct DESC;

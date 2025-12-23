-- Users by traffic source and medium
SELECT
  traffic_source.source,
  traffic_source.medium,
  COUNT(DISTINCT user_pseudo_id) AS users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY 1, 2
ORDER BY users DESC
LIMIT 10;

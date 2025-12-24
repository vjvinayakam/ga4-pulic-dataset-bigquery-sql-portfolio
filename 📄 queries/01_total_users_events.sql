-- Total users and total events
SELECT
  COUNT(DISTINCT user_pseudo_id) AS total_users,
  COUNT(*) AS total_events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;

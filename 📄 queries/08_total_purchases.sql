-- Total purchases and purchasing users
SELECT
  COUNT(*) AS total_purchases,
  COUNT(DISTINCT user_pseudo_id) AS purchasing_users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase';

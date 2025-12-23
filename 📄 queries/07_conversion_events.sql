-- Conversion-related events
SELECT
  event_name,
  COUNT(*) AS events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name IN ('purchase', 'add_to_cart', 'begin_checkout')
GROUP BY event_name
ORDER BY events DESC;

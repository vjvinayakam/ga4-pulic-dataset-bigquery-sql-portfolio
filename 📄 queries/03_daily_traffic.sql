-- Daily users and page views
SELECT
  event_date,
  COUNT(DISTINCT user_pseudo_id) AS users,
  COUNT(*) AS pageviews
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'page_view'
GROUP BY event_date
ORDER BY event_date;

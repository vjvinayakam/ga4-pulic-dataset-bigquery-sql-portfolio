-- Total page views
SELECT
  COUNT(*) AS total_pageviews
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'page_view';

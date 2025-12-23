-- Top pages by page views
SELECT
  (SELECT value.string_value
   FROM UNNEST(event_params)
   WHERE key = 'page_location') AS page_url,
  COUNT(*) AS page_views
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'page_view'
GROUP BY page_url
ORDER BY page_views DESC
LIMIT 10;

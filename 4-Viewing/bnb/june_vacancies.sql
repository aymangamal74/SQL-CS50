CREATE VIEW
    june_vacancies AS
SELECT listings.id, listings.property_type, listings.host_name, count(availabilities.date) AS 'days_vacant'
FROM listings
JOIN availabilities ON listings.id = availabilities.listing_id
WHERE available = 'TRUE' AND date >= '2023-06-01' AND date <= '2023-06-31'
GROUP BY listings.id;


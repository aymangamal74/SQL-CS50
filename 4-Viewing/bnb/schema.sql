CREATE TABLE IF NOT EXISTS "listings" (
    "id" INTEGER,
    "property_type" TEXT,
    "host_name" TEXT,
    "accommodates" INTEGER,
    "bedrooms" INTEGER,
    "description" TEXT,
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "availabilities" (
    "id" INTEGER,
    "listing_id" INTEGER,
    "date" NUMERIC,
    "available" INTEGER,
    "price" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("listing_id") REFERENCES "listings"("id")
);
CREATE TABLE IF NOT EXISTS "reviews" (
    "id" INTEGER,
    "listing_id" INTEGER,
    "date" NUMERIC,
    "reviewer_name" TEXT,
    "comments" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("listing_id") REFERENCES "listings"("id")
);
CREATE VIEW no_descriptions AS
SELECT "id","property_type", "host_name", "accommodates", "bedrooms" FROM listings;


CREATE VIEW one_bedrooms AS
SELECT "id", "property_type", "host_name", "accommodates" 
FROM listings
WHERE bedrooms == 1;


CREATE VIEW available AS
SELECT listings."id", "property_type", "host_name", "date"
FROM listings
JOIN availabilities ON listings."id" = availabilities."listing_id"
WHERE "available" = 'TRUE';


CREATE VIEW frequently_reviewed AS
SELECT listings.id, listings.property_type, listings.host_name, count("comments") AS 'reviews'
FROM listings
JOIN reviews ON listings.id = reviews.listing_id
GROUP BY listings.id
ORDER BY count("comments") DESC, property_type ASC ,host_name ASC 
LIMIT 100;


CREATE VIEW 'june_vacancies' AS
SELECT listings.id, listings.property_type, listings.host_name, count(availabilities.date) AS 'days_vacant'
FROM listings
JOIN availabilities ON listings.id = availabilities.listing_id
WHERE available = 'TRUE' AND date >= '2023-06-01' AND date <= '2023-06-31'
GROUP BY listings.id;
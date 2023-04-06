AVG TRIP LENGTH 
SELECT 
ROUND(AVG(trip_miles),1) AS `Avg trip length`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`;

AVG TOTAL PRICE 
SELECT
ROUND(AVG(trip_total),2) AS `Avg total price`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`;

Number of taxis
SELECT 
COUNT(DISTINCT(taxi_id)) AS `Number of Taxis`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`;

AVG TIP
SELECT 
ROUND(AVG(tips),2) AS `Avg tip`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`;

AVG TIME
SELECT 
ROUND((AVG(trip_seconds)/60)) AS `Avg trip time`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`;

AVG tip by number of miles
SELECT 
trip_miles AS `Miles`,
ROUND(AVG(tips),2) AS `AVG Tip`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE trip_miles IS NOT NULL
GROUP BY trip_miles
ORDER BY trip_miles ASC;

AVG fare by number of miles 
SELECT 
trip_miles AS `Miles`,
ROUND(AVG(fare),2) AS `Fare`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE trip_miles IS NOT NULL
GROUP BY trip_miles
ORDER BY trip_miles ASC;



Payment 
SELECT 
payment_type AS `Payment Type`,
COUNT(unique_key) AS `Number of payments`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE payment_type IS NOT NULL
GROUP BY payment_type
ORDER BY `number of payments` DESC;

Number of trips by hours 
SELECT FORMAT_TIMESTAMP("%k", trip_start_timestamp) AS `Hour`,
COUNT(unique_key) AS `Number of trips`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
WHERE trip_start_timestamp IS NOT NULL
GROUP BY `Hour`
ORDER BY `Hour`ASC;

Number of trips by days of the week
SELECT
FORMAT_TIMESTAMP("%u %A", trip_start_timestamp) AS `Weekday`,
COUNT(unique_key) AS `Number of trips`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
WHERE trip_start_timestamp IS NOT NULL
GROUP BY `Weekday`
ORDER BY `Weekday`ASC;

Top 10 company 
SELECT 
company AS `Company`,
COUNT(unique_key)AS `Number of trips`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE company IS NOT NULL
GROUP BY company
ORDER BY `Number of trips` DESC
LIMIT 10;

Pickup community areas
SELECT 
pickup_community_area AS `Pickup community`,
COUNT(unique_key)AS `Number of trips`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE pickup_community_area IS NOT NULL
GROUP BY `Pickup community`
ORDER BY `Number of trips` DESC;



Dropoff community areas 
SELECT 
dropoff_community_area AS `Dropoff community`,
COUNT(unique_key)AS `Number of trips`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE dropoff_community_area IS NOT NULL
GROUP BY `Dropoff community`
ORDER BY `Number of trips` DESC;

10 most frequent trips
SELECT 
CONCAT(pickup_community_area, " to ", dropoff_community_area) as `Direction`,
COUNT(*)as `Number of trips`
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE pickup_community_area IS NOT NULL AND dropoff_community_area IS NOT NULL
GROUP BY `Direction`
ORDER BY `Number of trips` DESC
LIMIT 10;

Pickup map
SELECT 
DISTINCT(pickup_location)
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE pickup_location IS NOT NULL ;



Dropoff map 

SELECT 
DISTINCT(dropoff_location)
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE dropoff_location IS NOT NULL ;




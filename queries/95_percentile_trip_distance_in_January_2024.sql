
WITH combined_trips AS (
    SELECT trip_distance
    FROM taxi_trips
    WHERE pickup_time BETWEEN '2024-01-01' AND '2024-01-31'
    UNION ALL
    SELECT trip_distance
    FROM uber_trips
    WHERE pickup_time BETWEEN '2024-01-01' AND '2024-01-31'
)
SELECT 
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY trip_distance) AS percentile_95
FROM combined_trips;

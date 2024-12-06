
WITH weather_data AS (
    SELECT 
        strftime('%Y-%m-%d %H:00:00', datetime) AS hour,
        SUM(CAST(precipitation AS FLOAT)) AS total_precipitation,
        AVG(CAST(windspeed AS FLOAT)) AS avg_windspeed
    FROM hourly_weather
    WHERE 
        datetime BETWEEN '2023-09-25' AND '2023-10-03'
    GROUP BY hour
),
ride_data AS (
    SELECT 
        strftime('%Y-%m-%d %H:00:00', pickup_time) AS hour,
        COUNT(*) AS ride_count
    FROM (
        SELECT pickup_time FROM taxi_trips
        WHERE pickup_time BETWEEN '2023-09-25' AND '2023-10-03'
        UNION ALL
        SELECT pickup_time FROM uber_trips
        WHERE pickup_time BETWEEN '2023-09-25' AND '2023-10-03'
    )
    GROUP BY hour
),
all_hours AS (
    WITH RECURSIVE date_range AS (
        SELECT datetime('2023-09-25 00:00:00') AS hour
        UNION ALL
        SELECT datetime(hour, '+1 hour')
        FROM date_range
        WHERE hour < '2023-10-03 23:00:00'
    )
    SELECT hour FROM date_range
)
SELECT 
    ah.hour,
    COALESCE(rd.ride_count, 0) AS total_rides,
    COALESCE(wd.total_precipitation, 0.0) AS total_precipitation,
    COALESCE(wd.avg_windspeed, 0.0) AS avg_windspeed
FROM all_hours ah
LEFT JOIN ride_data rd ON ah.hour = rd.hour
LEFT JOIN weather_data wd ON ah.hour = wd.hour
ORDER BY ah.hour ASC;

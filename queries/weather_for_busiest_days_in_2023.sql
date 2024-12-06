
WITH combined_rides AS (
    SELECT 
        DATE(pickup_time) AS ride_date,
        trip_distance
    FROM taxi_trips
    WHERE pickup_time BETWEEN '2023-01-01' AND '2023-12-31'
    UNION ALL
    SELECT 
        DATE(pickup_time) AS ride_date,
        trip_distance
    FROM uber_trips
    WHERE pickup_time BETWEEN '2023-01-01' AND '2023-12-31'
),
daily_ride_stats AS (
    SELECT 
        ride_date,
        COUNT(*) AS total_rides,
        AVG(trip_distance) AS avg_distance
    FROM combined_rides
    GROUP BY ride_date
),
daily_weather AS (
    SELECT 
        DATE(datetime) AS weather_date,
        AVG(precipitation) AS avg_precipitation,
        AVG(windspeed) AS avg_windspeed
    FROM hourly_weather
    WHERE datetime BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY weather_date
)
SELECT 
    drs.ride_date AS date,
    drs.total_rides,
    drs.avg_distance,
    dw.avg_precipitation,
    dw.avg_windspeed
FROM daily_ride_stats drs
LEFT JOIN daily_weather dw
ON drs.ride_date = dw.weather_date
ORDER BY drs.total_rides DESC
LIMIT 10;


WITH daily_snowfall AS (
    SELECT 
        DATE(datetime) AS snow_date,
        SUM(CAST(snowfall AS FLOAT)) AS total_snowfall
    FROM daily_weather
    WHERE 
        datetime BETWEEN '2020-01-01' AND '2024-08-31'
        AND snowfall IS NOT NULL
    GROUP BY snow_date
),
daily_ride_counts AS (
    SELECT 
        DATE(pickup_time) AS ride_date,
        COUNT(*) AS total_rides
    FROM (
        SELECT pickup_time FROM taxi_trips
        UNION ALL
        SELECT pickup_time FROM uber_trips
    )
    WHERE pickup_time BETWEEN '2020-01-01' AND '2024-08-31'
    GROUP BY ride_date
)
SELECT 
    ds.snow_date AS date,
    ds.total_snowfall AS snowfall,
    COALESCE(drc.total_rides, 0) AS total_rides
FROM daily_snowfall ds
LEFT JOIN daily_ride_counts drc
ON ds.snow_date = drc.ride_date
ORDER BY ds.total_snowfall DESC
LIMIT 10;


WITH hourly_popularity AS (
    SELECT 
        strftime('%H', pickup_time) AS hour, -- Extract hour (00-23) from pickup_time
        COUNT(*) AS ride_count -- Count the number of rides for each hour
    FROM taxi_trips
    WHERE 
        pickup_time >= '2020-01-01' -- Start date
        AND pickup_time <= '2024-08-31' -- End date
    GROUP BY hour -- Group by hour
)
SELECT 
    hour, -- Hour of the day
    ride_count -- Number of rides
FROM hourly_popularity
ORDER BY ride_count DESC; -- Sort by ride count in descending order

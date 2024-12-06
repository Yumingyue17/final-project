
WITH weekly_popularity AS (
    SELECT 
        strftime('%w', pickup_time) AS day_of_week, -- Extract day of the week (0-6, where 0 is Sunday)
        COUNT(*) AS ride_count -- Count the number of rides for each day
    FROM uber_trips
    WHERE 
        pickup_time >= '2020-01-01' -- Start date
        AND pickup_time <= '2024-08-31' -- End date
    GROUP BY day_of_week -- Group by day of the week
)
SELECT 
    CASE day_of_week
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week, -- Convert numeric day to name
    ride_count
FROM weekly_popularity
ORDER BY ride_count DESC; -- Sort by ride count in descending order

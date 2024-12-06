
CREATE TABLE IF NOT EXISTS hourly_weather(
    datetime DATETIME,
    precipitation FLOAT,
    windspeed FLOAT
)

CREATE TABLE IF NOT EXISTS daily_weather(
    datetime DATETIME,
    avg_windspeed FLOAT,
    precipitation FLOAT,
    snowfall FLOAT,
    sustained_windspeed FLOAT,
    daily_weather TEXT
)

CREATE TABLE IF NOT EXISTS taxi(
    vendor_id INT,
    pickup_time DATETIME NOT NULL,
    dropoff_time DATETIME NOT NULL,
    passenger_count INT,
    trip_distance FLOAT,
    fare_amount FlOAT,
    tax FLOAT,
    tip FLOAT,
    tolls FLOAT,
    imp_surcharge FLOAT,
    total_amount FLOAT,
    con_surcharge FLOAT,
    airport_fee FLOAT,
    pickup_lat FLOAT,
    pickup_lon FLOAT,
    dropoff_lat FLOAT,
    dropoff_lon FLOAT
)

CREATE TABLE IF NOT EXISTS uber(
    license_number TEXT,
    dispatch_base TEXT,
    origin_base TEXT,
    request_time DATETIME,
    on_scene_time DATETIME,
    pickup_time DATETIME,
    dropoff_time DATETIME,
    trip_distance FLOAT,
    trip_duration INT,
    fare_amount FLOAT,
    tolls FLOAT,
    tax FLOAT,
    con_surcharge FLOAT,
    tips FLOAT,
    pickup_lat FLOAT,
    pickup_lon FLOAT,
    dropoff_lat FLOAT,
    dropoff_lon FLOAT
    )

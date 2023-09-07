--------------------------------Data Analysis----------------------------------

------------------------------type of bikes used by riders---------------------
SELECT rideable_type AS bike_type, member_casual, count(*) AS number_of_rides
FROM `trip_data.null_cleaned_data`
GROUP BY rideable_type, member_casual
ORDER BY member_casual,number_of_rides DESC;

------------------------------number of trips per month--------------------
SELECT month, member_casual, COUNT(ride_id) AS total_trips
FROM `trip_data.null_cleaned_data`
GROUP BY month, member_casual
ORDER BY member_casual,total_trips DESC;

------------------------------number of trips per day-----------------------
SELECT day_of_week, member_casual, COUNT(ride_id) AS total_trips
FROM `trip_data.null_cleaned_data`
GROUP BY day_of_week, member_casual
ORDER BY member_casual ,total_trips DESC;

------------------------------numbers of trips per hour---------------------
SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, COUNT(ride_id) AS total_trips
FROM `trip_data.null_cleaned_data`
GROUP BY hour_of_day, member_casual
ORDER BY member_casual,total_trips DESC;


----------------------------average ride duration per month---------------------
SELECT month, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `trip_data.null_cleaned_data`
GROUP BY month, member_casual;


--------------------------average ride duration per day of week----------------
SELECT day_of_week, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `trip_data.null_cleaned_data`
GROUP BY day_of_week, member_casual;


-------------------------average ride duration per hour--------------------
SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `trip_data.null_cleaned_data`
GROUP BY hour_of_day, member_casual;


------------------------------start stations locations-----------------------------
SELECT start_station_name, member_casual,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM `trip_data.null_cleaned_data`
GROUP BY start_station_name, member_casual;


----------------------------end stations locations------------------
SELECT end_station_name, member_casual,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM `trip_data.null_cleaned_data`
GROUP BY end_station_name, member_casual
order by total_trips DESC;


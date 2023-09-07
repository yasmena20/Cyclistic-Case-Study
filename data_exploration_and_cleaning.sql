----------------------------Data exploration and cleaning---------------------------------

----------------------------count number of nulls for each column-------------------------
SELECT COUNT(*) - COUNT(ride_id) as ride_id,
 COUNT(*) - COUNT(rideable_type) as rideable_type,
 COUNT(*) - COUNT(started_at) as started_at,
 COUNT(*) - COUNT(ended_at) as ended_at,
 COUNT(*) - COUNT(start_station_name) as start_station_name,
 COUNT(*) - COUNT(start_station_id) as start_station_id,
 COUNT(*) - COUNT(end_station_name) as end_station_name,
 COUNT(*) - COUNT(end_station_id) as end_station_id,
 COUNT(*) - COUNT(start_lat) as start_lat,
 COUNT(*) - COUNT(start_lng) as start_lng,
 COUNT(*) - COUNT(end_lat) as end_lat,
 COUNT(*) - COUNT(end_lng) as end_lng,
 COUNT(*) - COUNT(member_casual) as member_casual
FROM trip_data.combined_data;

----------------------------check duplicates and length for ride_id-------------------------
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM trip_data.combined_data;

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS number_of_rows
FROM trip_data.combined_data
GROUP BY length_ride_id;


---------------------check types of bikes from rideable_typecolumn and number of trips for each bike---------------------
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS number_of_trips
FROM trip_data.combined_data
GROUP BY rideable_type
order by number_of_trips DESC;

-----------------------check numbers of rides less than 1 min and longer than a day---------------------------
SELECT COUNT(*) AS less_than_minute
FROM trip_data.combined_data
WHERE DATE_DIFF(ended_at,started_at,minute) <= 1;     --num of less_than_min rows=264637

SELECT COUNT(*) AS longer_than_day
FROM trip_data.combined_data
WHERE DATE_DIFF(ended_at,started_at,minute) >= 1440;   --num of longer_than_day rowrs=5292


----------------------------remove rides less than 1 or bigger than 1440 and add col rid_length--------------------
create table `trip_data.clean_ridelength_data` AS (
  SELECT *, DATE_DIFF(ended_at,started_at,minute)  as ride_length  
  from trip_data.combined_data
  where 
  DATE_DIFF(ended_at,started_at,minute) > 1
  AND DATE_DIFF(ended_at,started_at,minute) < 1440
);


----------------------------add columns day_of_week and month to the data-------------------------
create table `trip_data.extract_day_month_data` AS (
  select *,
   CASE EXTRACT(DAYOFWEEK FROM started_at) 
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'    
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month
    from `trip_data.clean_ridelength_data`
);


---------------------------------remove null cells from the data----------------------------------
create table `trip_data.null_cleaned_data` AS (
  select * 
  from `trip_data.extract_day_month_data`
  where 
    start_station_name IS NOT NULL AND
    start_station_id IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_station_id IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL
);

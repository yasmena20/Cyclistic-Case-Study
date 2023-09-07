----------------------------Combine 12 months data tables into one table-------------------------

CREATE TABLE trip_data.combined_data AS (
  SELECT * FROM `cyclistic-case-study-001.trip_data.202208`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202209`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202210`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202211`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202212`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202301`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202302`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202303`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202304`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202305`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202306`
  UNION ALL
  SELECT * FROM `cyclistic-case-study-001.trip_data.202307`
);

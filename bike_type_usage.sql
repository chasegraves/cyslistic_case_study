WITH CombinedData AS (
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2022_10`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2022_11`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2022_12`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_01`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_02`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_03`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_04`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_05`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_06`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_07`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_08`
  UNION ALL
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS Month,
    rideable_type
  FROM cyclistic_data.`2023_09`
)

SELECT
  FORMAT_TIMESTAMP('%Y_%m', Month) AS Month,
  rideable_type,
  COUNT(*) AS RideCount
FROM CombinedData
GROUP BY Month, rideable_type
ORDER BY Month, rideable_type;

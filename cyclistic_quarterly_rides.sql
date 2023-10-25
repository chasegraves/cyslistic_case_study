SELECT
    CASE
        WHEN ride_date <= '2022-12-31' THEN 'Q4-2022'
        WHEN ride_date <= '2023-03-31' THEN 'Q1-2023'
        WHEN ride_date <= '2023-06-30' THEN 'Q2-2023'
        WHEN ride_date <= '2023-09-30' THEN 'Q3-2023'
    END AS Quarter,
    COUNT(*) AS TotalEntries
FROM
(
    SELECT ride_date
    FROM cyclistic_data.`2022_10`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2022_11`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2022_12`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_01`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_02`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_03`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_04`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_05`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_06`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_07`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_08`
    UNION ALL
    SELECT ride_date
    FROM cyclistic_data.`2023_09`
) Quarters
GROUP BY Quarter
ORDER BY
    CASE
        WHEN Quarter = 'Q4-2022' THEN 1
        WHEN Quarter = 'Q1-2023' THEN 2
        WHEN Quarter = 'Q2-2023' THEN 3
        WHEN Quarter = 'Q3-2023' THEN 4
    END;

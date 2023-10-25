WITH DayOfWeekOrder AS (
    SELECT 1 AS day_order, 'Sunday' AS DayOfWeek
    UNION ALL SELECT 2, 'Monday'
    UNION ALL SELECT 3, 'Tuesday'
    UNION ALL SELECT 4, 'Wednesday'
    UNION ALL SELECT 5, 'Thursday'
    UNION ALL SELECT 6, 'Friday'
    UNION ALL SELECT 7, 'Saturday'
)

SELECT
    dwo.DayOfWeek,
    COALESCE(TrafficCount, 0) AS TrafficCount
FROM DayOfWeekOrder dwo
LEFT JOIN (
    SELECT
        CASE day_of_week
            WHEN 1 THEN 'Sunday'
            WHEN 2 THEN 'Monday'
            WHEN 3 THEN 'Tuesday'
            WHEN 4 THEN 'Wednesday'
            WHEN 5 THEN 'Thursday'
            WHEN 6 THEN 'Friday'
            WHEN 7 THEN 'Saturday'
        END AS DayOfWeek,
        COUNT(*) AS TrafficCount
    FROM (
        SELECT day_of_week FROM cyclistic_data.`2022_10`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2022_11`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2022_12`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_01`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_02`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_03`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_04`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_05`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_06`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_07`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_08`
        UNION ALL SELECT day_of_week FROM cyclistic_data.`2023_09`
    ) CombinedData
    GROUP BY DayOfWeek
) TrafficData
ON dwo.DayOfWeek = TrafficData.DayOfWeek
ORDER BY dwo.day_order;

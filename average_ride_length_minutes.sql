SELECT
    t.table_name AS Month,
    p.member_casual,
    AVG(
        CAST(EXTRACT(HOUR FROM p.ride_length) * 3600 + EXTRACT(MINUTE FROM p.ride_length) * 60 + EXTRACT(SECOND FROM p.ride_length) AS DECIMAL) / 60
    ) AS AverageRideLengthInMinutes
FROM (
    SELECT '2022_10' AS table_name
    UNION ALL SELECT '2022_11'
    UNION ALL SELECT '2022_12'
    UNION ALL SELECT '2023_01'
    UNION ALL SELECT '2023_02'
    UNION ALL SELECT '2023_03'
    UNION ALL SELECT '2023_04'
    UNION ALL SELECT '2023_05'
    UNION ALL SELECT '2023_06'
    UNION ALL SELECT '2023_07'
    UNION ALL SELECT '2023_08'
    UNION ALL SELECT '2023_09'
) t
JOIN (
    SELECT
        member_casual,
        ride_length,
        table_name
    FROM (
        SELECT member_casual, ride_length, '2022_10' AS table_name FROM cyclistic_data.`2022_10`
        UNION ALL SELECT member_casual, ride_length, '2022_11' FROM cyclistic_data.`2022_11`
        UNION ALL SELECT member_casual, ride_length, '2022_12' FROM cyclistic_data.`2022_12`
        UNION ALL SELECT member_casual, ride_length, '2023_01' FROM cyclistic_data.`2023_01`
        UNION ALL SELECT member_casual, ride_length, '2023_02' FROM cyclistic_data.`2023_02`
        UNION ALL SELECT member_casual, ride_length, '2023_03' FROM cyclistic_data.`2023_03`
        UNION ALL SELECT member_casual, ride_length, '2023_04' FROM cyclistic_data.`2023_04`
        UNION ALL SELECT member_casual, ride_length, '2023_05' FROM cyclistic_data.`2023_05`
        UNION ALL SELECT member_casual, ride_length, '2023_06' FROM cyclistic_data.`2023_06`
        UNION ALL SELECT member_casual, ride_length, '2023_07' FROM cyclistic_data.`2023_07`
        UNION ALL SELECT member_casual, ride_length, '2023_08' FROM cyclistic_data.`2023_08`
        UNION ALL SELECT member_casual, ride_length, '2023_09' FROM cyclistic_data.`2023_09`
    ) Participants
) p ON t.table_name = p.table_name
GROUP BY t.table_name, p.member_casual
ORDER BY t.table_name, p.member_casual;

SELECT
    `Month`,
    EXTRACT(HOUR FROM `Median`) * 60 + EXTRACT(MINUTE FROM `Median`) AS `Median_Minutes`,
    `UserType`
FROM
    `cyclistic_data`.`median_data`

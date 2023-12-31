# Cyclistic Bike-Share Analysis: Google Data Analytics Case Study

## Introduction
Welcome to the Cyclistic bike-share analysis case study! In this case study, you will perform many real-world tasks of a junior data
analyst. You will work for a fictional company, Cyclistic, and meet different characters and team members. In order to answer the
key business questions, you will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act.

## Scenario
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of
marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your
team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will
design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your
recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### Characters and teams
▪ Cyclistic: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart
by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities
and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use
the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each
day.

▪ Lily Moreno: The director of marketing and your manager. Moreno is responsible for the development of campaigns and
initiatives to promote the bike-share program. These may include email, social media, and other channels.

▪ Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analyzing, and reporting
data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy learning about
Cyclistic’s mission and business goals — as well as how you, as a junior data analyst, can help Cyclistic achieve them.

▪ Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the
recommended marketing program.

### About the company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are
geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to
any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One
approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and
annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who
purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing
flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to
future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good
chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have
chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do
that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual
riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in
analyzing the Cyclistic historical bike trip data to identify trends.

## Ask 

In this phase three questions are presented to guide the future marketing program: 

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

### Business Task
How do annual members and casual riders use Cyclistic bikes differently?

## Prepare

### Data Sources
Data was accessed through the Google Data Analytics Certification. You can find the data files [here](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).

### Data Storage
Files were downloaded locally from the provided file bucket allowing easy access to data. The following files were selected to analyze the most recent performance year at Cyclistic: 

 202210-divvy-tripdata.zip	
 
 202211-divvy-tripdata.zip
 
 202212-divvy-tripdata.zip	
 
 202301-divvy-tripdata.zip	
 
 202302-divvy-tripdata.zip
 
 202303-divvy-tripdata.zip
 
 202304-divvy-tripdata.zip	
 
 202305-divvy-tripdata.zip
 
 202306-divvy-tripdata.zip
 
 202307-divvy-tripdata.zip	
 
 202308-divvy-tripdata.zip	
 
 202309-divvy-tripdata.zip

Files were unzipped and stored into one file. I created a copy of each CSV file to maintain an original version. 

## Process

First step was to make the remaining files to make it easier to organize and access. File names were changed from '202210-divvy-tripdata.zip' to '2022_10' for each respective month and year. 

Files were then accessed through Microsoft Excel for cleansing. Each file contained the following column names: 

![image](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/df1e6d97-f1fd-4271-adc9-8f3de3f4f7ea)


### Data Cleansing

1. A Column was created titled 'ride_length' measuring the difference between 'ended_at' and 'started at' to determine time spent per trip using ```=D2-C2```.

2. 'ride_length' numbers were formatted to ```HH:MM:SS```.
   
3. Average values for ride length were calculated using ```=AVERAGE(N2:N999999)```.

5. Next column created was called 'day_of_week' to determine the weekday of each recorded entry. The formula used was ```=WEEKDAY(C2, 1)``` Scaling from Sunday = 1, to Saturday = 7.
  
6. Data was converted into a table for organization by accessing 'Insert > Table > Selection of all cells. 

7. 'ride_length' was filtered to show minimum and maximum values, revealing potential biases in data.
  
8. Minimum value outliers with invalid entries such as ```##########``` were changed to the calculated averages for improved accuracy.

9. Maximum value outliers exceeding the SQL allowance of ```23:59:59``` were replaced with the calculated averages for improved accuracy.

10. Delimited the column 'started_at' to separate the dates listed from the time in a new column. Delimiter was available under Data > Text to Columns. The new column name was titled 'ride_date'.

11. Filtered through 'member_casual' one at a time to reveal median values for both 'member' and 'casual'. The formula used was ```=MEDIAN(P2:P999999)```. These were saved into new columns.

12. A new excel document was created titled 'median_data' where I stored the results of all median values for each file. The columns in the file were titled as the following: ![image](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/643a9ce5-7ce4-4b62-9338-b52742e95863)


## Analyze

The following stage was completed through SQL in Google BigQuery. A bucket was created to store all 13 files to use for analysis. Each section displays the working query that was used to gather the results. 

### Average Ride Length

In order to understand the relationship of how both members and casual riders use Cyclistic, a query was created to identify the average ride lengths in minutes over the course of the last 12 months. The following steps were implemented: 

1. Created a subquery using 't' to list the months as 'table_name' using the UNION ALL from October 2022 to September 2023.

2. Created a subquery using 'p' to select 'member_casual', 'ride_length', and 'table_name' which collects the data of each month.

3. CAST is ued to convert the calculated ride length from seconds to minutes in decimal format. 

4. EXTRACT to calculate the results from seconds into minutes for both members and casual riders.

5. JOIN combines the data from the subqueries 't' representing months, and 'p' representing the rider type.

6. UNION ALL once again to pull 'member_casual' and 'ride_length' from all tables. 

7. GROUP BY for 'table_name' and 'member_casual' to ensure that the calculations are done for each combination of these values.

8. ORDER BY sorts the data by month and rider type. 

9. The results create a new column named 'AverageRideLengthInMinutes' with the results of the averages for both members and casual riders for the past 12 months. 

```
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
```

![AverageRideLengthInMinutes by Month](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/2a3d843a-faec-43c1-94b4-db0485072117)



### Median Ride Length

Due to potential biases from outliers in the averages, the median ride length was used to support the previous query. Since a worksheet was created specifically for this calculation the only table used was 'median_data'.

1. The query selects all three columns, 'Month', 'Median, 'UserType'.

2. EXTRACT to calculate the ride length into minutes.

3. The results consolidate the data based on the 'UserType', which identifies either 'Member' or 'Casual'. 



```
SELECT
    `Month`,
    EXTRACT(HOUR FROM `Median`) * 60 + EXTRACT(MINUTE FROM `Median`) AS `Median_Minutes`,
    `UserType`
FROM
    `cyclistic_data`.`median_data`
```

![Median_Minutes by UserType](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/2f152705-9503-444e-8fdb-fa0f1c0d2a42)



### Bike Usage by Type

In order to understand customer preferences when using Cyclistic, an analysis of bike type utilization was performed. There are three bike types used in Cyclistic's services: Electric, Classic and Docked. 

1. UNION ALL to consolidate data from all previous 12 months. 

2. DATA_TRUNC to truncate 'ride_date' to their respective months. 

3. FORMAT_TIMESTAMP to convert the file titles into their respective months. 

4. COUNT(*) was used to count the number of rides for each combination of month and bike type.

5. Pulled the data as 'CombinedData'.

6. GROUPBY allowed the results to be grouped by 'Month' and 'rideable_type'

7. A new column was generated called 'RideCount' to list the total rides of each bike type per month. 

```
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
```

![RideCount by rideable_type](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/3accfed6-8086-48fe-a50b-931c98ddb46d)



### Traffic by Day of Week 

A traffic analysis was performed based on the days of the week to understand which days have the highest usage. 

1. DayOfWeekOrder was implemented to assign a numerical 'day_order' starting from Sunday (1), to Saturday (7)

2. UNION ALL to combine all the days of the week. 

3. DayOfWeek and COALESCE are selected to calculate as 'TrafficCount' which represents the total counts per day of the week. COALESCE is also used to counter potential NULL values returning as '0'.

4. LEFT JOIN to ensure results include all the days of the week. 

5. CASE was used to connect the numerical value of 'day_of_week' to the full name of each day. 

6. COUNT(*) adds up the total amount of rides for each day of the week to a new column called 'TrafficCount'.

7. UNION ALL to select 'day_of_week' data from all 12 tables.

8. ORDER BY organizes the data into each day of the week. 

```
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
```

![TrafficCount by DayOfWeek](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/65d9ab11-8af5-45c4-bb30-65a478a7a6f1)



### Total Member/Casual Rides

This query was created to see how many Cyclistic users are currently members or casual users. This allows us to see where the company stands regards retention and growth to optimize business strategies. 

1. Created a subquery using 't' to define the previous 12 months. 

2. (p.Count/ SUM(p.Count) OVER (PARTITION BY t.table.name)) allows the query to initiate the calculation of the percentage of casual to member usage. Following it is multipled by 100 to be written as a percentage.  

3. SUM(p.Count) OVER (PARTITION BY t.table.name) additionally allows the query to calculate the total rides for each month.

4. UNION ALL SELECT for subquery 't' transforms the file names to become the table names.

5. Created a subquery using 'p' along with 'Count' to add up the rides for each month and categorize results as 'member' or 'casual'.
   
6. JOIN is used to combine the results of the month subquery 't', and the count subquery 'p'.

7. UNION ALL SELECT for subquery 'p' allows the query to select 'member_casual' and the new date column '2022_10' from all 12 tables. 

8. PARTICIPANTS aggregates and prepares the data from all tables.

9. GROUP BY is used to aggregate by 'table_name' and 'member_casual'.

10. ON allows us to specify the join conditions of 't' and 'p'.

11. ORDER BY will organize the data based on the month and the total rides of members and casual riders. 

```
SELECT
    t.table_name AS Month,
    p.member_casual,
    p.Count,
    (p.Count / SUM(p.Count) OVER (PARTITION BY t.table_name)) * 100 AS Percentage
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
        table_name,
        COUNT(*) AS Count
    FROM (
        SELECT member_casual, '2022_10' AS table_name FROM cyclistic_data.`2022_10`
        UNION ALL SELECT member_casual, '2022_11' FROM cyclistic_data.`2022_11`
        UNION ALL SELECT member_casual, '2022_12' FROM cyclistic_data.`2022_12`
        UNION ALL SELECT member_casual, '2023_01' FROM cyclistic_data.`2023_01`
        UNION ALL SELECT member_casual, '2023_02' FROM cyclistic_data.`2023_02`
        UNION ALL SELECT member_casual, '2023_03' FROM cyclistic_data.`2023_03`
        UNION ALL SELECT member_casual, '2023_04' FROM cyclistic_data.`2023_04`
        UNION ALL SELECT member_casual, '2023_05' FROM cyclistic_data.`2023_05`
        UNION ALL SELECT member_casual, '2023_06' FROM cyclistic_data.`2023_06`
        UNION ALL SELECT member_casual, '2023_07' FROM cyclistic_data.`2023_07`
        UNION ALL SELECT member_casual, '2023_08' FROM cyclistic_data.`2023_08`
        UNION ALL SELECT member_casual, '2023_09' FROM cyclistic_data.`2023_09`
    ) Participants
    GROUP BY table_name, member_casual
) p ON t.table_name = p.table_name
ORDER BY t.table_name, p.member_casual;
```

![Count by member_casual](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/6634ea07-f1c3-4780-95ef-e3d0dd91787f)



### Total Cyclistic Rides

This query summarizes the total amount of rides completed through Cyclistic per Quarter to gain insight into seasonal trends and business growth. 

1. CASE categorizes the 'ride_date' into quarters of the year (Q4 - 2022, Q1 - 2023, etc.) 

2. COUNT(*) adds up the total number of entries for each quarter.

3. FROM pulls the 'ride_date' data from all tables in the dataset.

4. UNION ALL selects all 12 months to extract data from. 

5. GROUP BY puts the groups of data per quarter based on the CASE statement from previous.

6. CASE is used again to ensure the months are listed in chronological order. 


```
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
```

![TotalEntries by Quarter](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/5d02685d-c136-4045-b9dc-479041d8a5ae)

## Share

Now that the data analysis has been performed it is time to support the data through visualization of the key findings. Data was downloaded from all 6 SQL queries and uploaded through Tableau Desktop. The Tableau public link can be accessed right [here](https://public.tableau.com/views/CyclisticCaseStudy_16987003486520/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link).

### Calculated Fields

Calculated fields were used for 'Average Ride Length', 'Median Ride Length', 'Bike Usage by Type', and 'Total Member/Casual Rides' to combine data into per quarter views. This reduced cluttered data in the Tableau dashboard and provided additional insights into seasonal trends.

```
IF RIGHT([Month], 2) >= '01' AND RIGHT([Month], 2) <= '03' THEN 'Q1'
ELSEIF RIGHT([Month], 2) >= '04' AND RIGHT([Month], 2) <= '06' THEN 'Q2'
ELSEIF RIGHT([Month], 2) >= '07' AND RIGHT([Month], 2) <= '09' THEN 'Q3'
ELSE 'Q4'
END
```

![Dashboard 1](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/d5a783a1-9985-4a14-9939-8328f4f832bb)

## Act

Now that we have shared the results from the analysis, we can provide recommendations for Cyclistic to implement in order to capitalize on the opportunities identified and address specific areas of improvement. These recommendations are tailored to enhance the company's operational strategies, retain existing customers, and attract new, long-term members. 

### Implement Targeted Seasonal Promotions

The data analysis reveals that casual riders tend to take longer rides, especially during the warmer months, such as Q2 and Q3. To capitalize on this trend, Cyclistic should introduce targeted seasonal promotions during spring and summer. These promotions could include discounted rates or special offers for leisurely rides, encouraging casual riders to choose annual memberships for cost savings during the peak riding season.

### Emphasize Cost-Effective Annual Memberships

The analysis demonstrates that annual members opt for shorter trips than casual riders. Cyclistic should emphasize the cost-effectiveness of annual memberships, especially for daily commuters. Promotions or marketing campaigns should highlight how annual memberships result in substantial savings for those who use the service regularly, making it an attractive option for commuters and frequent users.

### Enhance Electric Bike Offerings

Electric bikes have gained popularity among casual riders and annual members, with longer ride lengths. To further entice casual riders into becoming annual members, Cyclistic should focus on expanding and enhancing its electric bike offerings. This could include increasing the availability of electric bikes, introducing new models, and promoting their benefits. 

## Conclusion

Throughout this project, I assumed the role of a junior data analyst, guiding the entire process through the six essential phases of data analysis: asking questions, preparing data, processing information, conducting analysis, sharing insights, and, finally, taking action. This journey allowed me to apply a diverse set of skills, including proficiency in spreadsheets, R, SQL, and Tableau. As I navigated each stage, I gained valuable experience and knowledge, reinforcing the significance of data-driven decision-making and the impact it can have on businesses. 

## Appendix 

I initially used R to calculate the median ride length from the available data, however chose to not use the final result due to compatability issues with Tableau. The formula does work and resulted in an accurate bar graph of the median ride length values. 

```
R version 4.3.1 (2023-06-16) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin20 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.79 (8238) x86_64-apple-darwin20]

[Workspace restored from /Users/chasegraves/.RData]
[History restored from /Users/chasegraves/.Rapp.history]

> install.packages("dplyr")
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://cran.case.edu/bin/macosx/big-sur-x86_64/contrib/4.3/dplyr_1.1.3.tgz'
Content type 'application/x-gzip' length 1589767 bytes (1.5 MB)
==================================================
downloaded 1.5 MB


The downloaded binary packages are in
	/var/folders/y8/56tqmcp17rlbc29n14kz9kk00000gn/T//RtmpQfXrI5/downloaded_packages
> install.packages("readr")
trying URL 'https://cran.case.edu/bin/macosx/big-sur-x86_64/contrib/4.3/readr_2.1.4.tgz'
Content type 'application/x-gzip' length 1974812 bytes (1.9 MB)
==================================================
downloaded 1.9 MB


The downloaded binary packages are in
	/var/folders/y8/56tqmcp17rlbc29n14kz9kk00000gn/T//RtmpQfXrI5/downloaded_packages
> install.packages("ggplot2")
trying URL 'https://cran.case.edu/bin/macosx/big-sur-x86_64/contrib/4.3/ggplot2_3.4.4.tgz'
Content type 'application/x-gzip' length 4306767 bytes (4.1 MB)
==================================================
downloaded 4.1 MB


The downloaded binary packages are in
	/var/folders/y8/56tqmcp17rlbc29n14kz9kk00000gn/T//RtmpQfXrI5/downloaded_packages
> install.packages("tidyverse")
trying URL 'https://cran.case.edu/bin/macosx/big-sur-x86_64/contrib/4.3/tidyverse_2.0.0.tgz'
Content type 'application/x-gzip' length 428408 bytes (418 KB)
==================================================
downloaded 418 KB


The downloaded binary packages are in
	/var/folders/y8/56tqmcp17rlbc29n14kz9kk00000gn/T//RtmpQfXrI5/downloaded_packages
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> library(readr)
> library(ggplot2)
> library(tidyverse)
── Attaching core tidyverse packages ────────────────────────────────────────────────────── tidyverse 2.0.0 ──
✔ forcats   1.0.0     ✔ stringr   1.5.0
✔ lubridate 1.9.3     ✔ tibble    3.2.1
✔ purrr     1.0.2     ✔ tidyr     1.3.0
── Conflicts ──────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
> library(tidyverse)
> data_folder <- "~/downloads/cyclistic_data"
> csv_files <- list.files(path = data_folder, pattern = ".csv", full.names = TRUE)
> data_extracted <- data.frame()
> for (file in csv_files) {
+   df <- read_csv(file)
+   first_casual <- df$median_casual[1]
+   first_member <- df$median_member[1]
+   month <- gsub(".csv", "", basename(file))
+   data_extracted <- rbind(data_extracted, data.frame(Month = month, Median_Casual = first_casual, Median_Member = first_member))
+ }
Rows: 558685 Columns: 19                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (11): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 337735 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 181806 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 190301 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 190445 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 258678 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 426590 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 604827 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 719618 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 767650 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 580416 Columns: 18                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (10): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 666371 Columns: 19                                                                                    
── Column specification ──────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (11): ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station...
dbl   (5): start_lat, start_lng, end_lat, end_lng, day_of_week
time  (3): ride_length, median_casual, median_member

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> data_extracted %>%
+   pivot_longer(cols = c(Median_Casual, Median_Member), names_to = "User_Type", values_to = "Median_Value") %>%
+   ggplot(aes(x = Month, y = Median_Value, fill = User_Type)) +
+   geom_bar(stat = "identity", position = "dodge", width = 0.7) +
+   labs(title = "Second Value of Median Ride Length by Month for Member and Casual",
+        y = "Median Ride Length",
+        x = "Month") +
+   scale_fill_manual(values = c("Median_Casual" = "blue", "Median_Member" = "red")) +
+   theme_minimal() +
+   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
+   guides(fill = guide_legend(title = "User Type")) +
+   coord_flip()
```
![image](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/880ac798-94cc-48f5-b8a6-8217d8dea597)

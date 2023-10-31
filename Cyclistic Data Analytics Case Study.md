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

First step was remaining files to make it easier to organize and access. Files named were changed from '202210-divvy-tripdata.zip' to '2022_10' for each respective month and year. 

Files were then accessed through Microsoft Excel for cleansing. Each file contained the following column names: 

![image](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/df1e6d97-f1fd-4271-adc9-8f3de3f4f7ea)


### Data Cleansing

1. A Column was created titled 'ride_length' measuring the difference between 'ended_at' and 'started at' to determine time spent per trip using =D2-C2

2. 'ride_length' numbers were formatted to HH:MM:SS
   
3. Average values for ride length were calculated using =AVERAGE(N2:N500000).

5. Next column created was called 'day_of_week' to determine the weekday of each recorded entry. The formula used was =WEEKDAY(C2, 1) Scaling from Sunday = 1, to Saturday = 7.
  
6. Data was converted into a table for organization by accessing 'Insert > Table > Selection of all cells. 

7. 'ride_length' was filtered to show minimum and maximum values, revealing potential biases in data.
  
8. Minimum value outliers with invalid entries such as '##########' were changed to the calculated averages for improved accuracy.

9. Maximum value outliers exceeding the SQL allowance of '23:59:59' were replaced with the calculated averages for improved accuracy.

10. Delimited the column 'started_at' to separate the dates listed from the time in a new column. Delimiter was available under Data > Text to Columns. The new column name was titled 'ride_date'.

11. Filtered through 'member_casual' one at a time to reveal median values for both 'member' and 'casual'. The formula used was =MEDIAN(P2:P500000). These were saved into new columns.

12. A new excel document was created titled 'median_data' where I stored the results of all median values for each file. The columns in the file were titled as the following: ![image](https://github.com/chasegraves/cyslistic_case_study/assets/148483283/643a9ce5-7ce4-4b62-9338-b52742e95863)


## Analyze

The following stage was completed through SQL. A bucket was created to store all 13 files to use for analysis. 

### Median Ride Length

```
SELECT
    `Month`,
    EXTRACT(HOUR FROM `Median`) * 60 + EXTRACT(MINUTE FROM `Median`) AS `Median_Minutes`,
    `UserType`
FROM
    `cyclistic_data`.`median_data`
```





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

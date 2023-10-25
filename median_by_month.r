
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
> 
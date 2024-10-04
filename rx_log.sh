#!/bin/bash

# Create the filename for today’s wttr.in weather report
today=$(date +%Y%m%d)
weather_report=raw_data_$today

# Download the wttr.in weather report for Casablanca and save it with the filename you created
city=Casablanca
curl wttr.in/$city --output $weather_report

# use command substitution to store the current day, month, and year in corresponding shell variables:
hour=$(TZ='Morocco/Casablanca' date -u +%H) 
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

# Extract only those lines that contain temperatures from the weather report, and write your result to file
grep °C $weather_report > temperatures.txt

# Extract the current temperature, and store it in a shell variable called obs_tmp
obs_tmp=$(head -1 temperatures.txt | tr -s " " | xargs | rev | cut -d " " -f2 | rev)

# Extract tomorrow’s temperature forecast for noon, and store it in a shell variable called fc_tmp
fc_temp=$(head -3 temperatures.txt | tail -1 | tr -s " " | xargs | cut -d "C" -f2 | rev | cut -d " " -f2 | rev)

# Append the resulting record as a row of data to your weather log file
record=$(echo -e "$year\t$month\t$day\t$hour\t$obs_tmp\t$fc_temp")
echo $record>>rx_poc.log

# Schedule your bash script rx_poc.sh to run every day at noon local time
# Check the time difference between your system’s default time zone and UTC.
# Use the date command twice with appropriate options

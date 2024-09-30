# shell_script
Shell script project for training purpose

Practice Project: Introduction
Scenario

You've been tasked by your team to create an automated Extract, Transform, Load (ETL) process to extract daily weather forecast 
and observed weather data and load it into a live report to be used for further analysis by the analytics team. 
As part of a larger prediction modelling project, the team wants to use the report to monitor and measure the historical accuracy 
of temperature forecasts by source and station.

As a proof-of-concept (POC), you are only required to do this for a single station and one source to begin with. 
For each day at noon (local time), you will gather both the actual temperature and the temperature forecasted for noon on the 
following day for Casablanca, Morocco.

At a later stage, the team anticipates extending the report to include lists of locations, different forecasting sources, 
different update frequencies, and other weather metrics such as wind speed and direction, precipitation, and visibility.
Data source

For this practice project, you'll use the weather data package provided by the open source project wttr.in, a web service that 
provides weather forecast information in a simple and text-based format. 
For further information, you can read more about the service on its GitHub Repo.

First, you'll use the curl command to scrape weather data via the wttr.in website. 
For example, to get data for Casablanca, enter:

    1

    curl wttr.in/casablanca

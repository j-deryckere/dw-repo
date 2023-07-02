SELECT * FROM read_csv_auto('*citibike-tripdata.csv.gz', union_by_name=True) as bike_data;
select * from read_csv_auto(['data/central_park_weather.csv'],filename=True) as central_park_weather;
select * from read_csv_auto(['data/fhv_bases.csv'],filename=True) as fhv_bases;
select * from read_csv_auto(['data/daily_citi_bike_trip_counts_and_weather.csv'],filename=True) as daily_citi_bike_trip_counts_and_weather;


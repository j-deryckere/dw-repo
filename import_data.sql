SELECT * FROM read_csv_auto('*citibike-tripdata.csv.gz', union_by_name=True) as bike_data;
select * from read_csv_auto(['data/central_park_weather.csv'],filename=True) as central_park_weather;

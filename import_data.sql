select * from read_csv_auto('data/bike/*.csv.gz', filename=True, union_by_name=True, ALL_VARCHAR=1) as bike_data;
select * from read_csv_auto(['data/central_park_weather.csv'],filename=True, ALL_VARCHAR=1) as central_park_weather;
select * from read_csv_auto(['data/daily_citi_bike_trip_counts_and_weather.csv'],filename=True, ALL_VARCHAR=1) as daily_citi_bike_trip_counts_and_weather;
select * from read_csv_auto(['data/fhv_bases.csv'],filename=True, ALL_VARCHAR=1) as fhv_bases;
select * from read_parquet('data/taxi/fhv_tripdata*.parquet', filename=True, union_by_name=True) as fhv_tripdata;
select * from read_parquet('data/taxi/fhvhv_tripdata*.parquet', filename=True, union_by_name=True) as fhvhv_tripdata;
select * from read_parquet('data/taxi/green*.parquet', filename=True, union_by_name=True) as green_tripdata;
select * from read_parquet('data/taxi/yellow*.parquet', filename=True, union_by_name=True) as yellow_tripdata;

CREATE TABLE bike_data AS select * from read_csv_auto('data/bike/*citibike-tripdata.csv.gz', filename=True, union_by_name=True, ALL_VARCHAR=1);
CREATE TABLE central_park_weather AS select * from read_csv_auto(['data/central_park_weather.csv'],filename=True, ALL_VARCHAR=1, union_by_name=True);
CREATE TABLE daily_citi_bike_trip_counts_and_weather AS select * from read_csv_auto(['data/daily_citi_bike_trip_counts_and_weather.csv'],filename=True, ALL_VARCHAR=1, union_by_name=True);
CREATE TABLE fhv_bases AS select * from read_csv_auto(['data/fhv_bases.csv'],filename=True, ALL_VARCHAR=1, union_by_name=True);
CREATE TABLE fhv_tripdata AS select * from read_parquet('data/taxi/fhv_tripdata*.parquet', filename=True, union_by_name=True);
CREATE TABLE fhvhv_tripdata AS select * from read_parquet('data/taxi/fhvhv_tripdata*.parquet', filename=True, union_by_name=True);
CREATE TABLE green_tripdata AS select * from read_parquet('data/taxi/green*.parquet', filename=True, union_by_name=True);
CREATE TABLE yellow_tripdata AS select * from read_parquet('data/taxi/yellow*.parquet', filename=True, union_by_name=True);

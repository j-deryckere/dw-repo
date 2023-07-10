with source as (select * from {{ source('main','bike_data') }}),

renamed as (select
	ride_id as ride_id,
	bikeid as bikeid,
	usertype,
	"birth year" as birthyear,
	gender,
	rideable_type,
	tripduration::int as tripduration,
	CONCAT(starttime, started_at)::timestamp as starttime,
	CONCAT(stoptime, ended_at)::timestamp as stoptime,
	CONCAT('start station id', start_station_id) as start_station_id,
	CONCAT('start station name', start_station_name) as start_station_name,
	CONCAT('start station latitude', start_lat)::double as start_latitude,
	CONCAT('start station longitude', start_lng)::double as start_longitude,
	CONCAT('end station id', end_station_id) as end_station_id,
	CONCAT('end station name', end_station_name) as end_station_name,
	CONCAT('end station latitude', end_lat)::double as end_latitude,
	CONCAT('end station longitude', end_lng)::double as end_longitude,
        member_casual,
	filename

        from source

)

select * from renamed

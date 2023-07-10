with source as (select * from {{ source('main','daily_citi_bike_trip_counts_and_weather') }}),

renamed as (select
        date::date as date,
        trips::int as trips,
        precipitation::int as precipitation,
	snow_depth::int as snow_depth,
	snowfall::int as snowfall,
	case when max_temperature = 'NA' then null else cast(max_temperature as double) end, --replace NA values with null and convert all else to double
	case when min_temperature = 'NA' then null else cast(min_temperature as double) end,  --replace NA values with null and convert all else to double
	case when average_wind_speed = 'NA' then null else cast(average_wind_speed as double) end, --replace NA values with null and convert all else to double
	case when dow = 'NA' then null else cast(dow as int) end,
	case when year = 'NA' then null else cast(year as int) end,
	case when month = 'NA' then null else cast(month as int) end,
	holiday,
	case when stations_in_service = 'NA' then null else cast(stations_in_service as int) end,
	weekday,
	weekday_non_holiday,
	filename

        from source)

select * from renamed

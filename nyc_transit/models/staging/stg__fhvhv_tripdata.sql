with source as (select * from {{ source('main','fhvhv_tripdata') }}),

renamed as (select
       	hvfhs_license_num,
        dispatching_base_num,
        originating_base_num,
        request_datetime,
        on_scene_datetime,
        pickup_datetime,
	dropoff_datetime,
	pulocationid,
	dolocationid,
	trip_miles,
	trip_time,
	base_passenger_fare,
	tolls,
	bcf,
	sales_tax,
	congestion_surcharge,
	airport_fee,
	tips,
	driver_pay,
	(case shared_request_flag when 'Y' then 1 when 'N' then 0 end)::boolean, --convert to boolean
	(case shared_match_flag when 'Y' then 1 when 'N' then 0 end)::boolean, --convert to boolean
	(case access_a_ride_flag when 'Y' then 1 when 'N' then 0 end)::boolean, --convert to boolean
	(case wav_request_flag when 'Y' then 1 when 'N' then 0 end)::boolean, --convert to boolean
	(case wav_match_flag when 'Y' then 1 when 'N' then 0 end)::boolean, --convert to boolean
        filename

        from source)

select * from renamed

with source as (select * from {{ source('main','green_tripdata') }}),

renamed as (select
	VendorID,
	lpep_pickup_datetime as pickup_datetime,
	lpep_dropoff_datetime as dropoff_datetime,
	store_and_fwd_flag,
	RatecodeID,
	PULocationID,
	DOLocationID,
	passenger_count,
	trip_distance,
	fare_amount,
	extra,
	mta_tax,
	tip_amount,
	tolls_amount,
	improvement_surcharge,
	total_amount,
	payment_type,
	trip_type,
	congestion_surcharge,
        filename

    	from source)

select * from renamed

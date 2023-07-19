with source as (select * from {{ source('main','fhv_tripdata') }}),

renamed as (select
        trim(upper(dispatching_base_num)) as dispatching_base_num,
	pickup_datetime,
        dropoff_datetime,
        pulocationid,
        dolocationid,
        --sr_flag removed due to all nulls 
	affiliated_base_number,
        filename
        from source)

select * from renamed

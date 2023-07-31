with trip_facts as
(select
    pulocationid,
    sum(duration_minute) as duration,
    count(*) as trips
    from {{ ref('mart__fact_all_taxi_trips') }}
group by pulocationid),

loc as
(select
    LocationID,
    borough,
    zone
    from {{ ref('mart__dim_locations') }})

select 
    borough,
    zone,
    avg(trip_facts.duration) as avg_duration,
    sum(trip_facts.trips) as trips,
from trip_facts
join loc on trip_facts.pulocationid = loc.locationid
group by borough, zone;

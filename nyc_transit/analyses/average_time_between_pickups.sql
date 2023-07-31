with zone_pickup_times as
(select
loc.zone as zone,
extract(epoch from (pickup_datetime - lead(pickup_datetime) over
   (partition by zone order by pickup_datetime asc)))
as pickup_time_diff
from {{ ref('mart__fact_all_taxi_trips') }} as taxi
join {{ ref('mart__dim_locations') }} as loc on
taxi.pulocationid = loc.locationid
group by zone, pickup_datetime)

select
zone,
avg(pickup_time_diff) as zone_avg
from zone_pickup_times
group by zone;

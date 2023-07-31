select
loc.zone,
count(*)
from {{ ref('mart__fact_all_taxi_trips') }} as trips
join {{ ref('mart__dim_locations') }} as loc on
trips.pulocationid = loc.locationid
group by zone
having count(*) < 100000;

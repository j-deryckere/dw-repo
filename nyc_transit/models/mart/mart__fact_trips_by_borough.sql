select
borough,
count(*) as trips
from {{ ref('mart__fact_all_taxi_trips') }} as all_trips
join {{ ref('mart__dim_locations') }} as loc on
all_trips.pulocationid = loc.locationid
group by borough

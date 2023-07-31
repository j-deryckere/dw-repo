select
fare_amount,
loc.zone,
loc.borough,
avg(fare_amount) over (order by zone) as avg_zone_fare,
avg(fare_amount) over (order by borough) as avg_borough_fare,
avg(fare_amount) over (partition by 1) as overall_avg_fare
from {{ ref('stg__yellow_tripdata') }} as yellow
join {{ ref('mart__dim_locations') }} as loc
on yellow.pulocationid = loc.locationid
group by fare_amount, loc.zone, loc.borough;

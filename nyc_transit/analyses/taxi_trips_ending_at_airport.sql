select
loc.service_zone,
count(*)
from {{ ref('mart__fact_all_taxi_trips') }}
join {{ ref('mart__dim_locations') }} as loc
on locationid = dolocationid
where service_zone in ('EWR','Airports')
group by all

select
weekday,
count(*) 
from (select
weekday(pickup_datetime) as weekday,
loc1.borough as pu_borough,
loc2.borough as do_borough
from {{ ref('mart__fact_all_taxi_trips') }} as taxi
--first join to get boroughs for pickup location
join {{ ref('mart__dim_locations') }} as loc1 on
loc1.locationid = taxi.pulocationid
--second join to get boroughs for dropoff location
join {{ ref('mart__dim_locations') }} as loc2 on
loc2.locationid = taxi.dolocationid) a
--need counts where pickup and dropoff boroughs are different 
--(not locationid because boroughs can have multiple locationids)
where pu_borough != do_borough
group by all

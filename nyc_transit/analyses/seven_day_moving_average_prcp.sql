select
date,
(lag(prcp, 3, 0) OVER (ORDER BY date) +
lag(prcp, 2, 0) OVER (ORDER BY date) +
lag(prcp, 1, 0) OVER (ORDER BY date) +
prcp +
lead(prcp, 1, 0) OVER (ORDER BY date) +
lead(prcp, 2, 0) OVER (ORDER BY date) +
lead(prcp, 3, 0) OVER (ORDER BY date)) / 7 as avg_prcp
from {{ ref('stg__central_park_weather') }}
group by date, prcp;

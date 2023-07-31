select *
from events
qualify row_number()
over (partition by event_id
order by event_timestamp desc) = 1;

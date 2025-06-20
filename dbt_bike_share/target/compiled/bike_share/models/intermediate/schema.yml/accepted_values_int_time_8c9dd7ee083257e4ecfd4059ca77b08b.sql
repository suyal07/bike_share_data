
    
    

with all_values as (

    select
        time_of_day as value_field,
        count(*) as n_records

    from "bike_share"."main"."int_time"
    group by time_of_day

)

select *
from all_values
where value_field not in (
    'Morning','Afternoon','Evening','Night'
)



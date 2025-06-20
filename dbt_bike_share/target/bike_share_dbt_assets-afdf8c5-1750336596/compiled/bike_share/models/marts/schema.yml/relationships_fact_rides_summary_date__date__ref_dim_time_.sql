
    
    

with child as (
    select date as from_field
    from "bike_share"."main"."fact_rides_summary"
    where date is not null
),

parent as (
    select date as to_field
    from "bike_share"."main"."dim_time"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



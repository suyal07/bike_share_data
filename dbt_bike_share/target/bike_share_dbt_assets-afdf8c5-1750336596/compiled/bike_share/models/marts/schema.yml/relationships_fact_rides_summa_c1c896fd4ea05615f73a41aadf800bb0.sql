
    
    

with child as (
    select user_key as from_field
    from "bike_share"."main"."fact_rides_summary"
    where user_key is not null
),

parent as (
    select user_key as to_field
    from "bike_share"."main"."dim_users"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



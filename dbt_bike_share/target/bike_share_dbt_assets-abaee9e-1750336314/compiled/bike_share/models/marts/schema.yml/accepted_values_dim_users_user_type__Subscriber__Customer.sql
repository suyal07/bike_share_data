
    
    

with all_values as (

    select
        user_type as value_field,
        count(*) as n_records

    from "bike_share"."main"."dim_users"
    group by user_type

)

select *
from all_values
where value_field not in (
    'Subscriber','Customer'
)



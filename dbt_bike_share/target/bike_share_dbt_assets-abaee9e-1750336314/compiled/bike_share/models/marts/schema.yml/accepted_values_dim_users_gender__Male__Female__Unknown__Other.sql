
    
    

with all_values as (

    select
        gender as value_field,
        count(*) as n_records

    from "bike_share"."main"."dim_users"
    group by gender

)

select *
from all_values
where value_field not in (
    'Male','Female','Unknown','Other'
)



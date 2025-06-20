
    
    

with all_values as (

    select
        age_group as value_field,
        count(*) as n_records

    from "bike_share"."main"."dim_users"
    group by age_group

)

select *
from all_values
where value_field not in (
    'Under 18','18-24','25-34','35-44','45-54','55-64','65+','Unknown'
)



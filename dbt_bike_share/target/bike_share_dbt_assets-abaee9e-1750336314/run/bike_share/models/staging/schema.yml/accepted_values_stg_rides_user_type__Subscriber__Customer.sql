select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        user_type as value_field,
        count(*) as n_records

    from "bike_share"."main"."stg_rides"
    group by user_type

)

select *
from all_values
where value_field not in (
    'Subscriber','Customer'
)



      
    ) dbt_internal_test
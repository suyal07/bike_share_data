select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select time_key
from "bike_share"."main"."dim_time"
where time_key is null



      
    ) dbt_internal_test
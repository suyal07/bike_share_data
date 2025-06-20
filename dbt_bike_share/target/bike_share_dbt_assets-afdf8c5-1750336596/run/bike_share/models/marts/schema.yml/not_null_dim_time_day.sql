select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select day
from "bike_share"."main"."dim_time"
where day is null



      
    ) dbt_internal_test
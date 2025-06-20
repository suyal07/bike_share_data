select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select day_of_week
from "bike_share"."main"."int_time"
where day_of_week is null



      
    ) dbt_internal_test
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select time_of_day
from "bike_share"."main"."int_time"
where time_of_day is null



      
    ) dbt_internal_test
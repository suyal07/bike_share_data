select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select month
from "bike_share"."main"."int_time"
where month is null



      
    ) dbt_internal_test
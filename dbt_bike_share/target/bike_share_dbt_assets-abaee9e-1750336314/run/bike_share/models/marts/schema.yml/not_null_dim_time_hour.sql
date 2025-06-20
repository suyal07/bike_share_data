select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select hour
from "bike_share"."main"."dim_time"
where hour is null



      
    ) dbt_internal_test
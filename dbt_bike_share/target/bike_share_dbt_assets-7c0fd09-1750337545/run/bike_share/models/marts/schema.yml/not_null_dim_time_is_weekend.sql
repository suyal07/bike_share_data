select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select is_weekend
from "bike_share"."main"."dim_time"
where is_weekend is null



      
    ) dbt_internal_test
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select latitude
from "bike_share"."main"."stg_stations"
where latitude is null



      
    ) dbt_internal_test
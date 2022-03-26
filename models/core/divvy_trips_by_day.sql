{{ config(materialized='table') }}


SELECT count(*) as trip_count
,start_day as day
FROM {{ ref('stg_divvy_trips')}}
GROUP BY start_day
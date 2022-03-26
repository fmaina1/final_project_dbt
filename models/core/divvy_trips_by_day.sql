{{ config(materialized='table') }}


SELECT count(*) as TripCount
,start_day as Day
FROM {{ ref('stg_divvy_trips')}}
GROUP BY start_day
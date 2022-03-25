{{ config(materialized='view') }}

SELECT ride_id
,rideable_type
,member_casual
,started_at
,ended_at
,start_station_name
,end_station_name
{{ dbt_utils.haversine_distance(start_lat, start_lon, end_lat, end_lon) }} as HaversineDist
FROM {{ source('staging','external_divvy_data')}}
WHERE start_station_name is not null
and end_station_name is not null
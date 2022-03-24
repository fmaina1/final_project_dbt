{{ config(materialized='view') }}

SELECT ride_id
,rideable_type
,started_at
,ended_at
,start_station_name
,end_station_name
,{{ get_day_of_week(started_at) }} as start_day
,{{ get_day_of_week(ended_at) }} as end_day
FROM {{ source('staging','external_divvy_data')}}
WHERE start_station_name is not null
and end_station_name is not null
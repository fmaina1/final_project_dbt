{{ config(materialized='view') }}

SELECT ride_id
,rideable_type
,member_casual
,started_at
,ended_at
,start_station_name
,end_station_name
,{{ test(start_lat) }}
,{{ dbt_utils.bigquery__haversine_distance(lat1=start_lat, lon1=start_lng, lat2=end_lat, lon2=end_lng, unit='mi') }} as HaversineDist
FROM {{ source('staging','external_divvy_data')}}
WHERE start_station_name is not null
and end_station_name is not null
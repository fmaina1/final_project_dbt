{{ config(materialized='view') }}

SELECT *
FROM {{ source('staging','divvy_rides_all')}}
{{ config(materialized='view') }}

SELECT *
FROM {{ source('staging','external_divvy_data')}}
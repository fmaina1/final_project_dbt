{% macro get_day_of_week(date_time) -%}

    FORMAT_DATE('%A', DATE(date_time))

{%- endmacro %}
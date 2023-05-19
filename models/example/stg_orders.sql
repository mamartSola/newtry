{{ config(materialized='view') }}
select * from public._airbyte_raw_night
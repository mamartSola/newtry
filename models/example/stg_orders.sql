{{ config(materialized='table') }}
select * from "postgres".public._airbyte_raw_testing_straight_local_pull
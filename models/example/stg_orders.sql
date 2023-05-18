{{ config(materialized='table') }}
select 

    _airbyte_emitted_at,
    cast(jsonb_extract_path_text("_airbyte_data",'this') as varchar) as "key"

from "postgres".public._airbyte_raw_testing_straight_local_pull
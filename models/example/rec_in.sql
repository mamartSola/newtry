{{ config(materialized='view') }}

select -- what we pick out from the normalization
    
    cast(json_extract_path_text("_airbyte_data"::json,'id') as varchar) as "identification",
    cast(json_extract_path_text("_airbyte_data"::json,'col1') as varchar) as "column"

from public._airbyte_raw_pullusers -- whats created automatcally, with normalization
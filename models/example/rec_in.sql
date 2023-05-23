{{ config(materialized='view') }}

select -- what we pick out from the normalization
    _airbyte_emitted_at,
    cast(json_extract_path_text("_airbyte_data"::json,'id') as varchar) as "identification",
    cast(json_extract_path_text("_airbyte_data"::json,'col1') as varchar) as "column"

from public.record -- whats created automatcally, with normalization
{{ config(materialized='view') }}

with datablob as (

    select -- pick out the nested json object from our blob

        cast(json_extract_path_text("_airbyte_data"::json,'_airbyte_data') as varchar) as "thisobj"

    from public._airbyte_raw_recondata -- created automatcally, no normalization
),

pluck as(

    select -- extract key:value pairs from nested json object - reconstitute initial data present in "public.users"

        cast(json_extract_path_text("thisobj"::json,'id') as varchar) as "our init id",
        cast(json_extract_path_text("thisobj"::json,'col1') as varchar) as "our init column"

    from datablob
)

select * from pluck
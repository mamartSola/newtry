{{ config(materialized='view') }}


with basics as (

    select -- what we pick out from the normalization

        cast(json_extract_path_text("_airbyte_data"::json,'_airbyte_ab_id') as varchar) as "uid3",
        cast(json_extract_path_text("_airbyte_data"::json,'_airbyte_data') as varchar) as "thisobj"

    from public._airbyte_raw_pullusers -- whats created automatcally, with normalization
),

pluck as(

    select

        uid3,
        cast(json_extract_path_text("thisobj"::json,'id') as varchar) as "objid",
        cast(json_extract_path_text("thisobj"::json,'col1') as varchar) as "column"

    from basics
)

select * from pluck
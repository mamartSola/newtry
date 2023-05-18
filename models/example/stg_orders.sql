create table "postgres"."public"."users"
as (
    select
        _airbyte_emitted_at,
        (current_timestamp at time zone 'utc')::timestamp as _airbyte_normalized_at,

        cast(jsonb_extract_path_text("_airbyte_data",'this') as varchar) as "key",
        cast(jsonb_extract_path_text("_airbyte_data",' is') as varchar) as "date1",
        cast(jsonb_extract_path_text("_airbyte_data",' a') as varchar) as "date2"

    from "postgres".public._airbyte_raw_users
);

select * from 

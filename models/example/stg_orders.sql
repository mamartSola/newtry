create table "postgres".public."night"

  as (

    with a_night_walk as (

        select 

            _airbyte_emitted_at,
            cast(jsonb_extract_path_text("_airbyte_data",'ni') as varchar) as "key"

        from "postgres".public._airbyte_raw_night
        
    )

select

    _airbyte_emitted_at,
    "key"

from a_nightly walk );
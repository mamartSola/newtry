create  table "postgres".public."night__dbt_tmp"
  as (

with __dbt__cte__night_ab1 as (

-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: "postgres".public._airbyte_raw_night
select
    jsonb_extract_path_text(_airbyte_data, 'gh') as gh,
    jsonb_extract_path_text(_airbyte_data, 'ty') as ty,
    jsonb_extract_path_text(_airbyte_data, 'ni') as ni,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at
from "postgres".public._airbyte_raw_night as table_alias
-- night
where 1 = 1
),  __dbt__cte__night_ab2 as (

-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: __dbt__cte__night_ab1
select
    cast(gh as text) as gh,
    cast(ty as text) as ty,
    cast(ni as
    float
) as ni,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at
from __dbt__cte__night_ab1
-- night
where 1 = 1
),  __dbt__cte__night_ab3 as (

-- SQL model to build a hash column based on the values of this record
-- depends_on: __dbt__cte__night_ab2
select
    md5(cast(coalesce(cast(gh as text), '') || '-' || coalesce(cast(ty as text), '') || '-' || coalesce(cast(ni as text), '') as text)) as _airbyte_night_hashid,
    tmp.*
from __dbt__cte__night_ab2 tmp
-- night
where 1 = 1
)-- Final base SQL model
-- depends_on: __dbt__cte__night_ab3
select
    gh,
    ty,
    ni,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    now() as _airbyte_normalized_at,
    _airbyte_night_hashid
from __dbt__cte__night_ab3
-- night from "postgres".public._airbyte_raw_night
where 1 = 1
  );
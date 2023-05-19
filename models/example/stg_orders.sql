{{ config(materialized='view') }}

select
    gh as order_id,
    ty as customer_id,

from airbyte.night
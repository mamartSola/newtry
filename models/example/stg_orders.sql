{{ config(materialized='view') }}

select -- what we pick out from the normalization
    gh as order_id,
    ty as customer_id

from public.night -- whats created automatcally, with normalization
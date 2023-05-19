with source as (

    select * from public._airbyte_raw_cafe

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source

)

select * from renamed
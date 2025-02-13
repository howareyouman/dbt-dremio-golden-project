with

source as (

    select * from {{ source('jaffle_shop', 'supplies') }}

),

renamed as (

    select

        ----------  ids
        md5(cast(coalesce(cast(id as VARCHAR), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(sku as VARCHAR), '_dbt_utils_surrogate_key_null_') as VARCHAR)) as supply_uuid,
        id as supply_id,
        sku as product_id,

        ---------- text
        name as supply_name,

        ---------- numerics
        (cost / 100.0) as supply_cost,

        ---------- booleans
        perishable as is_perishable_supply

    from source

)

select * from renamed

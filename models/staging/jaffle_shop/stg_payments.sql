SELECT
    id as payment_id,
    order_id,
    payment_method,
    parse_numeric(amount) as amount
FROM {{ source("jaffle_shop", "payments")}}
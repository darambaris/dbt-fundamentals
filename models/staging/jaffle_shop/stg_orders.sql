select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from `dbt-integration-424021.jaffle_shop.orders`
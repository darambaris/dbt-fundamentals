with orders as  (
    select * from {{ ref ('stg_orders' )}}
),
payments as (
    select * from {{ ref ('stg_payments') }}
),
order_payments as (
    select
        order_id,
        sum(parse_numeric(amount)) as amount
    from payments
    group by 1
),
final as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        coalesce(op.amount, 0) as amount
    from orders o
    left join order_payments op 
    using (order_id)
)
select * from final
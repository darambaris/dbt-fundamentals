select
    customer_id
from {{ ref('stg_customers') }}
where not REGEXP_CONTAINS(last_name, '[A-Z]{1}\\.') 
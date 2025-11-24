WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

daily AS (
    SELECT
        order_date,
        COUNT(*) AS order_number
    FROM orders
    GROUP BY 1
),

compared AS (
    SELECT 
        *,
        LAG(order_number) OVER (ORDER BY order_date) AS previous_day_order
    FROM daily
)

SELECT * FROM compared
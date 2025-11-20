SELECT
    id AS payment,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    amount / 100 AS amount,
    created AS created_at
FROM raw.stripe.payment
select * from user_events;

WITH funnel_stages AS (
    SELECT 
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase
        
    FROM user_events
)

SELECT * FROM funnel_stages;


WITH funnel_stages AS (
    SELECT 
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase
        
    FROM user_events
)

select
	stage_1_views,
    stage_2_cart,
    round(stage_2_cart * 100 / stage_1_views) as view_to_cart_rate,
    
    stage_3_checkout,
    round(stage_3_checkout * 100 / stage_2_cart) as cart_to_checkout_rate,
    
    stage_4_payment,
    round(stage_4_payment * 100 / stage_3_checkout) as checkout_to_payment_rate,
    
    stage_5_purchase,
    round(stage_5_purchase * 100 / stage_4_payment) as payment_to_purchase_rate,
    
    round(stage_5_purchase * 100 / stage_1_views) as overall_conversion_rate

from funnel_stages;



WITH source_funnel AS (
    SELECT
        traffic_source,
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS carts,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases
    FROM user_events
    GROUP BY traffic_source
    order by purchases desc
)

SELECT 
	traffic_source,
    views,
    carts,
    purchases,
    round(carts * 100 / views) as cart_conversion_rate,
    round(purchases * 100 / views) as purchases_conversion_rate,
    round(purchases * 100 / carts) as cart_to_purchases_conversion_rate

 FROM source_funnel;
 
 
 WITH user_journey AS (
    SELECT
        user_id,
        min(CASE WHEN event_type = 'page_view' THEN event_date END) AS view_time,
        min(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_time,
        min(CASE WHEN event_type = 'purchase' THEN event_date END) AS purchase_time
    FROM user_events
    GROUP BY user_id
    having min(CASE WHEN event_type = 'purchase' THEN event_date END) is not null
)

select
	count(*) as converted_users,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, view_time, cart_time)), 2) AS avg_view_to_cart_minutes,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, cart_time, purchase_time)), 2) AS avg_cart_to_purchase_minutes,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, view_time, purchase_time)), 2) AS avg_total_journey_minutes
    
 from user_journey;
 
 

 
  WITH funnel_revenue AS (
    SELECT
        count(distinct case WHEN event_type = 'page_view' THEN user_id END) AS total_visitors,
        count(distinct case WHEN event_type = 'purchase' THEN user_id END) AS total_buyers,
        sum(case WHEN event_type = 'purchase' THEN amount END) AS total_revenue,
        count(case WHEN event_type = 'purchase' THEN 1 END) AS total_orders
        
    FROM user_events
)

select
	total_visitors,
    total_buyers,
    total_orders,
    total_revenue,
    total_revenue / total_orders as avg_order_value,
    total_revenue / total_buyers as revenue_per_buyer,
    total_revenue / total_visitors as revenue_per_visitor

from funnel_revenue;
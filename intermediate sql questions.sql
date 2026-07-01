--customer success team wants to run a campaign to save accounts that are at risk of churning, but they only care about high-value users.

Write a query that displays every unique user_id from the orders table along with two calculated metrics
WITH monthly_active_users AS (
    -- Step 1: Calculate unique active users per month
    SELECT 
        DATE_TRUNC('month', order_date)::DATE AS business_month,
        COUNT(DISTINCT user_id) AS active_user_count
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
),

monthly_trends AS (
    -- Step 2: Grab the previous month's user count using LAG
    SELECT 
        business_month,
        active_user_count,
        LAG(active_user_count, 1) OVER (ORDER BY business_month) AS previous_month_active_users
    FROM monthly_active_users
)

-- Step 3: Compute final MoM metrics
SELECT 
    business_month,
    active_user_count,
    COALESCE(previous_month_active_users, 0) AS previous_month_users,
    
    -- Absolute Change
    (active_user_count - COALESCE(previous_month_active_users, 0)) AS absolute_user_change,
    
    -- Percentage Growth Rate Math
    CASE 
        WHEN previous_month_active_users IS NULL THEN 0.00 -- Avoid dividing by NULL for month 1
        ELSE ROUND(
            ((active_user_count - previous_month_active_users)::NUMERIC / previous_month_active_users) * 100, 
            2
        )
    END AS mom_growth_percentage

FROM monthly_trends
ORDER BY business_month;
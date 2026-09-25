-- Step 1: Calculate Customer Level Transaction Metrics
WITH Customer_Aggregates AS (
    SELECT 
        customer_id,
        MAX(transaction_date) AS last_purchase_date,
        COUNT(order_id) AS total_orders,
        SUM(order_amount) AS total_monetary_val
    FROM ecom_orders
    GROUP BY customer_id
),

-- Step 2: Compute RFM Scores using Window Functions
RFM_Scores AS (
    SELECT 
        customer_id,
        DATEDIFF(day, last_purchase_date, CURRENT_DATE) AS recency_days,
        total_orders AS frequency,
        total_monetary_val AS monetary,
        NTILE(5) OVER (ORDER BY DATEDIFF(day, last_purchase_date, CURRENT_DATE) DESC) AS r_score,
        NTILE(5) OVER (ORDER BY total_orders ASC) AS f_score,
        NTILE(5) OVER (ORDER BY total_monetary_val ASC) AS m_score
    FROM Customer_Aggregates
)

-- Step 3: Categorize Churn Risk Tiers for Business Targeting
SELECT 
    customer_id,
    recency_days,
    frequency,
    monetary,
    (r_score + f_score + m_score) AS total_rfm_score,
    CASE 
        WHEN (r_score + f_score + m_score) <= 5 THEN 'High Churn Risk'
        WHEN (r_score + f_score + m_score) BETWEEN 6 AND 10 THEN 'At Risk'
        ELSE 'Loyal Customer'
    END AS churn_risk_segment
FROM RFM_Scores;

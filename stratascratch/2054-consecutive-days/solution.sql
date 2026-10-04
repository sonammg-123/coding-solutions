WITH consecutive_days AS (
    SELECT
        user_id,
        record_date,
        LAG(record_date, 1) OVER (
            PARTITION BY user_id
            ORDER BY record_date
        ) AS prev_day,
        LEAD(record_date, 1) OVER (
            PARTITION BY user_id
            ORDER BY record_date
        ) AS next_day
    FROM sf_events
)

SELECT DISTINCT user_id
FROM consecutive_days
WHERE
    DATEDIFF(record_date, prev_day) = 1
    AND DATEDIFF(next_day, record_date) = 1;

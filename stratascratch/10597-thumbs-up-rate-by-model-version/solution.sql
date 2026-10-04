WITH case1 AS (
    SELECT DISTINCT
        response_id,
        model_version,
        feedback
    FROM ai_response_feedback
    WHERE feedback IN ('thumbs_up', 'thumbs_down')
)

SELECT
    model_version,
    100.0 * AVG(CASE
        WHEN feedback = 'thumbs_up'
        THEN 1 ELSE 0
    END) AS thumbs_up_act
FROM case1
GROUP BY model_version;

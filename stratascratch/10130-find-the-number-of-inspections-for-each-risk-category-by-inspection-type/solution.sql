WITH inspection_risk AS (
    SELECT
        inspection_id,
        inspection_type,
        CASE
            WHEN MAX(CASE
                WHEN risk_category = 'High Risk' THEN 3
                WHEN risk_category = 'Moderate Risk' THEN 2
                WHEN risk_category = 'Low Risk' THEN 1
                ELSE 0
            END) = 3 THEN 'High Risk'
            WHEN MAX(CASE
                WHEN risk_category = 'High Risk' THEN 3
                WHEN risk_category = 'Moderate Risk' THEN 2
                WHEN risk_category = 'Low Risk' THEN 1
                ELSE 0
            END) = 2 THEN 'Moderate Risk'
            WHEN MAX(CASE
                WHEN risk_category = 'High Risk' THEN 3
                WHEN risk_category = 'Moderate Risk' THEN 2
                WHEN risk_category = 'Low Risk' THEN 1
                ELSE 0
            END) = 1 THEN 'Low Risk'
        END AS worst_risk_category
    FROM sf_restaurant_health_violations
    GROUP BY inspection_id, inspection_type
)

SELECT
    inspection_type,
    SUM(CASE
        WHEN worst_risk_category IS NULL
        THEN 1 ELSE 0
    END) AS no_risk_results,
    SUM(CASE
        WHEN worst_risk_category = 'Low Risk'
        THEN 1 ELSE 0
    END) AS low_risk_results,
    SUM(CASE
        WHEN worst_risk_category = 'Moderate Risk'
        THEN 1 ELSE 0
    END) AS medium_risk_results,
    SUM(CASE
        WHEN worst_risk_category = 'High Risk'
        THEN 1 ELSE 0
    END) AS high_risk_results,
    COUNT(*) AS total_inspections
FROM inspection_risk
GROUP BY inspection_type
ORDER BY total_inspections DESC;

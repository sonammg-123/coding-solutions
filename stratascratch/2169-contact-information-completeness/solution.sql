SELECT
    COUNT(CASE WHEN phone_number IS NULL THEN 1 END) * 1.0
    / COUNT(*) AS null_phone_ratio
FROM techcorp_workforce;

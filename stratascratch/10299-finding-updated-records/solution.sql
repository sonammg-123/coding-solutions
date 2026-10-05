SELECT
    id,
    first_name,
    last_name,
    department_id,
    salary
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC, department_id DESC) AS rn
    FROM ms_employee_salary
) AS s
WHERE rn = 1
ORDER BY id ASC;

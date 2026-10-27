SELECT b.worker_title AS best_paid_title
FROM worker AS a
INNER JOIN title AS b ON a.worker_id = b.worker_ref_id
WHERE
    a.salary = (
        SELECT MAX(salary) FROM worker AS w
        INNER JOIN title AS t ON w.worker_id = t.worker_ref_id
        WHERE t.worker_title IS NOT NULL
    )
ORDER BY best_paid_title;

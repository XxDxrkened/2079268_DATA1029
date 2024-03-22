-- Énoncé: Utiliser la base de données library_08_03_24.sql ci-jointe et donnez la requête qui renvoie les résultats suivants :

USE library_08_03_24;

-- Question 1 - Noms complets des employés de plus haut grade par employeurs (10pts)
SELECT e.fname AS first_name, e.lname AS last_name, e.job_lvl, p.pub_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE (e.pub_id, e.job_lvl) IN (
    SELECT e2.pub_id, MAX(e2.job_lvl)
    FROM employees e2
    WHERE e2.pub_id = e.pub_id
    GROUP BY e2.pub_id
);

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

-- Question 2 - Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo (10 pts)
SELECT e.fname AS first_name, e.lname AS last_name, e.salary
FROM employees e
WHERE e.salary > (
	SELECT e.salary
    FROM employees e
    WHERE e.fname = 'Norbert' AND e.lname = 'Zongo'
);

-- Question 3 - Noms complets des employés des éditeurs canadiens. (10 pts)
SELECT e.fname AS first_name, e.lname AS last_name, p.pub_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE p.country = 'Canada';

-- Question 4 - Noms complets des employés qui ont un manager. (10pts)
SELECT e.fname AS first_name, e.lname AS last_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.max_lvl = 'MANAGER';

-- Question 5 - Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur. (10 pts)
SELECT e.fname AS first_name, e.lname AS last_name, e.salary, p.pub_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE e.salary > (
	SELECT AVG(salary) FROM employees WHERE pub_id = e.pub_id
);

-- Question 6 - Noms complets des employés qui ont le salaire minimum de leur grade (10 pts)
SELECT e.fname AS first_name, e.lname AS last_name, e.salary
FROM employees e
WHERE (e.job_id, e.salary) IN (
    SELECT job_id, MIN(salary)
    FROM employees
    GROUP BY job_id
);





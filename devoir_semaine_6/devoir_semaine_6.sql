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

-- Question 7 - De quels types sont les livres les plus vendus? (10 pts)
SELECT t.type, COUNT(s.title_id) AS total_sales
FROM sales s
JOIN titles t ON s.title_id = t.title_id
GROUP BY t.type
ORDER BY total_sales DESC
-- Si vous voulez seulement le résulat finale et non la pleine liste
LIMIT 1;

-- Question 8 - Pour chaque boutique, les 2 livres les plus vendus et leurs prix. (10 pts)
-- pas pus la resoudre

-- Question 9 - Les auteurs des 5 livres les plus vendus. (10 pts)
SELECT a.au_fname AS au_first_name, a.au_lname AS au_last_name
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SUM(s.qty) DESC
LIMIT 5;

-- Question 10 - Prix moyens des livres par maisons d’édition. (10 pts) 
SELECT p.pub_name AS publisher_name, AVG(t.price) AS average_price
FROM publishers p
LEFT JOIN titles t ON p.pub_id = t.pub_id
GROUP BY p.pub_name;

-- Question 11 - Les 3 auteurs ayant les plus de livres
SELECT au_fname, au_lname, COUNT(*) AS book_count
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY book_count DESC
LIMIT 3;
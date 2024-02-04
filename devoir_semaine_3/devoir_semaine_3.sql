USE library;

-- Question 1 : La liste des paires (auteur, éditeur) demeurant dans la même ville. (10pts)
SELECT authors.au_fname AS prenom, authors.au_lname AS nom, publishers.pub_name AS publisher, authors.city
FROM authors
JOIN publishers ON authors.city = publishers.city
AND authors.au_id <> publishers.pub_id;

-- Question 2 : La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère. (10pts)
SELECT authors.au_fname AS prenom, authors.au_lname AS nom, publishers.pub_name AS publisher, authors.city
FROM authors
LEFT JOIN publishers ON authors.city = publishers.city;

-- Question 3 : La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les éditeurs qui ne répondent pas à ce critère. (10pts)
SELECT authors.au_fname AS prenom, authors.au_lname AS nom, publishers.pub_name AS publisher, authors.city
FROM authors
RIGHT JOIN publishers ON authors.city = publishers.city;

-- Question 4 : La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les auteurs et éditeurs qui ne répondent pas à ce critère. (10pts)
SELECT authors.au_fname AS prenom, authors.au_lname AS nom, publishers.pub_name AS publisher, authors.city
FROM authors
CROSS JOIN publishers
ON authors.city = publishers.city OR authors.city IS NULL OR publishers.city IS NULL;

-- Question 5 : Effectif(nombre) d'employes par niveau d'experience (15pts)
SELECT job_lvl AS niveau_experience, COUNT(job_lvl) AS nombre_par_niveau
FROM employees
GROUP BY job_lvl;
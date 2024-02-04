-- Question 1 : La liste des paires (auteur, éditeur) demeurant dans la même ville. (10pts)
SELECT authors.au_fname AS prenom, authors.au_lname AS nom, publishers.pub_name AS publisher, authors.city
FROM authors
JOIN publishers ON authors.city = publishers.city
AND authors.au_id <> publishers.pub_id;

-- Question 2 : La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère. (10pts)
SELECT authors.au_fname AS prenom, authors.au_lname AS nom, publishers.pub_name AS publisher, authors.city
FROM authors
LEFT JOIN publishers ON authors.city = publishers.city
AND authors.au_id <> publishers.pub_id;
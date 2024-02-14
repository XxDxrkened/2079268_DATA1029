USE library;

-- Question 1: Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre
SELECT DISTINCT a.au_id, a.au_fname, a.au_lname
FROM authors AS a
WHERE a.au_id NOT IN (
SELECT DISTINCT title_au.au_id
FROM titleauthor AS title_au
INNER JOIN titles t ON title_au.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
WHERE p.pub_name = 'Harmattan');

-- Question 2: Obtenir la liste des auteurs dont l’éditeur «Eyrolles » a publié tous les livres
SELECT DISTINCT a.au_id, a.au_fname, a.au_lname
FROM authors AS a
WHERE NOT EXISTS (
SELECT t.title_id
FROM titles AS t
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
LEFT JOIN titleauthor AS title_au ON t.title_id = title_au.title_id AND title_au.au_id = a.au_id
WHERE p.pub_name = 'Eyrolles'
AND title_au.title_id IS NULL
);

-- Question 3: Obtenir la liste des noms d’auteurs ayant touché une avance supérieure à toutes les avances versées par l'éditeur "Harmattan"
SELECT a.au_fname, a.au_lname
FROM authors AS a
WHERE a.au_id IN (
SELECT ta.au_id
FROM titleauthor AS ta
JOIN titles as t ON ta.title_id = t.title_id
WHERE t.advance > ALL (
SELECT t.advance
FROM titles AS t
JOIN publishers AS p ON t.pub_id = p.pub_id
WHERE p.pub_name = 'Harmattan'
)
);
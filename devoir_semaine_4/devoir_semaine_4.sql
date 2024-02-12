USE library;

-- Question 1: Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre
SELECT a.au_id, a.au_fname, a.au_lname
FROM authors AS a
WHERE a.au_id NOT IN (
SELECT DISTINCT tauth.au_id
FROM titleauthor AS tauth
INNER JOIN titles t ON tauth.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
WHERE p.pub_name = 'Harmattan');

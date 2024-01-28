use library;
-- Exercice 1: À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » Afficher le titre et le prix de chaque livre. (10pts)
SELECT title, price FROM titles WHERE title LIKE '%computer%' GROUP BY title_id;
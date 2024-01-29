use library;
-- Exercice 1: À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » Afficher le titre et le prix de chaque livre. (10pts)
SELECT title, price FROM titles WHERE title LIKE '%computer%' GROUP BY title_id;

-- Exercice 2: À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » (au singulier). Afficher le titre et le prix de chaque livre. (15 pts)
SELECT title, price FROM titles WHERE (title LIKE '%computer%' AND title NOT LIKE '%computers%') GROUP BY title_id;

-- Exercice 3: À partir de la table « titles », obtenir la liste des titres dont l’identifiant débute par SU ou BU. Afficher le titre et le prix de chaque livre. (15 pts)
SELECT title, price FROM titles WHERE (title LIKE 'SU%' OR title LIKE 'BU%') GROUP BY title_id;

-- Exercice 4: À partir de la table « titles », obtenir la liste des titres dont l’identifiant ne débute pas par SU ou BU. Afficher le titre et le prix de chaque livre. (15 pts)
SELECT title, price FROM titles WHERE NOT (title LIKE 'SU%' OR title LIKE 'BU%') GROUP BY title_id;
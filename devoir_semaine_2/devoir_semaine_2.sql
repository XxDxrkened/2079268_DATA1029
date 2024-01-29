use library;
-- Exercice 1: À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » Afficher le titre et le prix de chaque livre. (10pts)
SELECT title, price FROM titles WHERE title LIKE '%computer%' GROUP BY title_id;

-- Exercice 2: À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » (au singulier). Afficher le titre et le prix de chaque livre. (15 pts)
SELECT title, price FROM titles WHERE (title LIKE '%computer%' AND title NOT LIKE '%computers%') GROUP BY title_id;

-- Exercice 3: À partir de la table « titles », obtenir la liste des titres dont l’identifiant débute par SU ou BU. Afficher le titre et le prix de chaque livre. (15 pts)
SELECT title, price FROM titles WHERE (title LIKE 'SU%' OR title LIKE 'BU%') GROUP BY title_id;

-- Exercice 4: À partir de la table « titles », obtenir la liste des titres dont l’identifiant ne débute pas par SU ou BU. Afficher le titre et le prix de chaque livre. (15 pts)
SELECT title, price FROM titles WHERE NOT (title LIKE 'SU%' OR title LIKE 'BU%') GROUP BY title_id;

-- Exercice 5: À partir de la table « titles », obtenir la liste des titres ne débutant ni par S, ni par B, mais dont la seconde lettre est « o ». Afficher le titre et le prix. (15 pts)
SELECT title, price FROM titles WHERE (title LIKE '_o%') AND (title NOT LIKE 'S%' OR title NOT LIKE 'B%')  GROUP BY title_id;

-- Ecercice 6: À partir de la table « titles », obtenir la liste des titres ne débutant ni par S, ni par B, mais dont la 3ème lettre est « f ». Afficher le titre et le prix. (15 pts)
SELECT title, price FROM titles WHERE (title LIKE '__f%') AND (title NOT LIKE 'S%' OR title NOT LIKE 'B%')  GROUP BY title_id;

-- Exercice 7: À partir de la table « titles », obtenir la liste des titres débutant par l’une des 10 premières lettres de l’alphabet. Afficher le titre et le prix. (15 pts)
SELECT title, price FROM titles WHERE title RLIKE '^[A-J]' GROUP BY title_id;
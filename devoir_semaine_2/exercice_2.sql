USE library;
-- Exercice 2: À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » (au singulier). Afficher le titre et le prix de chaque livre. (15 pts)
SELECT title, price FROM titles WHERE title LIKE ('%computer%') AND title NOT LiKE ('%computers%');
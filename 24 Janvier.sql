SELECT year(pubdate) FROM titles GROUP BY year(pubdate);

SELECT type, count(*) FROM titles GROUP BY type;

SELECT type, count(DISTINCT pub_id) FROM titles GROUP BY type;

SELECT type, COUNT(DISTINCT pub_id) AS "Nombre d’éditeurs" FROM titles GROUP BY type;

SELECT country, COUNT(*) FROM publishers WHERE country like "%r%" GROUP BY country HAVING COUNT(*);

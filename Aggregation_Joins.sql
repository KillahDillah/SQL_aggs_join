USE movies;

SELECT 
    m.movieid, m.title, r.rating
FROM
    movies m
        LEFT JOIN
    ratings r ON m.movieid = r.movieid
WHERE
    m.movieid = 1;

    
SELECT 
    m.movieid, m.title, AVG (r.rating)
FROM
    movies m
        JOIN
    ratings r ON m.movieid= r.movieid
GROUP BY m.movieid;

SELECT  m.movieid, m.title, SUM(r.rating)
FROM movies m
JOIN ratings r on m.movieid=r.movieid
GROUP BY m.movieid;

SELECT g.genres, g.id, COUNT(m.movieid)
FROM genre g
JOIN movie_genre mg ON g.id = mg.genre_id
JOIN movies m ON mg.movieid = m.movieid
GROUP BY g.id;

SELECT r.userid, COUNT(r.id) AS Count
FROM ratings r
GROUP BY r.userid
ORDER BY Count DESC
LIMIT 1;
 
SELECT r.userid, AVG(r.rating) AS AverageRating
FROM ratings r
GROUP BY r.userid
ORDER BY AverageRating DESC
LIMIT 1;

SELECT r.userid, AVG(r.rating) AS AverageRating, COUNT(r.id) AS count
FROM ratings r
GROUP BY r.userid
HAVING count >= 50
ORDER BY AverageRating DESC
LIMIT 1;


SELECT m.movieid, m.title, AVG (r.rating)
FROM movies m
JOIN ratings r ON m.movieid = r.movieid
WHERE r.rating >= 4
GROUP BY m.movieid;

SELECT g.genres, AVG(r.rating) AS AverageRating, COUNT(r.id) AS count
FROM movies m
JOIN  ratings r ON m.movieid = r.movieid
JOIN movie_genre mg ON m.movieid = mg.movieid
JOIN genre g ON mg.genre_id = g.id
WHERE m.movieid<100
GROUP BY g.id
ORDER BY AverageRating DESC;

    

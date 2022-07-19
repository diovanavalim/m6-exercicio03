USE movies_db;

-- Adicione um filme à tabela de filmes.
INSERT INTO movies VALUES(null, now(), null, "Matrix", 8.7, 32, "1999-05-21 00:00:00", 136, 5);

-- Adicione um gênero à tabela de gêneros.
INSERT INTO genres VALUES(null, now(), null, "Luta", 13, 1);

-- Associe o filme inserido no item  1. com o gênero criado item 2.
UPDATE movies SET genre_id = 13 WHERE id = 22;

-- Modifique a tabela de atores para que pelo menos um ator tenha o filme adicionado item 1 como favorito.
UPDATE actors SET favorite_movie_id = 22 WHERE id = 47;

-- Crie uma tabela temporária da tabela filmes.
CREATE TEMPORARY TABLE movies_tmp SELECT * from movies;

-- Elimine da tabela temporária do item 5 todos os filmes que ganharam menos de 5 prêmios.
DELETE from movies_tmp WHERE awards < 5;

-- Obtenha a lista de todos os gêneros que possuem pelo menos um filme.
SELECT DISTINCT
    name
FROM
    genres AS genre
        JOIN
    movies AS movie ON genre.id = movie.genre_id;
    
-- Obtenha a lista de atores cujo filme favorito ganhou mais de três prêmios.alter
SELECT 
    first_name, last_name, favorite_movie_id, title, movie.rating as movie_rating, awards
FROM
    actors AS actor
        JOIN
    movies AS movie ON actor.favorite_movie_id = movie.id
        AND movie.awards > 3;
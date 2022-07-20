-- Configurando o banco de dados a ser utilizado
use movies_db;

-- Mostrar o título e o nome do gênero de todas as séries.
SELECT 
    title, name
FROM
    series AS serie
        JOIN
    genres AS genre ON serie.genre_id = genre.id;

-- Mostrar o título dos episódios, o nome e sobrenome dos atores que trabalham em cada um deles.
SELECT 
    title, first_name, last_name
FROM
    episodes AS ep
        JOIN
    actor_episode AS ac_ep ON ep.id = ac_ep.episode_id
        JOIN
    actors AS ac ON ac_ep.actor_id = ac.id;
    
-- Mostrar o título de todas as séries e o número total de temporadas que cada uma delas possui.
SELECT sr.title, count(ss.id) FROM series as sr JOIN seasons ss ON ss.serie_id = sr.id GROUP BY sr.id;

-- Mostrar o nome de todos os gêneros e o número total de filmes de cada um, desde que seja maior ou igual a 3.
SELECT name, count(mv.id) as total_filmes FROM genres as gr JOIN movies as mv ON mv.genre_id = gr.id GROUP BY gr.id HAVING total_filmes >= 3;

-- Mostrar apenas o nome e sobrenome dos atores que atuam em todos os filmes de Star Wars e que estes não se repitam.
SELECT DISTINCT
    first_name, last_name
FROM
    actor_movie
        JOIN
    actors ON actor_movie.actor_id = actors.id
        JOIN
    movies ON movies.title LIKE '%La Guerra de las galaxias%'
WHERE
    actor_movie.movie_id = movies.id;
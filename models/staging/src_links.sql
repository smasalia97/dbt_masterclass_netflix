WITH raw_links AS (
    SELECT * FROM MOVIELENS.RAW.RAW_LINKS
)

SELECT 
    movieId movie_id,
    imdbId imdb_id,
    tmdbId tmdb_id
FROM raw_links
WITH raw_movies AS (
    SELECT * FROM {{ source('netflix', 'r_movies') }} 
)

SELECT 
    movieId movie_id,
    title,
    genre
FROM raw_movies
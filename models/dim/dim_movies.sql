WITH src_movies AS (
    SELECT * 
    FROM {{ ref('src_movies') }}
    )

SELECT 
    movie_id,
    INITCAP(TRIM(title)) movie_title,
    SPLIT(TRIM(genre), '|') AS genre_array,
    genre
FROM src_movies
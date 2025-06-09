WITH raw_genome_scores AS (
    SELECT * FROM MOVIELENS.RAW.RAW_GENOME_SCORES
)

SELECT 
    movieId movie_id,
    tagId tag_id,
    relevance
FROM raw_genome_scores
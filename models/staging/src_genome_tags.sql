WITH raw_genome_tags AS (
    SELECT * FROM MOVIELENS.RAW.RAW_GENOME_TAGS
)

SELECT 
    tagId tag_id,
    tag
FROM raw_genome_tags
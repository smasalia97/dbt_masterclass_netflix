USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;

CREATE STAGE netflixstage
URL = 's3://bucketname'
CREDENTIALS = (AWS_KEY_ID='' AWS_SECRET_KEY='')


-- Load raw_movies
CREATE OR REPLACE TABLE raw_movies (
    movieId INTEGER,
    title STRING,
    genre STRING    
);

COPY INTO RAW_MOVIES 
FROM '@netflixstage/movies.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

SELECT * FROM RAW_MOVIES;

-- Load raw_ratings
CREATE OR REPLACE TABLE raw_ratings (
    userId INTEGER,
    movieId INTEGER,
    rating FLOAT,
    timestamp BIGINT    
);

COPY INTO RAW_RATINGS 
FROM '@netflixstage/ratings.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

SELECT * FROM RAW_RATINGS;

-- Load raw_tags
CREATE OR REPLACE TABLE raw_tags (
    userId INTEGER,
    movieId INTEGER,
    tag STRING,
    timestamp BIGINT    
);

COPY INTO RAW_TAGS 
FROM '@netflixstage/tags.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR='CONTINUE';

SELECT * FROM RAW_TAGS;

-- Load raw_genome_scores
CREATE OR REPLACE TABLE raw_genome_scores (
    movieId INTEGER,
    tagId INTEGER,
    relevance FLOAT    
);

COPY INTO RAW_GENOME_SCORES 
FROM '@netflixstage/genome-scores.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR='CONTINUE';

SELECT * FROM RAW_GENOME_SCORES;

-- Load raw_genome_tags
CREATE OR REPLACE TABLE raw_genome_tags (
    tagId INTEGER,
    tag STRING    
);

COPY INTO RAW_GENOME_TAGS 
FROM '@netflixstage/genome-tags.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR='CONTINUE';

SELECT * FROM RAW_GENOME_TAGS;

-- Load raw_links
CREATE OR REPLACE TABLE raw_links (
    movieId INTEGER,
    imdbId INTEGER,
    tmdbId INTEGER
);

COPY INTO RAW_LINKS 
FROM '@netflixstage/links.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR='CONTINUE';

SELECT * FROM RAW_LINKS;

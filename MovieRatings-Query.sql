--Create table SQL 
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) 
);

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) 
);

CREATE TABLE ratings (
    user_id INTEGER REFERENCES users(user_id),
    movie_id INTEGER REFERENCES movies(movie_id),
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    PRIMARY KEY (user_id, movie_id)
);


-- Insert record or data into users, movies & ratings table 

INSERT INTO users (name)
VALUES
    ('Rudolf Schenker'),
    ('John Poli'),
    ('Robert Burnham'),
    ('Tracy Harrington'),
    ('Nancy Accorsi');

INSERT INTO movies (title)
VALUES
    ('Jason Bourne'),
    ('Pirates of the Caribbean'),
    ('Patriot'),
    ('Italian Job'),
    ('Robinhood & Sherwood Jungle'),
    ('Godzilla');

INSERT INTO ratings (user_id, movie_id, rating)
VALUES
    (1, 1, 4),
    (1, 2, 2),
    (1, 3, 3),
    (1, 4, 5),
    (1, 5, 4),
    (1, 6, 1),

    (2, 1, 4),
    (2, 2, 4),
    (2, 4, 4),
    (2, 5, 2),

    (3, 1, 1),
    (3, 2, 5),
    (3, 3, 2),
    (3, 5, 4),
    (3, 6, 4),

    (4, 1, 5),
    (4, 3, 5),
    (4, 4, 5),
    (4, 5, 4),
    (4, 6, 5),

    (5, 1, 3),
    (5, 2, 3),
    (5, 3, 2),
    (5, 4, 2),
    (5, 5, 3),
    (5, 6, 5);

-- checking ratings query accross multiple tables
SELECT
    users.name,
    movies.title,
    ratings.rating
FROM ratings
JOIN users
    ON ratings.user_id = users.user_id
JOIN movies
    ON ratings.movie_id = movies.movie_id;

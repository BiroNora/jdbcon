CREATE TABLE directors (
        actor_id INTEGER,
        movie_id INTEGER,
        CONSTRAINT fk_directors_movie_id
                    FOREIGN KEY (movie_id)
                    REFERENCES movies (movie_id)
                    ON DELETE SET NULL,
        CONSTRAINT fk_directors_actor_id
                    FOREIGN KEY (actor_id)
                    REFERENCES actors (actor_id)
                    ON DELETE SET NULL
    );

CREATE TABLE genre (
        movie_id INTEGER,
        genre TEXT
    );
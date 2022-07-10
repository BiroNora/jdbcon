CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    death_date DATE DEFAULT NULL
);
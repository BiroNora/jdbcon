package com.norab.actor;

import com.norab.movie.Movie;
import com.norab.movie.MovieRowMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class ActorDataAccessRepository implements ActorDao<Actor> {
    private static final Logger log = LoggerFactory.getLogger(ActorDataAccessRepository.class);
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public ActorDataAccessRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Movie> allMoviesByActor(Integer id) {
        var sql = """
            SELECT movie_id, title, release_date, picture
            FROM movie
            JOIN
            (SELECT movie_id
            FROM plays
            WHERE actor_id = ?) AS p
            USING (movie_id)
            LIMIT 10;
            """;
        return jdbcTemplate.query(sql, new MovieRowMapper(), id);
    }

    @Override
    public List<Actor> selectActors() {
        var sql = """
            SELECT actor_id, full_name, birth_date
            FROM actor
            LIMIT 10;
            """;
        return jdbcTemplate.query(sql, new ActorRowMapper());
    }

    @Override
    public int insertActor(Actor actor) {
        var sql = """
            INSERT INTO actor(full_name, birth_date) VALUES(?, ?);                        
            """;
        int insert = jdbcTemplate.update(sql, actor.fullName(), actor.birthDate());
        if (insert == 1) {
            log.info("New actor inserted: " + actor);
        }
        return insert;
    }

    @Override
    public int deleteActor(int id) {
        var sql = """
            DELETE FROM actor
            WHERE actor_id = ?;
            """;
        int delete = jdbcTemplate.update(sql, id);
        if (delete == 1) {
            log.info(String.format("Actor with id: %d is deleted.", id));
        }
        return delete;
    }

    @Override
    public Optional<Actor> selectActorById(int id) {
        var sql = """
            SELECT actor_id, full_name, birth_date
            FROM actor
            WHERE actor_id = ?;
            """;
        Optional<Actor> selected = jdbcTemplate.query(sql, new ActorRowMapper(), id)
            .stream()
            .findFirst();
        if (selected.isPresent()) {
            log.info(String.format("Actor with id: %d is selected.", id));
        }
        return selected;
    }

    @Override
    public int updateActor(int id, Actor actor) {
        var sql = """
            UPDATE actor
            SET full_name = ?, birth_date = ?
            WHERE actor_id = ?;
            """;
        int update = jdbcTemplate.update(sql, actor.fullName(), actor.birthDate(), actor.id());
        if (update == 1) {
            log.info(String.format("Actor with id: %d is updated.", id));
        }
        return update;
    }
}

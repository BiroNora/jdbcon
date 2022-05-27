package com.norab.actor;

import com.norab.movie.Movie;

import java.util.List;
import java.util.Optional;

public interface ActorDao {
    List<Actor> selectActor();
    int insertActor(Actor actor);
    int deleteActor(int id);
    Optional<Actor> selectActorById(int id);
    int updateActor(int id, Actor actor);
}

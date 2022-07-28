package com.norab.director;

import com.norab.crossed.SearchLocation;
import com.norab.exception.InvalidInputException;
import com.norab.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DirectorService {
    private final DirectorDao directorDao;

    public DirectorService(DirectorDao directorDao) {
        this.directorDao = directorDao;
    }

    public List<ResultResponse> listDirectors() {
        return directorDao.listDirectors();
    }

    public List<DirectorDao.Directors> listDirectorsAndMovies() {
        return directorDao.listDirectorsAndMovies();
    }

    public boolean insertDirector(Director director) {
        return directorDao.insertDirector(director);
    }

    public void deleteDirector(Integer actorId, Integer movieId) {
        if (actorId == null || actorId < 1 || movieId == null || movieId < 1) {
            throw new InvalidInputException("Invalid id");
        }
        boolean result = directorDao.deleteDirector(actorId, movieId);
        if (!result) {
            throw new IllegalStateException("oops could not delete director");
        }
    }

    public boolean getDirector(Integer actorId, Integer movieId) {
        return directorDao.selectDirectorById(actorId, movieId);
    }

    public List<DirectorDao.MoviesByDirector> selectMoviesByDirector(String name) {
        return directorDao.selectMoviesByDirector(name);
    }

    public List<ResultResponse> selectDirectorsByMovieTitle(String title, SearchLocation location) {
        return directorDao.selectDirectorsByMovieTitle(title, location);
    }
}

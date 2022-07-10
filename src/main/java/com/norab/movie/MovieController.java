package com.norab.movie;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/movies")
public class MovieController {
    private final MovieService movieService;

    public MovieController(MovieService movieService) {
        this.movieService = movieService;
    }

    @GetMapping
    public List<Movie> listMovies() {
        return movieService.getMovies();
    }

    @GetMapping("{id}")
    public Movie getMovieId(@PathVariable("id") Integer movieId) {
        return movieService.getMovie(movieId);
    }

    @PostMapping
    public MovieId addMovie(@RequestBody Movie movie) {
        return new MovieId(movieService.insertMovie(movie));
    }

    @DeleteMapping("{id}")
    public void deleteMovie(@PathVariable("id") Integer id) {
        movieService.deleteMovie(id);
    }

    @PutMapping("{id}")
    public void updateMovie(@PathVariable("id") Integer id, @RequestBody Movie movie) {
        movieService.updateMovie(id, movie);
    }
}

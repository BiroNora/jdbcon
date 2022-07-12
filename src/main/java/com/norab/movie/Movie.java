package com.norab.movie;

import org.springframework.data.annotation.Id;

import java.time.LocalDate;

public class Movie {
    @Id
    private Integer movieId;
    private String title;
    private String titleOriginal;
    private Short releaseDate;
    private boolean isMovieFilm;

    public Movie() {
    }

    public Movie(String title, String titleOriginal, Short releaseDate, boolean isMovieFilm) {
        this.title = title;
        this.titleOriginal = titleOriginal;
        this.releaseDate = releaseDate;
        this.isMovieFilm = isMovieFilm;
    }

    public Movie(Integer movieId, String title, String titleOriginal, Short releaseDate, boolean isMovieFilm) {
        this.movieId = movieId;
        this.title = title;
        this.titleOriginal = titleOriginal;
        this.releaseDate = releaseDate;
        this.isMovieFilm = isMovieFilm;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleOriginal() {
        return titleOriginal;
    }

    public void setTitleOriginal(String titleOriginal) {
        this.titleOriginal = titleOriginal;
    }

    public Short getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Short releaseDate) {
        this.releaseDate = releaseDate;
    }

    public boolean isMovieFilm() {
        return isMovieFilm;
    }

    public void setMovieFilm(boolean movieFilm) {
        isMovieFilm = movieFilm;
    }

    @Override
    public String toString() {
        return "Movie{" +
            "movieId=" + movieId +
            ", title='" + title + '\'' +
            ", titleOriginal='" + titleOriginal + '\'' +
            ", releaseDate=" + releaseDate +
            ", isMovieFilm=" + isMovieFilm +
            '}';
    }
}

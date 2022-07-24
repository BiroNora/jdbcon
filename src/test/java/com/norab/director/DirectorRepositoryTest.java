package com.norab.director;

import com.norab.exception.InvalidInputException;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;

import static com.norab.crossed.SearchLocation.*;
import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@ActiveProfiles("test")
@SpringBootTest
class DirectorRepositoryTest {
    @Autowired
    private DirectorRepository repository;

    @Test
    @Order(1)
    void selectDirectors() {
        List<Director> directors = repository.selectDirectors();
        for (Director d : directors) {
            System.out.println(d);
        }
        assertTrue(directors.size() > 0);
    }

    @Test
    @Order(2)
    void insertDirector() {
        Director dir1 = new Director(2, 5);
        boolean result = repository.insertDirector(dir1);
        assertTrue(result);

        Director dir2 = new Director(2, 4);
        result = repository.insertDirector(dir2);
        assertTrue(result);
    }

    @Test
    @Order(3)
    void insertDuplicateDirector() {
        Director dir = new Director(22, 3);
        boolean result = repository.insertDirector(dir);
        assertTrue(result);

        assertThrows(InvalidInputException.class, () -> repository.insertDirector(dir));
    }

    @Test
    @Order(4)
    void deleteDirector() {
        Director dir = new Director(12, 3);
        boolean result = repository.insertDirector(dir);
        assertTrue(result);
        boolean b = repository.deleteDirector(12, 3);
        assertTrue(b);
    }

    @Test
    @Order(5)
    void selectDirectorById() {
        boolean exists = repository.selectDirectorById(7, 5);
        assertTrue(exists);
    }

    @Test
    @Order(6)
    void selectMoviesByDirector() {
        List<DirectorDao.MoviesByDirector> moviesByDirectors
            = repository.selectMoviesByDirector("Giuseppe");
        for (DirectorDao.MoviesByDirector m : moviesByDirectors) {
            System.out.println(m);
        }
        assertTrue(moviesByDirectors.size() > 0);
    }

    @Test
    @Order(7)
    void selectDirectorsByMovieTitle() {
        List<String> directors = repository.selectDirectorsByMovieTitle("%oss%", TITLE);
        assertTrue(directors.size() > 0);
    }

    @Test
    @Order(8)
    void selectDirectorsByMovieOriginalTitle() {
        List<String> directors = repository.selectDirectorsByMovieTitle("%ood%", ORIGTITLE);
        assertTrue(directors.size() > 0);
    }

    @Test
    @Order(9)
    void selectDirectorsByMovieOriginalTitleAndTitle() {
        List<String> directors = repository.selectDirectorsByMovieTitle("%ki%", ALL);
        assertTrue(directors.size() > 0);

        List<String> directors1 = repository.selectDirectorsByMovieTitle("%off%", ALL);
        assertTrue(directors1.size() > 0);
    }

}

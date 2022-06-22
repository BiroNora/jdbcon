package com.norab.photo;

import com.norab.exception.InvalidInputException;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@ActiveProfiles("test")
@SpringBootTest
class PhotoRepositoryTest {
    @Autowired
    private PhotoRepository repository;

    @Test
    @Order(1)
    void selectPhotos() {
        List<Photo> photos = repository.selectPhotos();
        for (Photo p : photos) {
            System.out.print(p.getId() + ". ");
            System.out.println(p.getPhotoUrl());
        }
        assertEquals(photos.size(), 3);
        assertEquals(photos.get(2).getActorId(), 0);
    }

    @Test
    @Order(2)
    void insertPhoto() {
        Photo photo = new Photo("https://ZZZzzzzz", 1L, null, null);

        long id = repository.insertPhoto(photo);
        Optional<Photo> photo1 = repository.selectPhotoById(id);
        assertTrue(photo1.isPresent());
        assertEquals(photo1.get().getMovieId(), 1);
        assertEquals(photo1.get().getPhotoUrl(), "https://ZZZzzzzz");
        assertEquals(photo1.get().getId(), 4);
    }

    @Test
    @Order(3)
    void deletePhoto() {
        Long id = 2L;
        int result = repository.deletePhoto(id);
        assertEquals(1, result);

        Long id1 = 2224L;
        int result1 = repository.deletePhoto(id1);
        assertEquals(0, result1);
    }

    @Test
    @Order(4)
    void selectPhotoByValidId() {
        Long id = 3L;
        Optional<Photo> selected = repository.selectPhotoById(id);
        assertEquals(selected.orElseThrow().getPhotoUrl(), "https://dumbo");
    }

    @Test
    @Order(5)
    void selectPhotoByInvalidId() {
        Long id = 278901L;
        Optional<Photo> selected = repository.selectPhotoById(id);
        assertTrue(selected.isEmpty());
    }

    @Test
    @Order(6)
    void updatePhoto() {
        Photo pho = repository.selectPhotoById(3L).orElseThrow();
        System.out.println(pho);
        pho.setPhotoUrl("http://pinocchio");
        pho.setMovieId(1L);
        pho.setActorId(1L);
        pho.setRoleId(null);
        System.out.println(pho);
        int result = repository.updatePhoto(3L, pho);
        assertEquals(1, result);
        assertNotEquals(pho.getRoleId(), 0);
    }

    @Test
    @Order(7)
    void updatePhotoByInvalidIds() {
        Photo pho = repository.selectPhotoById(3L).orElseThrow();
        System.out.println(pho);
        pho.setMovieId(11L);
        pho.setActorId(1L);
        pho.setRoleId(2L);
        assertEquals(pho.getRoleId(), 2L);

        System.out.println(pho);
        assertThrows(InvalidInputException.class, () ->
            repository.updatePhoto(3L, pho));

        Photo pho1 = repository.selectPhotoById(3L).orElseThrow();
        System.out.println(pho1);
        pho1.setMovieId(1L);
        pho1.setActorId(11L);
        pho1.setRoleId(2L);
        System.out.println(pho1);
        assertThrows(InvalidInputException.class, () -> {
            repository.updatePhoto(3L, pho1);
        });

        Photo pho2 = repository.selectPhotoById(3L).orElseThrow();
        System.out.println(pho2);
        pho2.setMovieId(1L);
        pho2.setActorId(1L);
        pho2.setRoleId(22L);
        System.out.println(pho2);
        assertThrows(InvalidInputException.class, () -> {
            repository.updatePhoto(3L, pho2);
        });

        Photo pho3 = new Photo("https://pinokkio", 1L, 1L, 1L);
        int result = repository.updatePhoto(22022L, pho3);
        assertEquals(0, result);
    }

    @Test
    @Order(8)
    void doubleInsertPhoto() {
        String url = "https://CCC";
        Photo photoOrig = new Photo(url, 1L, null, null);

        long id = repository.insertPhoto(photoOrig);
        repository.deletePhoto(id);
        long id1 = repository.insertPhoto(photoOrig);

        Optional<Photo> photo = repository.selectPhotoById(id);
        assertTrue(photo.isEmpty());

        Optional<Photo> photo1 = repository.selectPhotoById(id1);
        assertTrue(photo1.isPresent());
        assertEquals(photo1.get().getMovieId(), 1);
        assertEquals(photo1.get().getPhotoUrl(), url);

        List<Photo> photos = repository.selectPhotos();
        long count = photos.stream()
            .filter(x -> x.getPhotoUrl().equals(url))
            .count();
        assertEquals(1, count);
    }
}
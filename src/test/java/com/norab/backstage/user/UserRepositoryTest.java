package com.norab.backstage.user;

import com.norab.utils.Page;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.MethodName.class)
@ActiveProfiles("test")
@SpringBootTest
class UserRepositoryTest {
    @Autowired
    private UserRepository repository;

    @Test
    void listUsers() {
        Page page = new Page(1, 10);
        List<User> users = repository.listUsers(page);
        for (User a : users) {
            System.out.println(a.getUserId() + " ");
            System.out.println(a.getFullName());
        }
        assertTrue(users.size() > 0);
    }

    @Test
    void selectUserById() {
        User user = new User("Gipsz Jakab", "gjaki@gmail.com", "passzW%", "555-222", Set.of(), true, true, true, true);
        String userId = repository.insertUser(user);
        Optional<User> selected = repository.selectUserById(UUID.fromString(userId));
        assertTrue(selected.isPresent());
        assertEquals("Gipsz Jakab", selected.get().getFullName());

        UUID id = UUID.fromString("f1b9ac74-099b-4a21-9a0a-b14f14acddf0");
        Optional<User> user1 = repository.selectUserById(id);
        assertTrue(user1.isEmpty());
    }

    @Test
    void selectUserByName() {
        User user = new User("SpiderMan", "speedy@gmail.com", "passz123%", "5557-222", Set.of(), true, true, true, true);
        repository.insertUser(user);
        List<User> users = repository.selectUserByName(user.getFullName(), true);
        assertTrue(users.size() > 0);

        List<User> users1 = repository.selectUserByName("00", true);
        assertTrue(users1.isEmpty());
    }

    @Test
    void updateUser() {
        UUID id = UUID.fromString("fbfea6e6-2e5e-4f7d-908b-6cef802b6270");
        User user = repository.selectUserById(id).orElseThrow();
        user.setFullName("Gábor Zsazsa");
        int result = repository.updateUser(id, user);
        assertEquals(1, result);

        User user1 = new User("ZZTop", "zzt@gmail.com", "123", "5557-222", Set.of(), true, true, true, true);
        UUID id1 = UUID.fromString("ea6e6-2e5e-4f7d-908b-6cef802b6270");
        int result1 = repository.updateUser(id1, user1);
        assertEquals(0, result1);
    }

    @Test
    void insertUser() {
        User user = new User("Sugar Baby", "sbaby@gmail.com", "123%", "5557-222", Set.of(), true, true, true, true);
        String result = repository.insertUser(user);
        Optional<User> user1 = repository.selectUserById(UUID.fromString(result));
        assertTrue(user1.isPresent());
    }

    @Test
    void deleteUser() {
        User user = new User("Man At Work", "maw@gmail.com", "1234", "5557-222", Set.of(), true, true, true, true);
        String result = repository.insertUser(user);
        Optional<User> user1 = repository.selectUserById(UUID.fromString(result));
        assertTrue(user1.isPresent());

        int expected = repository.deleteUser(UUID.fromString(result));
        assertEquals(1, expected);
    }
}
package com.norab.backstage.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.norab.utils.ToJsonString;
import org.springframework.data.annotation.Id;

import java.util.UUID;

public class User extends ToJsonString {
    @Id
    @JsonIgnore
    private UUID userId;
    private String userName;
    private String email;
    private String password;

    public User() {
    }

    public User(String fullName, String email, String password) {
        this.userName = fullName;
        this.email = email;
        this.password = password;
    }

    public User(UUID userId, String fullName, String email, String password) {
        this.userId = userId;
        this.userName = fullName;
        this.email = email;
        this.password = password;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
            "userId=" + userId +
            ", userName='" + userName + '\'' +
            ", email='" + email + '\'' +
            ", password='" + password + '\'' +
            '}';
    }
}
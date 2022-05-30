package com.norab.role_photo;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RolePhotoRowMapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        return new RolePhoto(
            resultSet.getString("url"),
            resultSet.getInt("role_id")
        );
    }
}
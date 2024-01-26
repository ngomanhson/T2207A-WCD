package com.dao;

import com.entities.Student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO implements DAOInterface<Student> {

    @Override
    public List<Student> get() {
        String sql = "SELECT * FROM students";
        ArrayList<Student> list = new ArrayList<>();
        try {
            Database db = Database.getInstance();
            ResultSet rs = db.getStatement().executeQuery(sql);
            while (rs.next()) {
                list.add(new Student(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("address")
                ));
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public boolean create(Student student) {
        String sql = "INSERT INTO students (name, email, address) VALUES (?, ?, ?)";

        try {
            Database db = Database.getInstance();
            PreparedStatement preparedStatement = db.getPreparedStatement(sql);
            preparedStatement.setString(1, student.name);
            preparedStatement.setString(2, student.email);
            preparedStatement.setString(3, student.address);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    @Override
    public boolean update(Student student) {
        return false;
    }

    @Override
    public boolean delete(Student student) {
        return false;
    }

    @Override
    public <K> Student find(K id) {
        return null;
    }
}

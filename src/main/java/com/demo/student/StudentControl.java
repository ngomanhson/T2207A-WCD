package com.demo.student;

import com.dao.StudentDAO;
import com.entities.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = {"/student", "/student-create"})
public class StudentControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();

        if ("/student".equals(action)) {
            StudentDAO sd = new StudentDAO();
            List<Student> list = sd.get();
            req.setAttribute("students", list);
            RequestDispatcher dispatcher = req.getRequestDispatcher("student/list.jsp");
            dispatcher.forward(req, resp);
        } else if ("/student-create".equals(action)) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("student/create.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        Student newStudent = new Student(0, name, email, address);
        StudentDAO studentDAO = new StudentDAO();

        if (studentDAO.create(newStudent)) {
            resp.sendRedirect(req.getContextPath() + "/student");
        } else {
            resp.getWriter().println("Failed to create student");
        }
    }

}

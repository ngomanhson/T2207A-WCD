package wcd.jpa.controllers;

import org.hibernate.Session;
import wcd.jpa.entities.Classes;
import wcd.jpa.entities.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/create-student")
public class StudentCreateController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try {
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Exception e) {
            System.out.printf(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            List<Classes> classes = session.createQuery("FROM Classes", Classes.class)
                    .getResultList();
            session.getTransaction().commit();
            req.setAttribute("classes", classes);
        }
        req.getRequestDispatcher("student/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = new Student();
        student.setName(req.getParameter("name"));
        student.setEmail(req.getParameter("email"));
        student.setAddress(req.getParameter("address"));
        String classId = req.getParameter("class_id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Classes cl = session.get(Classes.class, Integer.parseInt(classId));
            if (cl == null) {
                return;
            }
            student.setClasses(cl);
            session.save(student);
            session.getTransaction().commit();
        }
        resp.sendRedirect("list-student");
    }
}

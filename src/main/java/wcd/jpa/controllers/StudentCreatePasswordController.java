package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.mindrot.jbcrypt.BCrypt;
import wcd.jpa.entities.Student;

import java.io.IOException;

@WebServlet(value = "/create-password")
public class StudentCreatePasswordController extends HttpServlet {
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
        req.getRequestDispatcher("/auth/create-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");


        try (Session session = sessionFactory.openSession()){
            session.beginTransaction();

            Student s = session.get(Student.class, Integer.parseInt(entityId));
            if (s != null) {
                String rawPassword = req.getParameter("password");
                String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt());

                s.setPassword(hashedPassword);
                session.update(s);
            }

            session.getTransaction().commit();
            resp.sendRedirect("list-student");
        } catch (Exception e) {
            resp.setStatus(500);
        }
    }

}

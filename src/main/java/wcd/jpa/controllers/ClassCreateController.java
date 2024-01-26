package wcd.jpa.controllers;

import org.hibernate.Session;
import wcd.jpa.entities.Class;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

@WebServlet(value = "/create-class")
public class ClassCreateController extends HttpServlet {
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
        req.getRequestDispatcher("class/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Class cl = new Class();
        cl.setName(req.getParameter("name"));
        cl.setSemester(req.getParameter("semester"));
        cl.setRoom(req.getParameter("room"));
        try (Session session = sessionFactory.openSession()){
            session.beginTransaction();
            session.save(cl);
            session.getTransaction().commit();
        }
        resp.sendRedirect("list-class");
    }
}

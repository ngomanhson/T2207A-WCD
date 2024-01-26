package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Class;
import wcd.jpa.entities.Student;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/list-class")
public class ClassController extends HttpServlet {
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
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            List<Class> list = session.createQuery("FROM Class", Class.class).getResultList();
            session.getTransaction().commit();
            req.setAttribute("class", list);
        }
        req.getRequestDispatcher("class/list.jsp").forward(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()){
            session.beginTransaction();
            Class cl = session.get(Class.class, Integer.parseInt(entityId));

            if (cl != null) {
                session.delete(cl);
            }
            session.getTransaction().commit();
            resp.setStatus(200);
        } catch (Exception e) {
            resp.setStatus(403);
        }
    }
}

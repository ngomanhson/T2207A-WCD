package wcd.jpa.controllers;

import com.example.t2207a_wcd.HelloServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Class;

import java.io.IOException;

@WebServlet(value = "/edit-class")
public class ClassEditController extends HelloServlet {
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
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String entityId = req.getParameter("id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Class cl = session.get(Class.class,Integer.parseInt(entityId));
            session.getTransaction().commit();
            if(cl != null) {
                req.setAttribute("class", cl);
                req.getRequestDispatcher("class/edit.jsp").forward(req, resp);
            }else
                resp.setStatus(404);
        }catch (Exception e){
            resp.setStatus(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Class cl = session.get(Class.class,Integer.parseInt(entityId));
            if(cl != null) {
                cl.setName(req.getParameter("name"));
                cl.setSemester(req.getParameter("semester"));
                cl.setRoom(req.getParameter("room"));
                // update to DB
                session.update(cl);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-class");
        }catch (Exception e){
            resp.setStatus(500);
        }
    }

}

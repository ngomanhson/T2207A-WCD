package wcd.jpa.controllers;

import com.example.t2207a_wcd.HelloServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Student;

import java.io.IOException;

@WebServlet(value = "/edit-student")
public class StudentEditController extends HelloServlet {
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
        try (Session session = sessionFactory.openSession()){
            session.beginTransaction();
            Student student = session.get(Student.class, Integer.parseInt(entityId));
            session.getTransaction().commit();

            if (student != null) {
                req.setAttribute("student", student);
                req.getRequestDispatcher("/student/edit.jsp").forward(req,  resp);
            } else
                resp.setStatus(404);
        } catch (Exception e) {
            resp.setStatus(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Student student = session.get(Student.class,Integer.parseInt(entityId));
            if(student != null) {
                student.setName(req.getParameter("name"));
                student.setEmail(req.getParameter("email"));
                student.setAddress(req.getParameter("address"));
                // update to DB
                session.update(student);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-student");
        }catch (Exception e){
            resp.setStatus(500);
        }
    }

}

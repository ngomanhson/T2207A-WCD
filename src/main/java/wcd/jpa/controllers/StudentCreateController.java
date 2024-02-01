package wcd.jpa.controllers;

import org.hibernate.Query;
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
import wcd.jpa.entities.Subjects;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;


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
        List<Classes> classesList = new ArrayList<>();
        List<Subjects> subjectsList = new ArrayList<>();
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            classesList = session.createQuery("FROM Classes", Classes.class).getResultList();
            subjectsList = session.createQuery("FROM Subjects", Subjects.class).getResultList();
            session.getTransaction().commit();
            req.setAttribute("classes", classesList);
            req.setAttribute("subjects", subjectsList);
        }
        req.getRequestDispatcher("student/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = new Student();
        student.setName(req.getParameter("name"));
        student.setEmail(req.getParameter("email"));
        student.setAddress(req.getParameter("address"));

        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            // Find Classes
            int classID = Integer.parseInt(req.getParameter("class_id"));
            Classes c = session.find(Classes.class,classID);
            student.setClasses(c);
            // Find subjects
            List<Integer> s_ids = Arrays.stream(req.getParameterValues("subject_id[]"))
                    .map(Integer::parseInt).collect(Collectors.toList());
            Query<Subjects> query = session.createQuery("FROM Subjects WHERE id IN (:ids)", Subjects.class);
            query.setParameter("ids", s_ids);
            List<Subjects> subjects = query.getResultList();
            student.setSubjects(subjects);

            session.save(student);
            session.getTransaction().commit();

            // Send email to student
            String senderEmail = "sonnmth2205010@fpt.edu.vn";
            String passwordEmail = "tpaw uayu arfn gecz";

            // Config connect
            Properties prop = new Properties();
            prop.put("mail.smtp.auth","true");
            prop.put("mail.smtp.ssl.protocols","TLSv1.2");
            prop.put("mail.smtp.ssl.trust","smtp.gmail.com");
            prop.put("mail.smtp.starttls.enable","true");
            prop.put("mail.smtp.host","smtp.gmail.com");
            prop.put("mail.smtp.port","587");

            javax.mail.Session mailSession = javax.mail.Session.getInstance(prop,
                    new Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(senderEmail, passwordEmail);
                        }
                    }
            );

            try {
                Message message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(senderEmail));
                message.setRecipient(Message.RecipientType.TO,
                        new InternetAddress("ngomanhson2004txpt@gmail.com"));
                message.setSubject("Create new a student!");
                message.setText("<h1>This is a test email</h1>");

                // Send mail
                Transport.send(message);
            }catch (Exception e) {
                System.out.print(e.getMessage());
            }
        }
        resp.sendRedirect("list-student");
    }
}

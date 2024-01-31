<%@ page import="wcd.jpa.entities.Classes" %>
<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Subjects" %><%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 22/01/2024
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Student</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<jsp:include page="/layout/header.jsp"/>

<section class="mt-5 pt-4">
    <div class="container">
        <h1 class="text-danger text-center mb-4">Create Student</h1>

        <div class="row">
            <div class="col-4 mx-auto">
                <form action="create-student" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" id="name">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" id="email">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" name="address" class="form-control" id="address">
                    </div>

                    <div class="mb-3">
                        <label for="class_id" class="form-label">Class</label>
                        <select name="class_id" id="class_id" class="form-select mb-3" aria-label=".form-select">
                            <option selected>Select class</option>
                            <% for (Classes c : (List<Classes>) request.getAttribute("classes")) { %>
                            <option value="<%= c.getId() %>"><%= c.getName() %></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="class_id" class="form-label">Subjects</label>
                        <% for (Subjects s : (List<Subjects>) request.getAttribute("subjects")) { %>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input name="subject_id[]" class="form-check-input" type="checkbox" value="<%= s.getId()%>">
                                    <%= s.getName()%>
                                </label>
                            </div>
                        <% } %>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Create Student</button>
                </form>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/layout/js.jsp"/>
</body>
</html>

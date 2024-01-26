<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Student" %><%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 22/01/2024
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Student</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<jsp:include page="/layout/header.jsp"/>
<section class="mt-5 pt-4">
    <div class="container">
        <h1 class="text-danger">List Student</h1>
        <div class="row">
            <div class="col">
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Student s : (List<Student>) request.getAttribute("students")) { %>
                        <tr>
                            <td><%= s.id %></td>
                            <td><%= s.name %></td>
                            <td><%= s.email %></td>
                            <td><%= s.address %></td>
                        <td>
                            <a href="edit-student?id=<%= s.getId() %>" class="btn btn-primary">
                                <i class="fa-solid fa-pen"></i>
                            </a>
                            <a onclick="deleteStudent(<%= s.getId() %>)" href="javascript:void(0)" class="btn btn-danger">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </td>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/layout/js.jsp"/>
<script type="text/javascript">
   function deleteStudent(id) {
       if (confirm("Are you sure?")){
           var url = `list-student?id=`+id;
           fetch(url, {
               method: 'DELETE'
           }).then(rs=> {
               if (confirm("Delete Successfully. Reload page?"))
                   window.location.reload();
           }).error(err=> {
               alert(err);
           })
       }
   }
</script>
</body>
</html>

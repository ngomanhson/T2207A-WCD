<%@ page import="wcd.jpa.entities.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 31/01/2024
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Favourite Student</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<jsp:include page="/layout/header.jsp"/>
<section class="mt-5 pt-4">
    <div class="container">
        <h1 class="text-danger">List Favourite</h1>
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
                    <% List<Student> likedStudents = (List<Student>) request.getAttribute("likedStudents");
                        if (likedStudents != null) {
                            for (Student s : likedStudents) { %>
                            <tr>
                                <td><%= s.getId() %></td>
                                <td><%= s.getName() %></td>
                                <td><%= s.getEmail() %></td>
                                <td><%= s.getAddress() %></td>
                                <td>
                                    <a onclick="likeStudent(<%= s.getId() %>)" href="javascript:void(0)" class="btn btn-danger">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">
    function likeStudent(id) {
        if (confirm("Are you sure?")){
            var url = `list-student?id=`+id;
            fetch(url, {
                method: 'POST'
            }).then(rs=> {
                if (confirm("Like student successfully. Reload page?"))
                    window.location.reload();
            }).error(err=> {
                alert(err);
            })
        }
    }
</script>
</body>
</html>

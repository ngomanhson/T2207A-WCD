<%@ page import="wcd.jpa.entities.Classes" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 26/01/2024
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Class</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<jsp:include page="/layout/header.jsp"/>
<section class="mt-5 pt-4">
    <div class="container">
        <h1 class="text-danger">List Class</h1>
        <div class="row">
            <div class="col">
                <table class="table table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Semester</th>
                        <th scope="col">Room</th>
                        <th scope="col">Students</th>
                        <th scope="col">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Classes c : (List<Classes>) request.getAttribute("classes")) { %>
                    <tr>
                        <td><%= c.getId() %></td>
                        <td><%= c.getName() %></td>
                        <td><%= c.getSemester() %></td>
                        <td><%= c.getRoom() %></td>
                        <td><%= c.getStudents().size() %></td>
                        <td>
                            <a href="edit-class?id=<%= c.getId() %>" class="btn btn-primary">
                                <i class="fa-solid fa-pen"></i>
                            </a>
                            <a onclick="deleteClass(<%= c.getId() %>)" href="javascript:void(0)" class="btn btn-danger">
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
    function deleteClass(id) {
        if (confirm("Are you sure?")){
            var url = `list-class?id=`+id;
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

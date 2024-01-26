<%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 26/01/2024
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Class</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
    <jsp:include page="/layout/header.jsp"/>

    <section class="mt-5 pt-4">
        <div class="container">
            <h1 class="text-danger text-center mb-4">Create Class</h1>

            <div class="row">
                <div class="col-4 mx-auto">
                    <form action="create-class" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" id="name">
                        </div>
                        <div class="mb-3">
                            <label for="semester" class="form-label">Semester</label>
                            <input type="number" name="semester" class="form-control" id="semester">
                        </div>
                        <div class="mb-3">
                            <label for="room" class="form-label">Room</label>
                            <input type="text" name="room" class="form-control" id="room">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Create Class</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/layout/js.jsp"/>
</body>
</html>

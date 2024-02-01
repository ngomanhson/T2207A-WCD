<%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 01/02/2024
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login page</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<section>
    <div class="container">
        <div class="row">
            <h1 class="text-center text-danger mt-5">Login to account</h1>
            <div class="col-4 mx-auto">
                <form action="" method="post" class="mt-3">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" placeholder="email@example.com">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="******">
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/layout/js.jsp"/>
</body>
</html>

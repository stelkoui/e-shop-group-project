

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello admin!</h1>
                <a href="${pageContext.request.contextPath}/register/showForm">Registration Form</a>
                <a href="${pageContext.request.contextPath}/message/list">Messages</a>
                <a href="#">Store</a>

    </body>
</html>

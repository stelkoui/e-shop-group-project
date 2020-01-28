

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>admin page</h1>
                <a href="${pageContext.request.contextPath}/register/showForm">Registration Form</a>
                <br>
                <a href="${pageContext.request.contextPath}/message/list">Messages</a>
                <br>
                <a href="${pageContext.request.contextPath}/product/list">Products</a>
                

    </body>
</html>

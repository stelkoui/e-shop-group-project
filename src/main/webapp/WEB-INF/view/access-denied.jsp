<%-- 
    Document   : access-denied
    Created on : 16 Δεκ 2019, 3:18:25 μμ
    Author     : koui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access Denied</title>
    </head>
    <body>
        <h1>This Page is forbidden</h1>
        <h3>Spring Security disable your access!!</h3>
        <a href="${pageContext.request.contextPath}/">Home Page</a>
    </body>
</html>

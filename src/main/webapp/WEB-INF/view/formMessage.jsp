<%-- 
    Document   : formMessage
    Created on : 6 Ιαν 2020, 6:21:37 μμ
    Author     : koui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Page</title>
    </head>
    <body>
        <form:form 
            action="${pageContext.request.contextPath}/message/send" 
            method="POST"
            modelAttribute="message">
            <form:hidden path="mid"/>
            Message: <form:textarea path="mtext"/>

            <form:errors path="mtext" cssClass="error"/> 
            <br>
            
            Username: <form:input path="musername"/>
            <form:errors path="musername" cssClass="error"/>
            <br>
            <input type="submit" value="Submit">            
        </form:form>
        <br>
        <a href="${pageContext.request.contextPath}/">Home Page</a>
    </body>
</html>

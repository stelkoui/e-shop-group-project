<%-- 
    Document   : registration-form
    Created on : 18 Δεκ 2019, 12:04:43 μμ
    Author     : koui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <style>
            .error{
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form:form action="${pageContext.request.contextPath}/register/processRegistration" method="POST" modelAttribute="user">
            <p>
                <form:input path="username" placeholder="username"/>
                <form:errors path="username" cssClass="error"/>
            </p>
            <p>
                <form:input path="password" placeholder="password"/>
                <form:errors path="password" cssClass="error"/>
            </p>
            <p>
                <form:input path="fname" placeholder="fname"/>
                <form:errors path="fname" cssClass="error"/>
            </p>
            <p>
                <form:input path="lname" placeholder="lname"/>
                <form:errors path="lname" cssClass="error"/>
            </p>
            <p>
                <form:input path="email" placeholder="email"/>
                <form:errors path="email" cssClass="error"/>
            </p>
           
            
               <security:authorize access="hasRole('ADMIN')">
            <p>
                <form:select path="roles" items="${roloi}" multiple="true" itemValue="rid" itemLabel="rname"/>
                <form:errors path="roles" cssClass="error"/>
            </p>   
                    </security:authorize>

            <input type="submit" value="Register">
            <hr>
            <a href="${pageContext.request.contextPath}/">Home </a>

            
        </form:form>
    </body>
</html>

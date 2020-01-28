

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link href="${path}/static/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${path}/static/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
        <style>
            .error{
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="card" style="max-width:520px; margin:40px auto 0 auto; " >
            <div class="card-body">
                <h3 style="text-align: center;">Sign up</h3>
                <div style=" border: 1px solid grey;  padding: 20px; border-radius: 4px;">
                <form:form action="${pageContext.request.contextPath}/register/processRegistration" method="POST" modelAttribute="user">
                    <div class="form-row">
                        <div class="col form-group">
                            <label>Username</label>
                            <form:input path="username" class="form-control" placeholder="username"/>
                            <form:errors path="username" cssClass="error"/>
                        </div>
                        <div class="col form-group">
                            <label>Password</label>
                            <form:input type="password" class="form-control" path="password" placeholder="password"/>
                            <form:errors path="password" cssClass="error"/>
                        </div>
                    </div> 
                    <div class="form-row">
                        <div class="col form-group">
                            <label>First name</label>
                            <form:input path="fname" class="form-control" placeholder="First name"/>
                            <form:errors path="fname" cssClass="error"/>
                        </div> 
                        <div class="col form-group">
                            <label>Last name</label>
                            <form:input path="lname" class="form-control" placeholder="Last name"/>
                            <form:errors path="lname" cssClass="error"/>
                        </div> 
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <form:input path="email" class="form-control" placeholder="Email"/>
                        <form:errors path="email" cssClass="error"/>
                    </div>

                    <security:authorize access="hasRole('ADMIN')">
                        <p>
                            <form:select path="roles" items="${roloi}" multiple="true" itemValue="rid" itemLabel="rname"/>
                            <form:errors path="roles" cssClass="error"/>
                        </p>   
                    </security:authorize>

                    <input class="btn btn-light" type="submit" value="Register">
                    <hr>
                    <a href="${pageContext.request.contextPath}/">Home </a>


                </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

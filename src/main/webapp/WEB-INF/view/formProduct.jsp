<%-- 
    Document   : formProduct
    Created on : 28 Δεκ 2019, 2:43:21 μμ
    Author     : koui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <form:form 
            action="${pageContext.request.contextPath}/product/create" 
            method="POST"
            modelAttribute="product">
            <form:hidden path="pcode"/>
            Category : <form:input path="pcategory"/>
            <form:errors path="pcategory" cssClass="error"/> <br>
            SubCategory: <form:input path="psubcat"/>
            <form:errors path="psubcat" cssClass="error"/>
            <br/>
            Color: <form:input path="pcolor"/>
            <form:errors path="pcolor" cssClass="error"/> <br>
            Size: <form:input path="psize"/>
            <form:errors path="psize" cssClass="error"/> <br>
            Description: <form:input path="pdescr"/>
            <form:errors path="pdescr" cssClass="error"/> <br>
            Gender: <form:input path="pgender"/>
            <form:errors path="pgender" cssClass="error"/> <br>
            Quant: <form:input path="pquant"/>
            <form:errors path="pquant" cssClass="error"/> <br>
            Price: <form:input path="pprice"/>
            <form:errors path="pprice" cssClass="error"/> <br>
            <input type="submit" value="Submit">            
        </form:form>
        <br/>
        <a href="${pageContext.request.contextPath}/product/list">Back to List</a>
    </body>
</html>

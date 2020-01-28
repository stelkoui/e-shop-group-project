

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <security:authorize access="hasRole('ADMIN')">

            <a href="${pageContext.request.contextPath}/product/create">Create Product</a>
        </security:authorize>

            <table border="1" class="shadow">
            <tr>
                    <td>Code</td>
                    <td>Brand</td>
                    <td>Model</td>
                    <td>Color</td>
                    <td>Size</td>
                    <td>Description</td>
                    <td>Quantity</td>
                    <td>Price</td>
                    <td colspan="2">Actions</td>
            </tr>
            <c:forEach items="${listOfProduct}" var="p">
                <c:url var="deleteLink" value="/product/delete">
                    <c:param name="productId" value="${p.pcode}"/> 
                </c:url>
                <c:url var="updateLink" value="/product/update">
                    <c:param name="productId" value="${p.pcode}"/> 
                </c:url>
                <tr>
                    <td>${p.pcode}</td>
                    <td>${p.pcategory}</td>
                    <td>${p.psubcat}</td>
                    <td>${p.pcolor}</td>
                    <td>${p.psize}</td>
                    <td>${p.pdescr}</td>
                    <td>${p.pquant}</td>
                    <td>${p.pprice}</td>
                    <security:authorize access="hasRole('ADMIN')">
                        <td>
                            <a href="${deleteLink}"
                               onclick="if (!(confirm('Are you sure?')))
                                       return false">Delete</a>

                        </td>
                        <td>
                            <a href="${updateLink}">Update</a>
                        </td>
                    </security:authorize>

                </tr>
            </c:forEach>
        </table>
        <a href="${pageContext.request.contextPath}/">Home Page</a>
    </body>
</html>

<%-- 
    Document   : checkout
    Created on : Jan 5, 2020, 12:16:27 AM
    Author     : tasos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE html>
<html>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <head>
        <meta charset="UTF-8">
        <title>Check Out</title>
        <link rel="stylesheet" href="${path}/static/css/style.css" type="text/css" />
        <style type="text/css">
            table { border: 0; }
            table td {
                padding: 10px;
                color: #555;
            }
            input[type=submit]{
                color:#fff;
                background-color:#428bca;
                background-image: linear-gradient(to bottom, #428bca 0%, #2d6ca2 100%);
                padding: 6px 20px;
                font-size: 16px;
                border: none;
                border-radius: 4px;
            }
            a{
                color: #555;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div align="center" style="margin: 50px auto 0 auto; border: 1px solid grey; border-radius: 4px; width: 400px">
            <h1>Check Out</h1>
            <form:form action="authorize_payment" method="post" modelAttribute="orderDetail">
                <table>
                    <tr>
                        <td>Product/Service:</td>
                        <td>
                            <ul style="list-style: none;">
                                <c:forEach items="${orderDetail.products}" var="product">
                                    <li>
                                        ${product.pcategory}
                                    </li>
                                </c:forEach>
                            </ul>

                        </td>
                    </tr>
                    <tr>
                        <td>Sub Total:</td>
                        <td><form:input  path="subtotal"  /></td>
                    </tr>
                    <tr>
                        <td>Shipping:</td>
                        <td><form:input  path="shipping"  /></td>
                    </tr>    
                    <tr>
                        <td>Tax:</td>
                        <td><form:input  path="tax"  /></td>
                    </tr>    
                    <tr>
                        <td>Total Amount:</td>
                        <td><form:input  path="total"  /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input class="btn btn-primary" type="submit" value="Continue" />
                        </td>
                    </tr>
                </table>
            </form:form>
            <a href="${pageContext.request.contextPath}/">Cancel-Return Home</a>
        </div>
    </body>
    <!--F$PQy<3)-->

</html>

   
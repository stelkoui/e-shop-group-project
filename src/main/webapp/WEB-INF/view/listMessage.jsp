<%-- 
    Document   : listMessage
    Created on : 6 Ιαν 2020, 7:29:26 μμ
    Author     : koui
--%>

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
        <h1>Hello World!</h1>
        
         <table border="1" >
            <thead>
                <tr>
                    <th>Mid</th>
                    <th>Message</th>
                    <th>Username</th>         
                </tr>
            </thead>
             <c:forEach items="${listOfMessages}" var="m">
                        <c:url var="deleteLink" value="/message/delete">
                            <c:param name="messageId" value="${m.mid}"/> 
                        </c:url>
                        <tbody>
                            <tr>
                                <td>${m.mid}</td>
                                <td>${m.mtext}</td>
                                <td>${m.musername}</td>                               
                                    <td>
                                        <a href="${deleteLink}"
                                           onclick="if (!(confirm('Are you sure?')))
                                                               return false">Delete</a>

                                    </td>                   
                            </tr>
                        </tbody>
                    </c:forEach>
        
        </table>
            <a href="${pageContext.request.contextPath}/">Home Page</a>
    </body>
</html>

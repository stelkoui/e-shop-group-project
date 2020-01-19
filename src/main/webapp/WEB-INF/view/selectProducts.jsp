

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <!--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
        <link href="${path}/static/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${path}/static/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${path}/static/css/style.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products Order</title>
    </head>
    <body>
        <header>
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">

                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                                <li>
                                    <i class="fas fa-shopping-cart"></i>
                                    <strong id="num">0</strong> <br>
                                    <span class="shopping">Total: <span id="total">0</span></span>
                                </li>
                            </security:authorize>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <h1>Choose your Products</h1>
       
        <form:form action="cart" method="POST" modelAttribute="orderDetail">
             
            <c:forEach items="${productList}" var="p">
                
              
                                            <div >
                    <form:checkbox  path="products" value="${p.pcategory}" label="${p.psubcat} - $${p.pprice}" />
                    <form:errors  path="products"/>
                </div>
            </c:forEach>

            <br/>
            <input type="submit" value="Go to cart"/>

        </form:form>
            
      
              <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="${path}/static/js/bootstrap.min.js"></script>
    </body>
</html>

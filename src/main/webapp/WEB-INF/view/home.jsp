<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
        <link href="${path}/static/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${path}/static/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${path}/static/css/style.css" type="text/css" />
    </head>

    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${path}/">For SHOE re</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <security:authorize access="!hasRole('USER') and !hasRole('ADMIN')">
                            <li><a href="${pageContext.request.contextPath}/register/showForm">Create account</a></li>
                            </security:authorize>


                        <security:authorize access="!hasRole('USER') and !hasRole('ADMIN')">
                            <li><a href="${pageContext.request.contextPath}/loginPage">Log in</a></li>
                            </security:authorize>


                        <security:authorize access="isAuthenticated()">
                            <li><a><security:authentication property="principal.username" /> ${principal.username}</a></li>
                            </security:authorize>

                        <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                            <li> <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                    <input type="submit" value="Logout">
                                </form:form></li>
                            </security:authorize>
                    </ul>
                </div>
            </div>
        </div>
        <div style="margin-top: 50px; width:100%; height: 100px; background-color: white;">
            <div class="container banner-container">
                <div class="photobanner">
                    <img id="adidas" class="first" src="${path}/static/img/banner/adidas-logo.png" alt="">
                    <img id="asics" src="${path}/static/img/banner/asics-logo.png" alt="">
                    <img id="champion" src="${path}/static/img/banner/champion-logo.png" alt="">
                    <img id="converse" src="${path}/static/img/banner/converse-logo.png" alt="">
                    <img id="fila" src="${path}/static/img/banner/fila-logo.png" alt="">
                    <img id="lacoste" src="${path}/static/img/banner/lacoste-logo.png" alt="">
                    <img id="lotto" src="${path}/static/img/banner/lotto-logo.png" alt="">
                    <img id="mckinley" src="${path}/static/img/banner/mckinley-logo.png" alt="">
                    <img id="newbalance" src="${path}/static/img/banner/newbalance-logo.png" alt="">
                    <!--onclick="location.href = '${path}/product/list'"--> 
                    <img id="nike" src="${path}/static/img/banner/nike-logo.png" alt="">
                    <img id="oneil" src="${path}/static/img/banner/oneil-logo.png" alt="">
                    <img id="puma" src="${path}/static/img/banner/puma-logo.png" alt="">
                    <img id="reebok" src="${path}/static/img/banner/reebok-logo.png" alt="">
                    <img id="skechers" src="${path}/static/img/banner/skechers-logo.png" alt="">
                </div>
            </div>
        </div>
        <div id="main">
            <div class="container">

                <!--<div class="row" style="float:right;">-->
                <div class="row">
                    <div >
                        <h1>Search</h1>
                        <h2 class="subtitle">and you will find here</h2>
                        <form:form action="${path}/product/search" method="GET">
                            <input type="text" name="searchCriteria" placeholder="Search" size="10">
                            <input type="submit" class="fa fa-search" value="&#xf002">
                        </form:form>
                    </div>


                </div>

                <div id="select-categ" class="row categ">
                    <p class="subtitle">Categories</p>

                    <ul>
                        <li><a id="men" href="#">MEN</a>
                            <ul>
                                <li><a id="lifestyle" href="#">Lifestyle</a></li>
                                <li><a href="#">Running</a></li>
                                <li><a href="#">Football</a></li>
                                <li><a href="#">Basketball</a></li>
                                <li><a href="#">Crossfit</a></li>
                            </ul>
                        </li>
                        <li><a id="women" href="#">WOMEN</a>
                            <ul>
                                <li><a href="#">Lifestyle</a></li>
                                <li><a href="#">Running</a></li>
                                <li><a href="#">Sport</a></li>
                                <li><a href="#">Crossfit</a></li>
                            </ul>
                        </li>
                        <li><a id="kids" href="#">KIDS</a>
                            <ul>
                                <li><a href="#">Lifestyle</a></li>
                                <li><a href="#">Running</a></li>
                                <li><a href="#">Football</a></li>
                                <li><a href="#">Basketball</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="footer" class="">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <p class="copyright">&copy; 2020</p>
                    </div>
                <a href="${pageContext.request.contextPath}/chat">Chat</a>

                    <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                        <div class="col-md-4">
                            <div class="credits">
                                <a href="${pageContext.request.contextPath}/message/send" >Contact</a>

                            </div>
                        </div>
                    </security:authorize>
                    <security:authorize access="hasRole('ADMIN')">
                        <div class="col-md-2">
                            <div class="credits">
                                <a href="${pageContext.request.contextPath}/admin">Admin</a>
                            </div>
                        </div>
                    </security:authorize>

                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="${path}/static/js/bootstrap.min.js"></script>

        <!--<h1>welcome</h1>-->
        <%--<security:authorize access="hasRole('ADMIN')">--%>
            <!--<a href="${pageContext.request.contextPath}/admin">Admin page</a>--> 
        <%--</security:authorize>--%>
        <!--<br>-->
        <!--<a href="${pageContext.request.contextPath}/product/list">Shoes</a>-->
        <!--<br>-->
        <%--<security:authorize access="hasRole('USER')">--%> 
            <!--<a href="${pageContext.request.contextPath}/user">User page</a>--> 
        <%--</security:authorize>--%>
        <!--<hr>-->
        <%--<form:form action="${pageContext.request.contextPath}/logout" method="POST">--%>
        <!--<input type="submit" value="Logout">-->

        <%--</form:form>--%>

        <script>
            $("#adidas").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#asics").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#champion").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#converse").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#fila").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#lacoste").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#lotto").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#mckinley").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#newbalance").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#nike").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#oneil").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#puma").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#reebok").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#skechers").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });

            $("#men").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });

            $("#lifestyle").on('click', function (id) {
                location.href = '${path}/product/men/?searchCriteria=' + this.id;
            });

            $("#women").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });

            $("#kids").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });

        </script>

    </body>
</html>

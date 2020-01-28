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
                    <a class="navbar-brand" href="${path}/">Shoe's Portal</a>
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
                            <li class="padding_li_nav"> <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                    <button type="submit">Logout  <i class="fas fa-sign-out-alt"></i></button>
                                    </form:form>
                            </li>
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
                                <li><a id="menLifestyle" href="#">Lifestyle</a></li>
                                <li><a id="menRunning" href="#">Running</a></li>
                                <li><a id="menFootball" href="#">Football</a></li>
                                <li><a id="menBasketball" href="#">Basketball</a></li>
                                <li><a id="menCrossfit" href="#">Crossfit</a></li>
                            </ul>
                        </li>
                        <li><a id="women" href="#">WOMEN</a>
                            <ul>
                                <li><a id="womenLifestyle" href="#">Lifestyle</a></li>
                                <li><a id="womenRunning" href="#">Running</a></li>
                                <li><a id="womenSport" href="#">Sport</a></li>
                                <li><a id="womenCrossfit" href="#">Crossfit</a></li>
                            </ul>
                        </li>
                        <li><a id="kids" href="#">KIDS</a>
                            <ul>
                                <li><a id="kidsLifestyle" href="#">Lifestyle</a></li>
                                <li><a id="kidsRunning" href="#">Running</a></li>
                                <li><a id="kidsFootball" href="#">Football</a></li>
                                <li><a id="kidsBasketball" href="#">Basketball</a></li>
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
            $("#women").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });
            $("#kids").on('click', function (id) {
                location.href = '${path}/product/search?searchCriteria=' + this.id;
            });           
            
            $("#menLifestyle").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/men?category=' + data;
            });
            
            $("#menRunning").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/men?category=' + data;
            });
            
            $("#menFootball").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/men?category=' + data;
            });
            
            $("#menBasketball").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/men?category=' + data;
            });
            
            $("#menCrossfit").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/men?category=' + data;
            });
            
            $("#womenLifestyle").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/women?category=' + data;
            });
            
            $("#womenRunning").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/women?category=' + data;
            });
            
            $("#womenSport").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/women?category=' + data;
            });
            
            $("#womenCrossfit").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/women?category=' + data;
            });
            
            $("#kidsLifestyle").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/kids?category=' + data;
            });
            
            $("#kidsRunning").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/kids?category=' + data;
            });
            
            $("#kidsFootball").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/kids?category=' + data;
            });
            
            $("#kidsBasketball").on('click', function () {
                let data = this.innerText.toLowerCase();
                location.href = '${path}/product/kids?category=' + data;
            });


        </script>

    </body>
</html>

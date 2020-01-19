<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>-->
        <link href="static/css/${path}/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="static/css/${path}/bootstrap-theme.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${path}/static/css/style.css" type="text/css" />
        <title>Product list</title>
    </head>
    <body>
        <!--<header>-->
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
                        <li><a href="${pageContext.request.contextPath}/register/showForm">Create account</a></li>

                        <li><a href="${pageContext.request.contextPath}/loginPage">Log in</a></li>
                        <li></li>

                        <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                            <li> <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                    <input type="submit" value="Logout">
                                </form:form></li>
                            </security:authorize>
                    </ul>
                </div>
            </div>
        </div>
        <!--</header>-->
        <security:authorize access="hasRole('ADMIN')">

            <a href="${pageContext.request.contextPath}/product/create">Create Product</a>
        </security:authorize>

        <table border="1" class="shadow">
            <thead>
                <tr>
                    <th>Product Id</th>
                    <th>Product Category</th>
                    <th>Subcategory</th>
                    <th>Color</th>
                    <th>Size</th>
                    <th>Description</th>
                    <th>Gender</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Url</th>
                </tr>
            </thead>

            <c:forEach items="${listOfProduct}" var="p">
                <c:url var="deleteLink" value="/product/delete">
                    <c:param name="productId" value="${p.pcode}"/> 
                </c:url>
                <c:url var="updateLink" value="/product/update">
                    <c:param name="productId" value="${p.pcode}"/> 
                </c:url>
<!--
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="card">
                                <div class="filter-group">
                                    <h6 class="title">Product type</h6>
                                    <div class="filter-content show" id="">
                                        <div class="card-body">
                                            <form>
                                                <input type="text" name="searchCriteria" placeholder="Search" size="10">
                                                <input type="submit" class="fa fa-search" value="&#xf002">
                                            </form>
                                            <ul class="list-menu">
                                                <li><a href="#">Men  </a></li>
                                                <li><a href="#">Women </a></li>
                                                <li><a href="#">KIds  </a></li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                                <div class="filter-group">
                                    <h6 class="title">Brands</h6>
                                    <div class="filter-content show" id="">
                                        <div class="card-body">
                                            <input type="checkbox" name="" value="Adidas">
                                            <label>Adidas</label>
                                            <input type="checkbox" name="" value="Asics">
                                            <label>Asics</label>
                                            <input type="checkbox" name="" value="Champion">
                                            <label>Champion</label>
                                            <input type="checkbox" name="" value="Converse">
                                            <label>Converse</label>
                                            <input type="checkbox" name="" value="Fila">
                                            <label>Fila</label>
                                            <input type="checkbox" name="" value="Lacoste">
                                            <label>Lacoste</label>
                                            <input type="checkbox" name="" value="Lotto">
                                            <label>Lotto</label>
                                            <input type="checkbox" name="" value="McKinley">
                                            <label>McKinley</label>
                                            <input type="checkbox" name="" value="NewBalance">
                                            <label>NewBalance</label>
                                            <input type="checkbox" name="" value="Nike">
                                            <label>Nike</label>
                                            <input type="checkbox" name="" value="Oneil">
                                            <label>Oneil</label>
                                            <input type="checkbox" name="" value="Puma">
                                            <label>Puma</label>
                                            <input type="checkbox" name="" value="Reebok">
                                            <label>Reebok</label>
                                            <input type="checkbox" name="" value="Skechers">
                                            <label>Skechers</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="filter-group">
                                    <h6 class="title">Price range</h6>
                                    <div class="filter-content show" id="">
                                        <div class="card-body">
                                            <div class="input-group ">
                                                <input type="range" name="" value="Skechers">
                                                <label>Max </label>
                                            </div>
                                            <label class="label-max">
                                                <span >Max. &#36;
                                                    <output for="priceSlider" id="volume">2,000</output >
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="filter-group">
                                    <h6 class="title">Sizes</h6>
                                    <div class="filter-content show" id="">
                                        <div class="card-body">
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 38 </span>
                                            </label>
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 39 </span>
                                            </label>
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 40 </span>
                                            </label>
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 41 </span>
                                            </label>
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 42 </span>
                                            </label>
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 43 </span>
                                            </label>
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 44 </span>
                                            </label>
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 45 </span>
                                            </label>
                                            <label class="checkbox-btn">
                                                <input type="checkbox">
                                                <span class="btn btn-light"> 46 </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="card">
                                <div class="row no-gutters">
                                    <div class="col-md-3">
                                        <a href="#" class="img-wrap">
                                            <img src="${p.purl}">
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="">
                                            <a href="#" class="h5 title"> ${p.pcategory} ${p.psubcat} </a>
                                            
                                            <p> ${p.pdescr} Lorem ipsum dolor sit amet, consectetuer adipiscing 
                                                elit, Ut wisi enim ad minim veniam </p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="">
                                            <p class="">€ ${p.pprice}</p>
                                            <p> 
                                                <a href="#" class="btn btn-primary btn-block"> BUY </a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <tbody>
                        <tr>
                            <td>${p.pcode}</td>
                            <td>${p.pcategory}</td>
                            <td>${p.psubcat}</td>
                            <td>${p.pcolor}</td>
                            <td>${p.psize}</td>
                            <td>${p.pdescr}</td>
                            <td>${p.pgender}</td>
                            <td>${p.pquant}</td>
                            <td>${p.pprice}</td>
<!--                            <td>
                                <img src="${p.purl}" alt="shoe"/>
                            </td>-->
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
                    </tbody>
                </c:forEach>

        </table>
        <a href="${pageContext.request.contextPath}/">Home Page</a>
    </body>
</html>

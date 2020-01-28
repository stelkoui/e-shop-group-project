<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link href="${path}/static/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${path}/static/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${path}/static/css/style.css" type="text/css" />
    </head>

    <body>
        <header>
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

                                <li><a href="${pageContext.request.contextPath}/loginPage">Log in</a></li>
                                </security:authorize>
                                <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                                <li class="padding_li_nav" >
                                    <i class="fas fa-shopping-cart"></i>
                                    <strong id="num">0</strong> <br>
                                </li>
                                <li class="padding_li_nav">
                                    <span class="shopping" id="total">Total: <span id="total">0</span>
                                </li>
                                <li class="">
                                    <a href="${pageContext.request.contextPath}/checkout">Checkout</a>
                                </li>

                                <li class="padding_li_nav"> <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                        <button type="submit">Logout  <i class="fas fa-sign-out-alt"></i></button>

                                    </form:form>
                                </li>
                            </security:authorize>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <main style="margin-top: 50px; width:100%;">
            <div class="container">
                <h2 class="title-page">Products</h2>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">

                        <div class="card">
                            <div class="filter-group">
                                <h4 class="title">Product type</h4>
                                <div class="filter-content show" >
                                    <div class="card-body">
                                        <form:form action="${path}/product/search" method="GET">
                                            <div class="input-group">
                                                <input id="searchAll" type="text" name="searchCriteria" placeholder="Search" size="10">
                                                <input type="submit" class="fa fa-search" value="&#xf002">
                                            </div>
                                        </form:form>

                                        <ul class="list-menu" id="accordion">
                                            <li>
                                                <h4 id="men" onclick="showHide('subcat_men')">Men 
                                                    <i class="fas fa-angle-down"></i>
                                                </h4>
                                                <ul id="subcat_men" style="display: none;">
                                                    <li><a href="${path}/product/men?category=lifestyle">Lifestyle </a></li>
                                                    <li><a href="${path}/product/men?category=running">Running  </a></li>
                                                    <li><a href="${path}/product/men?category=football">Football </a></li>
                                                    <li><a href="${path}/product/men?category=basketball">Basketball </a></li>
                                                    <li><a href="${path}/product/men?category=crossfit">Crossfit  </a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <h4 id="women" onclick="showHide('subcat_women')">Women 
                                                    <i class="fas fa-angle-down"></i>
                                                </h4>
                                                <ul id="subcat_women" style="display: none;">
                                                    <li><a href="${path}/product/women?category=lifestyle">Lifestyle </a></li>
                                                    <li><a href="${path}/product/women?category=running">Running  </a></li>
                                                    <li><a href="${path}/product/women?category=sport">Sport </a></li>
                                                    <li><a href="${path}/product/women?category=crossfit">Crossfit  </a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <h4 id="kids" onclick="showHide('subcat_kids')">Kids 
                                                    <i class="fas fa-angle-down"></i>
                                                </h4>
                                                <ul id="subcat_kids" style="display: none;">
                                                    <li><a href="${path}/product/kids?category=lifestyle">Lifestyle </a></li>
                                                    <li><a href="${path}/product/kids?category=running">Running  </a></li>
                                                    <li><a href="${path}/product/kids?category=football">Football </a></li>
                                                    <li><a href="${path}/product/kids?category=basketball">Basketball </a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <hr />
                                    </div>
                                </div>
                            </div>
                            <div class="filter-group">
                                <h4 class="title">Brands</h4>
                                <div class="filter-content show" >
                                    <div class="card-body">
                                        <input id="adidas" type="checkbox" name="brand" value="adidas">
                                        <label class="label_check">Adidas</label>
                                        <input id="asics" type="checkbox" name="brand" value="asics">
                                        <label class="label_check">Asics</label><br />
                                        <input id="champion" type="checkbox" name="brand" value="champion">
                                        <label class="label_check">Champion</label>
                                        <input id="converse" type="checkbox" name="brand" value="converse">
                                        <label class="label_check">Converse</label><br />
                                        <input id="fila" type="checkbox" name="brand" value="fila">
                                        <label class="label_check">Fila</label>
                                        <input id="lacoste" type="checkbox" name="brand" value="lacoste">
                                        <label class="label_check">Lacoste</label><br />
                                        <input id="lotto" type="checkbox" name="brand" value="lotto">
                                        <label class="label_check">Lotto</label>
                                        <input id="mcKinley" type="checkbox" name="brand" value="mckinley">
                                        <label class="label_check">McKinley</label><br />
                                        <input id="newBalance" type="checkbox" name="brand" value="newbalance">
                                        <label class="label_check">NewBalance</label>
                                        <input id="nike" type="checkbox" name="brand" value="nike">
                                        <label class="label_check">Nike</label><br />
                                        <input id="oneil" type="checkbox" name="brand" value="oneil">
                                        <label class="label_check">Oneil</label>
                                        <input id="puma" type="checkbox" name="brand" value="puma">
                                        <label class="label_check">Puma</label><br />
                                        <input id="reebok" type="checkbox" name="brand" value="reebok">
                                        <label class="label_check">Reebok</label>
                                        <input id="skechers" type="checkbox" name="brand" value="skechers">
                                        <label class="label_check">Skechers</label>

                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="filter-group">
                                <h4 class="title">Price range</h4>
                                <div class="filter-content show" id="pp">
                                    <div class="card-body">
                                        <div class="input-group ">
                                            <input id="priceSlider" type="range" name="slider" max="200">
                                            <label for="priceSlider" >
                                                <span >Max &euro;</span>
                                                <span id="volume">200</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="filter-group">
                                <h4 class="title">Sizes</h4>

                                <div class="filter-content show" id="size_filters">

                                    <div class="card-body">
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="30">
                                            <span class="btn btn-light">30</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="31">
                                            <span class="btn btn-light">31</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="32">
                                            <span class="btn btn-light">32</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="33">
                                            <span class="btn btn-light">33</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="34">
                                            <span class="btn btn-light">34</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="35">
                                            <span class="btn btn-light">35</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="36">
                                            <span class="btn btn-light">36</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="37">
                                            <span class="btn btn-light">37</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="38">
                                            <span class="btn btn-light">38</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="39">
                                            <span class="btn btn-light">39</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="40">
                                            <span class="btn btn-light">40</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="41">
                                            <span class="btn btn-light">41</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="42">
                                            <span class="btn btn-light">42</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="43">
                                            <span class="btn btn-light">43</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="44">
                                            <span class="btn btn-light">44</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="45">
                                            <span class="btn btn-light">45</span>
                                        </label>
                                        <label class="checkbox-btn">
                                            <input type="checkbox" name="size" value="46">
                                            <span class="btn btn-light">46</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${listOfProduct}" var="p">
                        <div class="products">
                            <div class="col-md-9 shadow product_item" data-brand="${p.pcategory}" data-size="${p.psize}">
                                <div class="card">
                                    <div class="row product_item_container shadow">
                                        <div class="col-md-3">
                                            <a href="#" class="img-wrap">
                                                <img src="${p.purl}">
                                            </a>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="">
                                                <h3><a href="#" class=""> ${fn:toUpperCase(fn:substring(p.pcategory, 0, 1))}${fn:toLowerCase(fn:substring(p.pcategory, 1, -1))} ${p.psubcat} </a></h3>

                                                <p> ${p.pdescr2} 
                                                    </p>
                                                <p> ${p.pdescr} <span class="totheRight">Size ${p.psize}</span></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="">
                                                <p>€ <span class="productPrice">${p.pprice}</span></p>
                                                    <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                                                    <button class="btn btn-primary btn-block" id="AddToCart" onclick="addToCart(${p.pcode})">add to cart </button>
                                                </security:authorize>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                         
                    </c:forEach>

                </div>
        </main>
        <footer>
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
        </footer>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>

        <script src="${path}/static/js/bootstrap.min.js"></script>

        <script>
              var num = 0;
              var total = 0;
              function addToCart(productId) {
               $.post("/GroupProject/add/cart/" + productId,
               function (data, status) {
                 console.log(status);
                  if (status == "success") {
//                     alert("Success");
                     num+=1;
                      $("#num").text(num);
                      $("#total").text("Total: " + data);
                       } else {
                        alert("Please retry");
                         }
                         });
                      }
        </script>
        <script>
            function showHide(id) {
                let e = document.getElementById(id);
                if (e.style.display == 'block')
                    e.style.display = 'none';
                else
                    e.style.display = 'block';
            }

            $(document).ready(function () {
                $('#searchAll').keyup(function () {
                    let entry = $(this).val();
                    $('.product_item').hide();
                    $('.product_item:contains("' + entry + '")').show();
                });
                $('input[name="brand"]').click(function () {
                    if ($('input[name="brand"]:checked').length > 0) {
                        $('.products >div').hide();
                        $('input[name="brand"]:checked').each(function () {
                            $('.products >div[data-brand=' + this.value + ']').show();
                        });
                    } else {
                        $('.products >div').show();
                    }
                });
                $('input[name="size"]').click(function () {
                    if ($('input[name="size"]:checked').length > 0) {
                        $('.products >div').hide();
                        $('input[name="size"]:checked').each(function () {
                            $('.products >div[data-size=' + this.value + ']').show();
                        });
                    } else {
                        $('.products >div').show();
                    }
                });
                const priceSlider = $("#priceSlider");
                priceSlider.on("change", (e) => {
                    $("#volume").text(e.target.value);
                    let volume = $("#volume").text();
//                    console.log(volume);
                    $(".product_item .productPrice").filter(function () {
//                        console.log(parseInt($(this).text()));
                        $(".product_item").each(function () {
                            while (parseInt($(".productPrice").text() > 100)) {
                                $(".product_item").hide();
                            }
                        });
                    });
                });
            });


        </script>



        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>



        <script>
            $(document).ready(function () {
                $('#searchAll').keyup(function () {
                    let entry = $(this).val();
                    $('.product_item').hide();
                    $('.product_item:contains("' + entry + '")').show();
                });
                const priceSlider = $("#priceSlider");
                priceSlider.on("change", (e) => {

                    $("#volume").text(e.target.value);
                    let volume = $("#volume").text();
                    console.log(volume);

                    $(".product_item .productPrice").filter(function () {
                        console.log(parseInt($(this).text()));
                        $(".product_item").each(function () {

                            while (parseInt($(".productPrice").text() > 100)) {
                                $(".product_item").hide();

                            }
                        });
                    });
                });
            });


        </script>

    </body>
</html>

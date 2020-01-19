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


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <!--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
        <link href="${path}/static/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${path}/static/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${path}/static/css/style.css" type="text/css" />
    </head>

    <body>
        <header>
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <!--                           <div class="navbar-header">
                                                   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                                       <span class="icon-bar"></span>
                                                       <span class="icon-bar"></span>
                                                       <span class="icon-bar"></span>
                                                   </button>
                                                   <a class="navbar-brand" href="${path}/">For SHOE re</a>
                                               </div>-->
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
<!--                                   <li><a href="${pageContext.request.contextPath}/register/showForm">Create account</a></li>

                            <li><a href="${pageContext.request.contextPath}/loginPage">Log in</a></li>-->

                            <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                                <li>
                                    <i class="fas fa-shopping-cart"></i>
                                    <strong id="num">0</strong> <br>
                                    <span class="shopping">Total: <span id="total">0</span></span>
                                </li>

                                <!--                                <li> <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                                                                                    <input type="submit" value="Logout">
                                </form:form></li>-->
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
                                <div class="filter-content show" id="f">
                                    <div class="card-body">
                                        <form>
                                            <div class="input-group">
                                                <input id="searchAll" type="text" name="searchCriteria" placeholder="Search" size="10">
                                                <input type="submit" class="fa fa-search" value="&#xf002">
                                            </div>
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
                                <h4 class="title">Brands</h4>
                                <div class="filter-content show" id="ff">
                                    <div class="card-body">
                                        <input type="checkbox" name="a" value="Adidas">
                                        <label>Adidas</label>
                                        <input type="checkbox" name="b" value="Asics">
                                        <label>Asics</label>
                                        <input type="checkbox" name="c" value="Champion">
                                        <label>Champion</label>
                                        <input type="checkbox" name="d" value="Converse">
                                        <label>Converse</label>
                                        <input type="checkbox" name="e" value="Fila">
                                        <label>Fila</label>
                                        <input type="checkbox" name="f" value="Lacoste">
                                        <label>Lacoste</label>
                                        <input type="checkbox" name="g" value="Lotto">
                                        <label>Lotto</label>
                                        <input type="checkbox" name="h" value="McKinley">
                                        <label>McKinley</label>
                                        <input type="checkbox" name="i" value="NewBalance">
                                        <label>NewBalance</label>
                                        <input type="checkbox" name="j" value="Nike">
                                        <label>Nike</label>
                                        <input type="checkbox" name="k" value="Oneil">
                                        <label>Oneil</label>
                                        <input type="checkbox" name="l" value="Puma">
                                        <label>Puma</label>
                                        <input type="checkbox" name="m" value="Reebok">
                                        <label>Reebok</label>
                                        <input type="checkbox" name="n" value="Skechers">
                                        <label>Skechers</label>
                                    </div>
                                </div>
                            </div>
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
                            <div class="filter-group">
                                <h4 class="title">Sizes</h4>
                                <div class="filter-content show" id="size">
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
                                            <input class="checkFilter" type="checkbox" value="44">
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
                    <c:forEach items="${listOfProduct}" var="p">
                        <div class="col-md-9 shadow product_item">
                            <div class="card">
                                <div class="row product_item_container">
                                    <div class="col-md-3">
                                        <a href="#" class="img-wrap">
                                            <img src="${p.purl}">
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="">
                                            <h3><a href="#" class=""> ${p.pcategory} ${p.psubcat} </a></h3>

                                            <p> ${p.pdescr} Lorem ipsum dolor sit amet, consectetuer adipiscing 
                                                elit, Ut wisi enim ad minim veniam </p>
                                            <p>Size ${p.psize}</p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="">
                                            <p>€ <span class="productPrice">${p.pprice}</span></p>
                                            <a href="${pageContext.request.contextPath}/products">add to cart
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>

                </div>
        </main>
        <!--        <footer>
                    <div id="footer" class="">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <p class="copyright">&copy; 2020</p>
                                </div>
        <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
            <div class="col-md-4">
                <div class="credits">
                    <a href="${pageContext.request.contextPath}/message/send" >Contact</a>
                    <a href="${pageContext.request.contextPath}/chat">Chat</a>
    
                </div>
            </div>
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">
            <div class="col-md-4">
                <div class="credits">
                    <a href="${pageContext.request.contextPath}/admin">Admin</a>
                </div>
            </div>
        </security:authorize>
    
    </div>
    </div>
    </div>
    </footer>-->
        <script>
            const btnCart = document.getElementById("#btnCart");
            const cart = [];
            btnCart.click(function (e) {
                cart.push(product);

                $("#sum").text(cart.length);
            }
            );
        </script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="${path}/static/js/bootstrap.min.js"></script>

       

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
            //                    $("#volume").text(e.target.value);
            //                    let volume = $("#volume").text();
            //                    let price = $("productPrice").text();
            //                    if (price >= volume) { //2000 is the amount where you want the event to trigger
            //                        $('.product_item').hide();
            //                    } else {
            //                        $('.product_item').show();
            //                    }

            //                    $(".product_item").each(function () {
            //                        
            //                    $(".productPrice").each(function () {
            //                        let price = $(".productPrice").html();
            //                        
            //                        console.log(price);
            ////                        let volume = $("#volume").text();
            ////                        console.log(price-volume);
            //                        
            ////                        if ((price - volume) < 0){
            ////                            $(this).hide();
            ////                        }else{
            ////                            $(this).show();
            ////                        }
            //                         });
            //                    });



            //                        


            //                    




        </script>

    </body>
</html>

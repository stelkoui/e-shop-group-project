
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en"><head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                background-color:lightgreen;
            }
            article {
                background-color: white;
                border: 2px solid black;
                width: 23%;
                display: inline-block;
                padding: 10px;
                margin: 1%;
                box-shadow: 2px 2px 12px black;
                cursor: pointer;
            }

            article p {
                min-height: 4rem;
                line-height: 1rem;
                font-family: Arial, sans-serif;

            }

            span {

                color: red;
            }
            nav {
                background-color: white;
                padding: 10px;
                border: 2px solid;
                margin-right: 1%;
                /* margin-left:1%; */
                text-align: right;

            }
            /* if max-width :930px*/
            @media (max-width: 930px){
                body {
                    background-color: yellow;
                }
            }
            @media (max-width: 800px){
                article  {
                    width: 35%;
                }
            }

            @media (max-width: 480px){
                article {
                    width: 50%;
                }
            }



        </style>
    </head>

    <body>
        <h1>Shop</h1>
        <nav>
            Shopping Cart : <i class="fas fa-shopping-cart"></i>
            <strong>0</strong> <br>
            Total: <span>0</span>
        </nav> <br>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" 
        crossorigin="anonymous"></script>



        <script>

            function init() {
                let num = 0;
                const cart = [];
                const URL = "http://localhost:8080/GroupProject/shoes";

                function displayProduct(product, index) {

                    const article = $("<article/>");
                    const p = $("<p/>");
                    p.html(" Brand: " + product.pcategory + " | description:  " + product.pdescr + " | price: <mark> " + product.pprice + "</mark>");

                    const img = $("<img/>");
                    img.attr("src", product.purl);
                    img.attr("alt", product.pcategory);
                    img.attr("width", 100);

                    article.append(p);
                    article.append(img);
                    const btn = $("<button/>");
                    btn.text("Add to Cart");
                    // btn.addEventListener("click",function(e){...});
                    btn.click(function (e) {
                        console.log(index, this);
                        cart.push(product);

                        $("nav strong").text(cart.length);

                        num = num + product.pprice;


                        $("nav span").text(num.toFixed(2));
                    });

                    article.append(btn);
                    
                    
                    $(document.body).append(article);

                }

                function display(data) {
                    console.log("success:", data);
                    data.forEach(displayProduct);


                }
                ;

                const options = {
                    url: URL,
                    success: display
                };
                $.ajax(options);


            }
            $(init);
           
        </script>





    </body>
</html>
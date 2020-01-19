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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
        <title>Product list</title>
    </head>
    <body ng-app="Shoes">
        
        <security:authorize access="hasRole('ADMIN')">

            <a href="${pageContext.request.contextPath}/product/create">Create Product</a>
        </security:authorize>

        <table border="1" class="shadow" ng-controller="ShoesCtrlr">
            <thead>
                <tr>
                    <th ng-click="filterKeyword = 'id';reverse = !reverse">
                        <div class="d-flex justify-content-between">Product Id <i class="fas fa-sort"></i>
                        </div>
                    </th>
                    <th ng-click="filterKeyword = 'categ';reverse = !reverse">
                        <div class="d-flex justify-content-between">Product Category <i class="fas fa-sort"></i>
                        </div>
                    </th>
                    <th ng-click="filterKeyword = 'subcateg';reverse = !reverse">
                        <div class="d-flex justify-content-between">Subcategory <i class="fas fa-sort"></i>
                        </div>
                    </th>
                    <th ng-click="filterKeyword = 'color';reverse = !reverse">
                        <div class="d-flex justify-content-between">Color <i class="fas fa-sort"></i>
                        </div>
                    </th>
                    <th ng-click="filterKeyword = 'size';reverse = !reverse">
                        <div class="d-flex justify-content-between">Size <i class="fas fa-sort"></i>
                        </div>
                    </th>
                    <th ng-click="filterKeyword = 'descr';reverse = !reverse">
                        <div class="d-flex justify-content-between">Description <i class="fas fa-sort"></i>
                        </div>
                    </th>
                    <th ng-click="filterKeyword = 'quant';reverse = !reverse">
                        <div class="d-flex justify-content-between">Quantity <i class="fas fa-sort"></i>
                        </div>
                    </th>
                    <th ng-click="filterKeyword = 'price';reverse = !reverse">
                        <div class="d-flex justify-content-between">Price <i class="fas fa-sort"></i>
                        </div>
<!--                    </th>
                    <th ng-click="filterKeyword = 'url';reverse = !reverse">
                        <div class="d-flex justify-content-between">Photo <i class="fas fa-sort"></i>
                        </div>
                    </th>-->
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="shoe in shoes| filter:selected | orderBy:filterKeyword:reverse ">
                    <td>{{ shoe.pcode | uppercase }}</td>
                    <td>{{ shoe.pcategory | uppercase }}</td>
                    <td>{{ shoe.psubcat | uppercase }}</td>
                    <td>{{ shoe.pcolor | uppercase }}</td>
                    <td>{{ shoe.psize | uppercase }}</td>
                    <td>{{ shoe.pdescr | uppercase }}</td>
                    <td>{{ shoe.pquant | uppercase }}</td>
                    <td>{{ shoe.pprice | uppercase }}</td>
<!--                    <td>
                        <img src="{{shoe.purl}}" alt="shoe"/>
                    </td>-->
                </tr>
            </tbody>
        </table>
        <a href="${path}/">Home Page</a>
        <script>
            const App = angular.module("Shoes", []);

            App.controller("ShoesCtrlr", function ($scope, $http) {

                const URL = "${path}/shoes";

                $scope.filterKeyword = 'pcode';

                $scope.reverse = false;

                $http.get(URL).then(function (response) {

                    console.log(response.data);
                    $scope.shoes = response.data;

                });

            });
        </script>
    </body>
</html>

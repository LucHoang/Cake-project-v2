<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Le Minh Duc
  Date: 14/04/2021
  Time: 08:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cake | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
            $('table .viewUser').on('click',function (){
                var userIdd = $(this).parent().parent().parent().find('#userIdtable').val();
                console.log(userIdd);
                $.ajax({
                    type:'GET',
                    url:'/ManagerOrderServlet',
                    data:{action:'viewUser', userId:userIdd },
                    dataType:'json',
                    contentType:'application/json',
                    success: function (result){
                        console.log(result);
                        $('#ModalUser #userIdd').val(result.userId);
                        $('#ModalUser #userName').val(result.name);
                        $('#ModalUser #email').val(result.email);
                        $('#ModalUser #phone').val(result.phone);
                        $('#ModalUser #address').val(result.address);
                    }
                });
            });
            $('table .viewOrderDetail').on('click',function (){
                var userId = $(this).parent().parent().parent().find('#userIdtable').val();
                console.log('userId:'+userId);
                $("#tableOrderDetail tr td").remove();
                $.ajax({
                    type:'GET',
                    url:'/ManagerOrderServlet',
                    data:{action:'viewOrderDetail', userId:userId },
                    dataType:'json',
                    contentType:'application/json',
                    success: function (result){
                        console.log(result);
                        for (let i = 0; i < result.length; i++) {
                            $('#tableOrderDetail').append('<tr><td>'+ result[i].productId+ '</td>'+
                                                              '<td>'+ result[i].orderId+'</td>'+
                                                              '<td>'+ result[i].salePrice+'</td>'+
                                                              '<td>'+ result[i].quantityProduct+'</td>'+
                                                              '<td>'+ result[i].productName+'</td></tr>');
                        }
                    }
                });
            });
        });
    </script>
</head>
<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/flaticon.css" type="text/css">
<link rel="stylesheet" href="css/barfiller.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<style>

</style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__cart">
        <div class="offcanvas__cart__links">
            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
            <a href="#"><img src="img/icon/heart.png" alt=""></a>
        </div>
        <div class="offcanvas__cart__item">
            <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="cart__price">Cart: <span>$0.00</span></div>
        </div>
    </div>
    <div class="offcanvas__logo">
        <a href="./index.html"><img src="img/logo.png" alt=""></a>
    </div>
    <div id="mobile-menu-wrap"></div>
    <div class="offcanvas__option">
        <ul>

            <li>USD <span class="arrow_carrot-down"></span>
                <ul>
                    <li>EUR</li>
                    <li>USD</li>
                </ul>
            </li>
            <li>ENG <span class="arrow_carrot-down"></span>
                <ul>
                    <li>Spanish</li>
                    <li>ENG</li>
                </ul>
            </li>
            <li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
        </ul>
    </div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="header__top__inner">
                        <div class="header__top__left">
                            <ul>
                                <li>USD <span class="arrow_carrot-down"></span>
                                    <ul>
                                        <li>EUR</li>
                                        <li>USD</li>
                                    </ul>
                                </li>
                                <li>ENG <span class="arrow_carrot-down"></span>
                                    <ul>
                                        <li>Spanish</li>
                                        <li>ENG</li>
                                    </ul>
                                </li>
                                <li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
                            </ul>
                        </div>
                        <div class="header__logo">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                        <div class="header__top__right">
                            <div class="header__top__right__links">
                                <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                                <a href="#"><img src="img/icon/heart.png" alt=""></a>
                            </div>
                            <div class="header__top__right__cart">
                                <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                                <div class="cart__price">Cart: <span>$0.00</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="./index.html">Home</a></li>
                        <li><a href="./about.html">About</a></li>
                        <li class="active"><a href="./shop.html">Shop</a></li>
                        <li><a href="#">Pages</a>
                            <ul class="dropdown">
                                <li><a href="./shop-details.html">Shop Details</a></li>
                                <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                <li><a href="./checkout.html">Check Out</a></li>
                                <li><a href="./wisslist.html">Wisslist</a></li>
                                <li><a href="./Class.html">Class</a></li>
                                <li><a href="./blog-details.html">Blog Details</a></li>
                            </ul>
                        </li>
                        <li><a href="./blog.html">Blog</a></li>
                        <li><a href="./contact.html">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- Header Section End -->

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="breadcrumb__text">
                    <h2>Quản lý đơn hàng 28:49 29:29</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shopping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Ngày đặt hàng</th>
                            <th colspan="2" style="text-align: center;">khách hàng</th>
                            <th>Chi tiết đơn hàng</th>
                            <th>Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items='${requestScope["listOrder"]}' var="order">
                        <tr>
                            <td class="product__cart__item">
                                <div class="product__cart__item__text">
                                    <h6>${order.orderId}</h6>
                                </div>
                            </td>

                            <td class="product__cart__item cart__close">
                                <div class="product__cart__item__text">
                                    <h6>${order.orderDate}</h6>
                                </div>
                            </td>
                            <td class="product__cart__item cart__close">
                                <div class="product__cart__item__text" style="padding-top:2px">
                                    <h6 style="padding-left: 130px">${order.userName}</h6>
                                </div>
                            </td>
                            <td class="product__cart__item cart__close">
                                <div class="product__cart__item__text" style="padding-top:2px">
                                    <button  style="height: 50px;width: 50px" type="button" class="btn btn-primary fa fa-bars viewUser" data-toggle="modal" data-target="#ModalUser">
                                    </button>
                                </div>
                            </td>
                            <td class="product__cart__item cart__close">
                                <div class="product__cart__item__text" style="padding-top:2px;padding-left: 50px">
                                    <button style="height: 50px;width: 50px" type="button" class="btn btn-primary fa fa-search viewOrderDetail" data-toggle="modal" data-target="#ModalOrderDetail">
                                    </button>
                                </div>
                            </td>
                            <c:if test = "${order.status == true}">
                                <td class="cart__close">
                                    <a href="/ManagerOrderServlet?action=editStatusOrder&orderId=${order.orderId}" style="height: 50px;background: blue;border: none;padding: 15px 10px;" type="button" class="btn btn-warning" disabled=""> <h5><b style="color: white">Đang giao hàng</b></h5></a>
                                </td>
                            </c:if>
                            <c:if test = "${order.status == false}">
                                <td class="cart__close">
                                    <a href="" style="height: 50px;background: green;border: none;padding: 15px 10px;" type="button" class="btn btn-warning" disabled="" ><h5><b style="color: white;">Đã giao hàng</b></h5></a>
                                </td>
                            </c:if>
                            <input type="hidden" name="userId" id="userIdtable" value="${order.userId}">
                            <input type="hidden" name="orderId" id="orderId" value="${order.orderId}">
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="continue__btn">
                            <a href="#">Continue Shopping</a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="continue__btn update__btn">
                            <a href="#"><i class="fa fa-spinner"></i> Update cart</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->

    <div class="modal fade" id="ModalUser" style="font-size:20px;">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header"  style="font-size:20px;" >
                    <h4 class="modal-title">Thông tin</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <label for="userIdd">Mã khách hàng:</label>
                    <input type="text" id="userIdd" disabled >
                    <label for="userName">Tên khách hàng:</label>
                    <input type="text" id="userName"  disabled>
                    <label for="phone">Số điện thoại:</label>
                    <input type="text" id="phone" disabled >
                    <label for="email"> Email:</label>
                    <input type="text" id="email" disabled >
                    <br>
                    <label for="address">Địa chỉ:</label>
                    <input type="text" id="address" disabled>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalOrderDetail" style="font-size:10px;">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header"  style="font-size:50px;" >
                    <h4 class="modal-title">Thông tin</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <table id="tableOrderDetail" style="border: 1px solid black; border-collapse: collapse;width: 100%;height: 100px;font-size: large">
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Mã đơn</th>
                            <th>Giá</th>
                            <th>Số lượng mua</th>
                            <th>Tên sản phẩm</th>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

<!-- Footer Section Begin -->
<footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>WORKING HOURS</h6>
                    <ul>
                        <li>Monday - Friday: 08:00 am – 08:30 pm</li>
                        <li>Saturday: 10:00 am – 16:30 pm</li>
                        <li>Sunday: 10:00 am – 16:30 pm</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="img/footer-logo.png" alt=""></a>
                    </div>
                    <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore dolore magna aliqua.</p>
                    <div class="footer__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-youtube-play"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__newslatter">
                    <h6>Subscribe</h6>
                    <p>Get latest updates and offers.</p>
                    <form action="#">
                        <input type="text" placeholder="Email">
                        <button type="submit"><i class="fa fa-send-o"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <p class="copyright__text text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
                <div class="col-lg-5">
                    <div class="copyright__widget">
                        <ul>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Site Map</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search End -->
<%--        private int userId;--%>
<%--        private String name;--%>
<%--        private String password;--%>
<%--        private String email;--%>
<%--        private String phone;--%>
<%--        private String address;--%>
<%--        private boolean roll;--%>

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.barfiller.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>
<%@ page import="com.cakemanager.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cakemanager.model.Category" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Le Minh Duc
  Date: 12/04/2021
  Time: 15:22
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
    <title>Cake | C1220G1</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

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
</head>

<body>
<%--<!-- Page Preloder -->--%>
<%--<div id="preloder">--%>
<%--    <div class="loader"></div>--%>
<%--</div>--%>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__cart">
        <div class="offcanvas__cart__links">
            <div class="shop__option__search">
                <form action="/search">
                    <input name="text" type="text" placeholder="T??m ki???m">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
            <%--      <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>--%>
            <%--      <a href="#"><img src="img/icon/heart.png" alt=""></a>--%>
        </div>
        <div class="offcanvas__cart__item">
            <c:if test="${sessionScope.account != null}">
                <a href="/CartServlet?userId=${account.getUserId()}"><img src="img/icon/cart.png" alt="">
                    <span>${count}</span>
                    <div class="cart__price">Gi??? h??ng</div>
                </a>
            </c:if>
            <c:if test="${sessionScope.account == null}">
                <a href="login.jsp"><img src="img/icon/cart.png" alt=""> <span>C</span>
                    <div class="cart__price">Gi??? h??ng</div>
                </a>
            </c:if>
            <%--      <a href="/CartServlet?userId=${account.getUserId()}"><img src="img/icon/cart.png" alt=""> <span>C</span>--%>
            <%--      <div class="cart__price">Gi??? h??ng</div>--%>
            <%--      </a>--%>
        </div>
    </div>
    <div class="offcanvas__logo">
        <a href="index"><img src="img/logo.png" alt=""></a>
    </div>
    <div id="mobile-menu-wrap"></div>
    <div class="offcanvas__option">
        <ul>
            <li><a href="./login.jsp">????ng nh???p</a> <span class="arrow_carrot-down"></span></li>
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
                        <div class="header__top__left ">
                            <ul>
                                <c:if test="${sessionScope.account.roll}">
                                    <li><a href="/ManagerProductServlet"><b>QL S???n ph???m</b></a></li>
                                    <li><a href="/ManagerOrderServlet"><b>QL ????n h??ng</b></a></li>
                                </c:if>
                                <c:if test="${sessionScope.account != null}">
                                    <li><a href="#"><b>Xin ch??o ${sessionScope.account.name}</b></a></li>
                                    <li><a href="/LogoutServlet">????ng xu???t</a> <span class="arrow_carrot-down"></span>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.account == null}">
                                    <li><a href="login.jsp">????ng nh???p</a> <span class="arrow_carrot-down"></span></li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="header__logo">
                            <a href="index"><img src="img/logo.png" alt=""></a>
                        </div>
                        <div class="header__top__right">
                            <div class="header__top__right__links">
                                <div class="shop__option__search">

                                    <form action="/search">
                                        <input name="text" type="text" placeholder="T??m ki???m">
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </form>

                                </div>
                                <%--                <a href="#"><img src="img/icon/heart.png" alt=""></a>--%>
                            </div>
                            <div class="header__top__right__cart">
                                <c:if test="${sessionScope.account != null}">
                                    <a href="/CartServlet?userId=${account.getUserId()}"><img src="img/icon/cart.png"
                                                                                              alt="">
                                        <span>${count}</span>
                                        <div class="cart__price">Gi??? h??ng</div>
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.account == null}">
                                    <a href="login.jsp"><img src="img/icon/cart.png" alt=""> <span>C</span>
                                        <div class="cart__price">Gi??? h??ng</div>
                                    </a>
                                </c:if>
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
                        <li class="active"><a href="index">Trang ch???</a></li>
                        <li><a href="AboutServlet">Gi???i thi???u</a></li>
                        <li><a href="shop">C???a h??ng</a></li>
                        <li><a href="blog">Blog</a></li>
                        <li><a href="ContactServlet">Li??n h???</a></li>
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
                    <h2>S???n ph???m</h2>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="breadcrumb__links">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <% String actionInsertOrUpdate = request.getAttribute("actionInsertOrUpdate").toString();
                Product product = null;
                if(actionInsertOrUpdate.equals("actionInsert")){
                    product = new Product(0,"",0,0,"","",1,new Category(1,null));
                }else{
                    product = (Product) request.getAttribute("product");
                }
                %>
                    <form action="/ManagerProductServlet?action=<%=actionInsertOrUpdate%>" onsubmit="alert('Thao t??c th??nh c??ng')" method="post">
                        <div class="row">
                            <div class="col-lg-11 col-md-11">
                                <h6 class="checkout__title">Th??ng tin s???n ph???m</h6>
                                <div class="checkout__input">
                                    <p>T??n<span>*</span></p>
                                    <input  name="name" type="text" required="" maxlength="30" value="<%=product.getName()%>">
                                    <input name="productId" type="hidden"  value="<%=product.getProductId()%>">
                                </div>
                                <div class="row">
                                    <div class="col-l-g6">
                                        <div style="margin-left: 28px" class="checkout__input">
                                            <p>Gi??<span>*</span></p>
                                            <input type="number" id="price" name="price" min="1" max="500000" value="<%=product.getUnitPrice()%>">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>S??? l?????ng<span>*</span></p>
                                            <input type="number" id="quantity" name="quantity" min="1" max="100" value="<%=product.getQuantityStock()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="checkout__input">
                                    <p>M?? t???<span>*</span></p>
                                    <textarea rows="4" cols="50" maxlength="1000" name="description" value="" name="description"><%=product.getProductDescription()%></textarea>
                                </div>
                                <div class="checkout__input">
                                    <p>???????ng d???n ???nh<span>*</span></p>
                                    <input type="text" maxlength="100" name="thumbnail" value="<%=product.getThumbnail()%>">
                                </div>
                                <div class="checkout__input">
                                    <p>Danh m???c s???n ph???m<span>*</span></p>
                                    <select name="category">
                                        <%if(product.getCategory().getName()!=null){
                                            %>
                                                <option value="<%=product.getCategoryId()%>" name="" selected><%=product.getCategory().getName()%></option>
                                            <%;
                                        }
                                        %>
                                        <c:forEach items="${listCategory}" var="category">
                                            <option value="${category.categoryId}" name="">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="row" style="margin-top:50px">
                                    <div class="col-lg-4">

                                    </div>
                                    <div class="col-lg-4">
                                        <div class="checkout__input">
                                            <a class="primary-btn" href="/ManagerProductServlet" style="width: 100%;text-align: center;">Hu???</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="checkout__input">
                                            <input class="primary-btn" style="border: none;" type="submit" value="X??c nh???n">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                <%;
            %>

        </div>
    </div>
</section>
<!-- Checkout Section End -->

<!-- Footer Section Begin -->
<footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>GI??? L??M VI???C</h6>
                    <ul>
                        <li>Th??? 2 - Th??? 6: 08:00 am ??? 08:30 pm</li>
                        <li>Th??? 7: 10:00 am ??? 16:30 pm</li>
                        <li>Ch??? nh???t: 10:00 am ??? 16:30 pm</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="img/footer-logo.png" alt=""></a>
                    </div>
                    <p>"Cake Shop" l?? m???t Th????ng hi???u c???a Jordan, kh???i ?????u l?? m???t doanh nghi???p gia ????nh nh???.
                        Ch??? s??? h???u l?? Ti???n s?? Iyad Sultan v?? Ti???n s?? Sereen Sharabati, ???????c h??? tr??? b???i ?????i ng?? 80 nh??n
                        vi??n.</p>
                    <div class="footer__social">
                        <a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
                        <a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
                        <a href="https://www.youtube.com/"><i class="fa fa-youtube-play"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__newslatter">
                    <h6>????ng k??</h6>
                    <p>Nh???n c??c b???n c???p nh???t v?? ??u ????i m???i nh???t.</p>
                    <form action="ContactServlet?action=sendEmail" method="post"
                          onsubmit="alert('G???i th??ng tin th??nh c??ng!')">
                        <input type="email" placeholder="?????a ch??? Email" name="email"
                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                        <button type="submit"><i class="fa fa-send-o"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="copyright__text text-white" style="text-align: center">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                        | This website is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
                            href="https://oidayroi.com" target="_blank">C1220G1</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
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

package com.cakemanager.controller;

import com.cakemanager.model.Cart;
import com.cakemanager.model.OrderDetails;
import com.cakemanager.model.Orders;
import com.cakemanager.model.Product;
import com.cakemanager.service.CheckoutService;
import com.cakemanager.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckoutServlet", value = "/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    private CheckoutService checkoutService;
    private int orderId;

    public void init() {
        checkoutService = new CheckoutService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
//                case "update":
//                    updateCart(request, response);
//                    break;
            default:
                viewCheckout(request, response);
                break;
        }
    }

    private void viewCheckout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        List<Cart> carts = checkoutService.selectCart(userId);

        request.setAttribute("carts", carts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
                case "insertOrder":
                    insertOrder(request, response);
                    break;
        }
    }

    private void insertOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        Orders order = new Orders(userId);

        checkoutService.insertOrder(order);

        List<Orders> orders = checkoutService.selectOrder(userId);
        int orderId = orders.get(orders.size()-1).getOrderId();
        System.out.println(orderId);
        insertOrderDetail(request, response, orderId);
    }

    private void insertOrderDetail(HttpServletRequest request, HttpServletResponse response, int orderId) throws IOException {
//        this.orderId = orderId;
        System.out.println(orderId);
        int userId = Integer.parseInt(request.getParameter("userId"));

        List<Cart> carts = checkoutService.selectCart(userId);
        ProductService productService = new ProductService();
        Product product;
        int quantityStock;

        for (int i=0; i<carts.size(); i++) {
            String productName = carts.get(i).getProductName();
            int productId = carts.get(i).getProductId();
            //orderId = this.orderId;
            float salePrice = carts.get(i).getProductPrice();
            int quantityProduct = carts.get(i).getQuantity();

            OrderDetails orderDetails = new OrderDetails(productId, productName, orderId, salePrice, quantityProduct);
            checkoutService.insertOrderDetail(orderDetails);

            product = productService.selectProductById(productId);
            quantityStock = product.getQuantityStock() - quantityProduct;
            checkoutService.updateQuantityStock(quantityStock, productId);
        }

        response.sendRedirect("index");
    }
}

package com.cakemanager.controller;

import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.IndexService;
import com.cakemanager.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShopServlet", value = "/shop")
public class ShopServlet extends HttpServlet {
    ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listProduct = productService.selectAllProducts();
        List<Category> listCategory = productService.selectAllCategory();


        IndexService indexService = new IndexService();
        Category category = null;
        for (Product product: listProduct) {
            category = indexService.selectCategoryByProductId(product.getProductId());
        }
        request.setAttribute("category", category);


        request.setAttribute("listP", listProduct);
        request.setAttribute("listC", listCategory);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop.jsp");
        dispatcher.forward(request, response);

//        IndexService indexService = new IndexService();
//        List<Product> products = indexService.selectAllProducts();
//
//        ategory category = null;
////        for (Product product: products) {
////            category = indexService.selectCategoryByProductId(product.getProductId());
////        }C
//
//        request.setAttribute("products", products);
//        request.setAttribute("category", category);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("shop.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

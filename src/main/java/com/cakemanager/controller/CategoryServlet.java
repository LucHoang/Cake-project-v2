package com.cakemanager.controller;

import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.IndexService;
import com.cakemanager.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@WebServlet(name = "CategoryServlet", value = "/category")
public class CategoryServlet extends HttpServlet {
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("categoryId");
        List<Product> list = productService.getAllProductByCateId(categoryId);
        List<Category> listCategory = productService.selectAllCategory();

        IndexService indexService = new IndexService();
        Map<Integer, String> category = new HashMap<>();
        for (Product product: list) {
            category.put(product.getProductId(), indexService.selectCategoryByProductId(product.getProductId()).getName());
        }
        request.setAttribute("category", category);

        request.setAttribute("listP", list);
        request.setAttribute("listC", listCategory);
        request.setAttribute("tag", categoryId);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String categoryId = request.getParameter("categoryId");
        List<Product> list = productService.getAllProductByCateId(categoryId);
        List<Category> listCategory = productService.selectAllCategory();

        IndexService indexService = new IndexService();
        Map<Integer, String> category = new HashMap<>();
        for (Product product: list) {
            category.put(product.getProductId(), indexService.selectCategoryByProductId(product.getProductId()).getName());
        }
        request.setAttribute("category", category);

        request.setAttribute("listP", list);
        request.setAttribute("listC", listCategory);
        request.setAttribute("tag", categoryId);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}

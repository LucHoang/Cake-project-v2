package com.cakemanager.controller;

import com.cakemanager.model.Blog;
import com.cakemanager.model.BlogCategory;
import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.BlogService;
import com.cakemanager.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogServlet", value = "/blog")
public class BlogServlet extends HttpServlet {
    BlogService blogService = new BlogService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Blog> latestBlogTop4ById = blogService.selectLatestBlogTop4ById();
        List<Blog> blogList = blogService.selectAllBlogs();
        List<BlogCategory> blogC = blogService.selectAllBlogCate();

        request.setAttribute("latestBlogTop4ById", latestBlogTop4ById);
        request.setAttribute("blogList", blogList);
        request.setAttribute("blogC", blogC);
        request.getRequestDispatcher("blog.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}

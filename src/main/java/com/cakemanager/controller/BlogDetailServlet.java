package com.cakemanager.controller;

import com.cakemanager.model.Blog;
import com.cakemanager.model.BlogCategory;
import com.cakemanager.model.Category;
import com.cakemanager.model.Product;
import com.cakemanager.service.BlogService;
import com.cakemanager.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogDetailServlet", value = "/blogDetail")
public class BlogDetailServlet extends HttpServlet {
    private BlogService blogService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
//                case "edit":
////                showEditForm(request, response);
//                    break;
//                case "delete":
//                    deleteCart(request, response);
//                    break;
            case "view":
                viewBlog(request, response);
                break;
//            case "insert":
//                try {
//                    insertCart(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                break;
//                case "update":
//                    updateCart(request, response);
//                    break;
            default:
                viewBlog(request, response);
                break;
        }
    }

    private void viewBlog(HttpServletRequest request, HttpServletResponse response) {
        int blogId = Integer.parseInt(request.getParameter("id"));
        Blog blog = blogService.selectBlogById(blogId);


        int blogCateId = Integer.parseInt(request.getParameter("blogCateId"));
        List<Blog> blogList = blogService.selectBlogsByCId(blogCateId);

        BlogCategory bCate = blogService.selectBCateByBId(blogId);

        RequestDispatcher dispatcher;

        if (blog == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("blog", blog);
            request.setAttribute("blogList", blogList);
            request.setAttribute("bCate", bCate);
            dispatcher = request.getRequestDispatcher("blog-details.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}

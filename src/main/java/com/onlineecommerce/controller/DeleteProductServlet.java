package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.ProductDAO;
import com.onlineecommerce.model.Seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/seller/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Seller seller = (Seller) session.getAttribute("loggedSeller");

        if (seller == null) {
            response.sendRedirect("../seller/login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("id"));

        ProductDAO dao = new ProductDAO();

        dao.deleteProduct(productId, seller.getSellerId());

        response.sendRedirect("../seller/products.jsp");
    }
}
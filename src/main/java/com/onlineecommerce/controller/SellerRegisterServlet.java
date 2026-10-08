package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.SellerDAO;
import com.onlineecommerce.model.Seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/seller/register")
public class SellerRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Seller seller = new Seller();

        seller.setName(request.getParameter("name"));
        seller.setEmail(request.getParameter("email"));
        seller.setPassword(request.getParameter("password"));
        seller.setPhone(request.getParameter("phone"));
        seller.setBusinessName(request.getParameter("businessName"));

        SellerDAO dao = new SellerDAO();

        if (dao.registerSeller(seller)) {

            response.sendRedirect("../seller/login.jsp");

        } else {

            response.getWriter().println("<h2>Seller Registration Failed</h2>");

        }
    }
}
package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteSeller")
public class DeleteSellerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int sellerId = Integer.parseInt(request.getParameter("sellerId"));

        AdminDAO dao = new AdminDAO();

        dao.deleteSeller(sellerId);

        response.sendRedirect("admin/viewSellers.jsp");

    }
}
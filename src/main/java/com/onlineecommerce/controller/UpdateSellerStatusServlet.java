package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateSellerStatus")
public class UpdateSellerStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int sellerId = Integer.parseInt(request.getParameter("sellerId"));

        String status = request.getParameter("status");

        AdminDAO dao = new AdminDAO();

        dao.updateSellerStatus(sellerId, status);

        response.sendRedirect("admin/viewSellers.jsp");

    }

}
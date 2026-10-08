package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.SellerDAO;
import com.onlineecommerce.model.Seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/seller/login")
public class SellerLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        SellerDAO dao = new SellerDAO();

        Seller seller = dao.loginSeller(email, password);

        if (seller == null) {

    response.getWriter().println("<h2>Invalid Email or Password</h2>");
    return;

}

if ("PENDING".equals(seller.getStatus())) {

    response.getWriter().println("<h2>Your seller account is awaiting admin approval.</h2>");
    return;

}

if ("REJECTED".equals(seller.getStatus())) {

    response.getWriter().println("<h2>Your seller account has been rejected by the administrator.</h2>");
    return;

}

HttpSession session = request.getSession();

session.setAttribute("loggedSeller", seller);

response.sendRedirect(request.getContextPath() + "/seller/dashboard.jsp");

    }

}
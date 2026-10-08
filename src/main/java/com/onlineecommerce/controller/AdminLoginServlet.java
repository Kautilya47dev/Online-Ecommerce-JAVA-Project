package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.AdminDAO;
import com.onlineecommerce.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();

        Admin admin = dao.loginAdmin(email, password);

        if (admin != null) {

            HttpSession session = request.getSession();

            session.setAttribute("loggedAdmin", admin);

            response.sendRedirect("../admin/dashboard.jsp");

        } else {

            response.getWriter().println("<h2>Invalid Admin Credentials</h2>");

        }

    }
}
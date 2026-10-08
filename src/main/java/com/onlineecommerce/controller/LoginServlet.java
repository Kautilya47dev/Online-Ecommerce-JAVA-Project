package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.UserDAO;
import com.onlineecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        User user = dao.loginUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("loggedUser", user);

           response.sendRedirect(request.getContextPath() + "/user/dashboard.jsp");

        } else {

            response.getWriter().println("<h2>Invalid Email or Password</h2>");

        }
    }
}
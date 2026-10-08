package com.onlineecommerce.controller;

import java.io.IOException;

import com.onlineecommerce.dao.CartDAO;
import com.onlineecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");

        if(user == null){

            response.sendRedirect("user/login.jsp");
            return;

        }

        int productId = Integer.parseInt(request.getParameter("productId"));

        CartDAO dao = new CartDAO();

        int cartId = dao.getCartId(user.getUserId());

        dao.removeItem(cartId, productId);

        response.sendRedirect("cart.jsp");

    }

}
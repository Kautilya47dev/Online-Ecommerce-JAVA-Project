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

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {

            response.sendRedirect("user/login.jsp");
            return;

        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if(quantity < 1){
            quantity = 1;
        }

        CartDAO dao = new CartDAO();

        int cartId = dao.getCartId(user.getUserId());

        dao.updateQuantity(cartId, productId, quantity);

        response.sendRedirect("cart.jsp");

    }

}
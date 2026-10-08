package com.onlineecommerce.controller;

import java.io.IOException;
import java.util.List;

import com.onlineecommerce.dao.CartDAO;
import com.onlineecommerce.dao.OrderDAO;
import com.onlineecommerce.model.CartItem;
import com.onlineecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

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

        CartDAO cartDAO = new CartDAO();

        int cartId = cartDAO.getCartId(user.getUserId());

        List<CartItem> cartItems = cartDAO.getCartItems(cartId);

        if (cartItems.isEmpty()) {

            response.sendRedirect("cart.jsp");
            return;

        }

        OrderDAO orderDAO = new OrderDAO();

        int orderId = orderDAO.placeOrder(user.getUserId(), cartItems);

        if (orderId != -1) {

            response.sendRedirect("orderSuccess.jsp?orderId=" + orderId);

        } else {

            response.sendRedirect("cart.jsp");

        }

    }

}
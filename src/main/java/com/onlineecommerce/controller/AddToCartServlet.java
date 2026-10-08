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

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current session
        HttpSession session = request.getSession();

        // Get logged-in user
        User user = (User) session.getAttribute("loggedUser");

        // If user is not logged in
        if (user == null) {
            response.sendRedirect(
                request.getContextPath() + "/user/login.jsp"
            );
            return;
        }

        // Get product ID
        String productIdParam = request.getParameter("productId");

        // Check whether productId was provided
        if (productIdParam == null || productIdParam.trim().isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/products.jsp"
            );
            return;
        }

        int productId;

        try {
            productId = Integer.parseInt(productIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(
                request.getContextPath() + "/products.jsp"
            );
            return;
        }

        // Create DAO
        CartDAO dao = new CartDAO();

        // Find existing cart
        int cartId = dao.getCartId(user.getUserId());

        // Create cart if it doesn't exist
        if (cartId == -1) {
            cartId = dao.createCart(user.getUserId());
        }

        // Add product to cart
        System.out.println("Cart ID = " + cartId);
System.out.println("Product ID = " + productId);
        dao.addToCart(cartId, productId);

        // Redirect to cart
        response.sendRedirect(
            request.getContextPath() + "/cart.jsp"
        );
    }
}
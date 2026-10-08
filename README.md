# Online E-Commerce Platform

## Project Overview

The Online E-Commerce Platform is a Java Web Application developed using the MVC (Model-View-Controller) architecture. It provides separate portals for Users, Sellers, and Administrators to manage online shopping activities efficiently.

---

## Technologies Used

- Java
- JSP (JavaServer Pages)
- Servlets
- JDBC
- MySQL
- Apache Tomcat
- Maven
- Bootstrap 5

---

## Project Features

### User Module

- User Registration
- User Login
- Browse Products
- View Product Details
- Add Products to Cart
- View Shopping Cart
- User Profile
- Logout

### Seller Module

- Seller Registration
- Seller Login
- Seller Dashboard
- Add Products
- View Products
- Logout

### Admin Module

- Admin Login
- Admin Dashboard
- Approve Seller Accounts

---

## Project Architecture

The project follows the MVC Architecture.

```
Browser
    │
    ▼
JSP Pages
    │
    ▼
Servlets (Controller)
    │
    ▼
DAO Layer
    │
    ▼
JDBC
    │
    ▼
MySQL Database
```

---

## Database Tables

- admins
- users
- sellers
- products
- cart
- cart_items

---

## Project Structure

```
online-ecommerce
│
├── src
├── database
├── presentation
├── screenshots
├── pom.xml
├── README.md
└── .gitignore
```

---

## How to Run

1. Install Java JDK.
2. Install Apache Tomcat.
3. Install MySQL.
4. Import the SQL file from the `database` folder.
5. Open the project in VS Code.
6. Run:

```
mvn clean package
```

7. Deploy the generated WAR file to Apache Tomcat.
8. Open:

```
http://localhost:8081/online-ecommerce/
```

---

## Screenshots

Project screenshots are available in the **screenshots** folder.

---

## Presentation

The project presentation is available in the **presentation** folder.

---

## Database

The complete MySQL database is available in the **database** folder.

---

## Developer

**Kautilya 25SCSE1180001**
**Jeetu Sharma 25SCSE1410064**
**Lalit Kumar 25SCSE1410125**

B.Tech Computer Science & Engineering (AI/ML)

Galgotias University
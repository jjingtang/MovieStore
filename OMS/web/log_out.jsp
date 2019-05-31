<%-- 
    Document   : log_out
    Created on : May 18, 2019, 10:28:43 PM
    Author     : sadkmalk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        session.invalidate();
    %>
    <body>
        <h1>Logged out</h1>
        <a href="index.jsp"> Return to Home Page </a>
    </body>
</html>

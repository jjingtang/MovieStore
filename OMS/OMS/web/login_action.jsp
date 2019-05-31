<%-- 
    Document   : login_action.jsp
    Created on : May 18, 2019, 10:34:41 PM
    Author     : sadkmalk
--%>

<%@page import="oms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged In!</title>
    </head>
    
    <%
        String email = "user";
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name"); 
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        
        //This makes a new user instance to test stuff
        //Its meant to check the db if the user exists
        User u = new User(email, firstName, lastName, phone, password);
        session.setAttribute("userLogin",u);
        
    %>
    
    <body>
        <h1>Logged in.</h1>
        
        <a href="index.jsp">Return to Home Page.</a>
    </body>
</html>

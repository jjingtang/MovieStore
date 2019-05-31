<%-- 
    Document   : welcome_page
    Created on : May 17, 2019, 11:01:27 PM
    Author     : sadkmalk
--%>


<%@page import="oms.model.dao.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="oms.model.User" import="oms.controller.*" import="oms.model.dao.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <%    
            DBManager manager = (DBManager)session.getAttribute("manager");
            String email = request.getParameter("email");
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name"); 
            String password = request.getParameter("password");
            String cPassword = request.getParameter("confirm_password");
            String phone = request.getParameter("phone");
            
            if (firstName != null && lastName != null && password != null && phone != null && email != null){
          %>
                      <title>Welcome <%=firstName%>!</title>
            <%} else {%>
                      <title>Something went wrong...</title>
            <%}%>
    </head>
    <body class="bg-light">
        
        <!-- Nav Bar -->
          <div class="container-fluid">
            <div class="row bg-dark pt-4 pb-4">
                <div class="col-md-4">
                    <a class="btn px-4 ml-5 btn-lg btn-outline-light" href="index.jsp">Home</a>
                    <a class="btn px-4 btn-lg btn-outline-light ml-4" href="#">Cart</a>
                </div>
                <div class="col-md-4 text-center">
                    <h1 class="text-danger">Movie Store</h1>
                </div>
                <div class="col-md-4 mt-2">
                    <form class="text-center form-inline float-right mr-5">
                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">                        
                        <button class="btn btn-outline-light ml-4" type="submit">Search</button></span>
                    </form>
                </div>
            </div>
               </div>
        
        <%if (firstName == null || lastName == null || password == null || phone == null || email == null){%>
        
                <div class="container mt-5">
                  
                  <!-- Welcome Header --> 
              <div class="row border-bottom border-dark pb-4 pt-5">
                  <div class="col-md-12 text-center">
                      <span class="text-dark display-3">Something went wrong!</span>
                  </div>
                  </div>   
                   
             <div class="row py-3 bg-danger mt-1">
                 <div class="col-md-12 h1 text-center text-light">You must fill out all fields to make an account!</div>
                        </div>
                   <div class="row mt-5 p-5">
                   <div class="col-md-12">
                       <a class="btn btn-lg btn-dark" href="register.jsp">Go Back</a>
                   </div>
           </div>
              </div>
          
        
        <%}else{%>
          <%
                if (password.equals(cPassword)){
                    User u = new User(email, firstName, lastName, phone, password);
                    manager.addUser(email, firstName, lastName, phone, password);
                    session.setAttribute("userLogin",u);
        %> 
              
              <div class="container mt-5">
                  
                  <!-- Welcome Header --> 
              <div class="row border-bottom border-dark pb-4 pt-5">
                  <div class="col-md-12 text-center">
                      <span class="text-dark display-3">Welcome <%=firstName%> <%=lastName%>!</span>
                  </div>
                  </div>
                  
                  <!-- Email and Phone details --> 
                  <div class="row mt-5 pl-2">
                  <div class="col-md-4 mt-5">
                      <span class="h2 pl-5 ml-5 text-dark">Email :</span>
                  </div>
                      <div class="col-md-8 mt-5 text-dark">
                          <span class="h2 text-dark"><%=u.getEmail()%></span>
                      </div>
                  </div>                 
                     <div class="row pl-2">
                  <div class="col-md-4 mt-5">
                      <span class="h2 pl-5 ml-5 text-dark">Phone :</span>
                  </div>
                         <div class="col-md-8 mt-5">
                          <span class="h2 text-dark"><%=u.getPhone()%></span>
                      </div>
                  </div>
                      
                  <!-- Buttons -->
                  <div class="row m-5 pt-5">
                      <div class="col-md-4 pt-5 text-center">
                          <span><a class="btn btn-lg btn-danger py-3" href="index.jsp">Find Movies</a></span>
                      </div>
                      <div class="col-md-4 pt-5 text-center">
                          <span><a class="btn btn-lg btn-danger py-3" href="update_payment.jsp">Add Payment Method</a></span>
                      </div>
                      <div class="col-md-4 pt-5 text-center">
                          <span><a class="btn btn-lg btn-danger py-3" href="account.jsp">View Profile</a></span>
                      </div>
                  </div>
              </div>
 
          
          <%        } else {%>
          
                  <div class="container mt-5">
                  
                  <!-- Welcome Header --> 
              <div class="row border-bottom border-dark pb-4 pt-5">
                  <div class="col-md-12 text-center">
                      <span class="text-dark display-3">Something went wrong!</span>
                  </div>
                  </div>   
                   
             <div class="row py-3 bg-danger mt-1">
                 <div class="col-md-12 h1 text-center text-light">Passwords didn't match!</div>
                        </div>
                   <div class="row mt-5 p-5">
                   <div class="col-md-12">
                       <a class="btn btn-lg btn-dark" href="register.jsp">Go Back</a>
                   </div>
           </div>
              </div>
          
            <%    }}%>
        
    </body>
</html>

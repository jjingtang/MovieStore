<%-- 
    Document   : update_account
    Created on : May 18, 2019, 10:16:32 PM
    Author     : sadkmalk
--%>

<%@page import="oms.model.dao.DBManager"%>
<%@page import="oms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Update Details</title>
    </head>   
     
     <% 
            User u = (User)session.getAttribute("userLogin");
            String newEmail = request.getParameter("email");
            String newPassword = request.getParameter("password");
            String newCPassword = request.getParameter("confirm_password");
            String newPhone = request.getParameter("phone");
            String currentEmail = u.getEmail();
            
     %>
    <body>
          <!-- Nav Bar -->
          <div class="container-fluid">
            <div class="row bg-dark pt-4 pb-4">
                <div class="col-md-4">
                    <a class="btn px-4 ml-5 btn-lg btn-outline-light" href="index.jsp">Home</a>
                    <a class="btn px-4 btn-lg btn-outline-light ml-4" href="log_out.jsp">Log Out</a>
                </div>
                <div class="col-md-4 text-center">
                    <h1 class="text-danger">Movie Store</h1>
                </div>
                <div class="col-md-4 mt-2">
                    <form class="text-center form-inline float-right mr-5">
                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">                        
                        <button class="btn btn-outline-light ml-4" type="submit">Search</button></span>
                        <a class="btn btn-outline-light ml-4" href="#">Cart</a>
                    </form>
                </div>
            </div>
               </div>
          <%if (u.confirmPassword(newPassword, newCPassword)) {%>
          <%
            u.updateDetails(newEmail, newPhone, newPassword);
            DBManager manager = (DBManager)session.getAttribute("manager");
            manager.updateUser(currentEmail , u.getEmail(), u.getPhone(), u.getPassword());            
          %>          
           <!-- Update Details -->      
         <div class="container my-5">
              <div class="row border-bottom border-dark pb-4 pt-5 pl-4">
                  <div class="col-md-12">
                      <span class="text-dark h1">Update Account</span>
                  </div>
                  </div>
             <div class="row py-3 bg-success mt-1">
                 <div class="col-md-12 h1 text-center text-light">Details Updated!</div>
                        </div>
          
               <div class="row mt-5 p-5">
                   <div class="col-md-12">
                       <a class="btn btn-lg btn-dark" href="account.jsp">Return to Profile</a>
                   </div>
           </div>
             
                    </div>
           <%} else {%>
                <div class="container my-5">
              <div class="row border-bottom border-dark pb-4 pt-5 pl-4">
                  <div class="col-md-12">
                      <span class="text-dark h1">Update Details</span>
                  </div>
                  </div>
             
             <div class="row py-3 bg-danger mt-1">
                 <div class="col-md-12 h1 text-center text-light">Passwords didn't match!</div>
                        </div>
          
               <div class="row mt-5 p-5">
                   <div class="col-md-12">
                       <a class="btn btn-lg btn-dark" href="update_account.jsp">Go Back</a>
                   </div>
           </div>
             
                    </div>
                <%}%>
          
          
    </body>
</html>

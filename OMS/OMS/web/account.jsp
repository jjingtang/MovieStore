<%-- 
    Document   : account
    Created on : May 17, 2019, 10:58:50 PM
    Author     : sadkmalk
--%>

<%@page import="oms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>My Account</title>
    </head>
    
     <% 
            User u = (User)session.getAttribute("userLogin");
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
        
         <!-- My Account -->      
         <div class="container my-5">
              <div class="row border-bottom border-dark pb-4 pt-5 pl-4">
                  <div class="col-md-12">
                      <span class="text-dark h1">My Account</span>
                  </div>
                  </div>
             
             
             <!-- Personal Details -->
             <div class="row mt-5 pl-2">
                  <div class="col-md-4 mt-3">
                      <span class="h2 pl-5 ml-5 text-danger">Details :</span>
                  </div>
                  </div>
                  <div class="row mt-5 pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Email :</span>
                  </div>
                      <div class="col-md-6 mt-3 text-dark">
                          <span class="h2 text-dark"><%=u.getEmail()%></span>
                      </div>
                  </div>
                  
                     <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Full Name :</span>
                  </div>
                         <div class="col-md-6 mt-3">
                          <span class="h2 text-dark"><%=u.getFirstName()%> <%=u.getLastName()%></span>
                      </div>
                  </div>
                      
                  <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Phone :</span>
                  </div>
                  <div class="col-md-5 mt-3">
                          <span class="h2 text-dark"><%=u.getPhone()%></span>
                      </div>
                  </div>
                      
                    <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Password :</span>
                  </div>
                  <div class="col-md-6 mt-3">
                          <label class="h2 text-dark"><%=u.printHiddenPass()%></label>
                      </div>
                  </div>
                  
                  <!-- Update Details  -->
                  <div class="row pl-2">
                  <div class="col-md-12 mt-5">
                      <span class="pl-5 ml-5"><a class="btn btn-lg btn-dark" href="update_account.jsp">Update Details</a></span>
                  </div>
                  </div> 
                      
               <!-- Payment Details -->
                <div class="row pl-2">
                  <div class="col-md-6 mt-5 pt-2">
                      <span class="h2 pl-5 ml-5 text-danger">Payment : </span>
                  </div>
                  </div>
               
               <!-- Checks if payment exists in User Instance  -->
               <%if (u.isPaymentAdded()) {%>
                      <div class="row pl-2">
                  <div class="col-md-6 mt-5">
                      <span class="h2 pl-5 ml-5 text-dark">Card Type: </span>
                  </div>
                  <div class="col-md-6 mt-5">
                          <span class="h2 text-dark"><%=u.getCardType()%></span>
                      </div>
                  </div>
                  <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Card Number / CVV : </span>
                  </div>
                  <div class="col-md-6 mt-3">
                          <span class="h2 text-dark"><%=u.getCardNumber()%> / <%=u.getCardCvv()%></span>
                      </div>
                  </div>
                  <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Cardholder name: </span>
                  </div>
                  <div class="col-md-6 mt-3">
                          <span class="h2 text-dark"><%=u.getCardholderName()%></span>
                      </div>
                  </div>    
               
                <!-- Update Payment  -->
                  <div class="row pl-2">
                  <div class="col-md-12 mt-5">
                      <span class="pl-5 ml-5"><a class="btn btn-lg btn-dark" href="update_payment.jsp">Update Payment</a></span>
                  </div>
                  </div> 
                
                
                <%} else { %>                        
                <!-- Add Payment  -->
                  <div class="row pl-2">
                  <div class="col-md-12 mt-5">
                      <span class="pl-5 ml-5"><a class="btn btn-lg btn-dark" href="update_payment.jsp">Add Payment</a></span>
                  </div>
                  </div>
                
                <%}%>
                
                  <div class="row pl-2">
                  <div class="col-md-6 mt-5 pt-2">
                      <span class="h2 pl-5 ml-5 text-danger">Shipping : </span>
                  </div>
                  </div>
                <%if(u.isShippingAdded()){%>
               <div class="row pl-2">
                  <div class="col-md-6 mt-5">
                      <span class="h2 pl-5 ml-5 text-dark">Street : </span>
                  </div>
                  <div class="col-md-6 mt-5">
                          <span class="h2 text-dark"><%=u.getStreet()%></span>
                      </div>
                  </div>
                  <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Suburb : </span>
                  </div>
                  <div class="col-md-6 mt-3">
                          <span class="h2 text-dark"><%=u.getSuburb()%></span>
                      </div>
                  </div>
                  <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">City :</span>
                  </div>
                  <div class="col-md-6 mt-3">
                          <span class="h2 text-dark"><%=u.getCity()%></span>
                      </div>
                  </div>
                   <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Country :</span>
                  </div>
                  <div class="col-md-6 mt-3">
                          <span class="h2 text-dark"><%=u.getCountry()%></span>
                      </div>
                  </div> 
                   <div class="row pl-2">
                  <div class="col-md-6 mt-3">
                      <span class="h2 pl-5 ml-5 text-dark">Post Code :</span>
                  </div>
                  <div class="col-md-6 mt-3">
                          <span class="h2 text-dark"><%=u.getPostCode()%></span>
                      </div>
                  </div> 
                          <!-- Add Shipping  -->
                  <div class="row pl-2 mb-5">
                  <div class="col-md-12 mt-5">
                      <span class="pl-5 ml-5"><a class="btn btn-lg btn-dark" href="update_shipping.jsp">Update Shipping</a></span>
                  </div>
                  </div> 
                      <%} else { %>                     
                  <!-- Add Shipping  -->
                  <div class="row pl-2 mb-5">
                  <div class="col-md-12 mt-5">
                      <span class="pl-5 ml-5"><a class="btn btn-lg btn-dark" href="update_shipping.jsp">Update Shipping</a></span>
                  </div>
                  </div>                     
                      <%}%>
                <!-- Delete Account -->
                <div class='row'>
                    <div class='col-md-12 mt-5'>
                         <a class='btn btn-lg btn-secondary text-light float-right' href="delete_account.jsp" onclick="return confirm('Are you sure you want to delete your account?');">Delete Account</a>
                    </div>
                    
                </div>
                
      </div>
    </body>
</html>

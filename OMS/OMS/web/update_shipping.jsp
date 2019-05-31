<%-- 
    Document   : update_payment
    Created on : May 19, 2019, 12:31:56 PM
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
        <title>Update Payment</title>
    </head>
    
     <% 
            User u = (User)session.getAttribute("userLogin");
            
            String postCode = request.getParameter("postCode");
            String street = request.getParameter("street");
            String suburb = request.getParameter("suburb");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String country = request.getParameter("country");
            String password = request.getParameter("password");
            String submitted = request.getParameter("submitted");
            
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
                 
        <%if (submitted == null){%>
           <!-- My Account -->      
         <div class="container my-5">
              <div class="row border-bottom border-dark pb-4 pt-5 pl-4">
                  <div class="col-md-12">
                      <span class="text-dark h1">Update Shipping Details</span>
                  </div>
                  </div>
             <div class="row pt-5">
                 <div class="col-md-12">
                    <form action="update_shipping.jsp" method="POST">                           
                            <div class="form-group">
                                <label class="float-left pt-4" for="exampleInputEmail1">Street</label>
                                <input type="name" name="street" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="123 Corner Street...">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Suburb</label>
                                <input type="name" name="suburb" class="form-control mb-3" placeholder="Enter Suburb">
                            </div>
                         <div class="form-group">
                                <label class="float-left pt-4">City</label>
                                <input type="Name" name="city" class="form-control" placeholder="Enter City">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Country</label>
                                <input type="Name" name="country" class="form-control" placeholder="Enter Country">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Post Code</label>
                               <input type="number" name="postCode" class="form-control" placeholder="Enter Post Code">
                            </div>
                        <div class="form-group">
                                <label class="float-left pt-4">Password</label>
                               <input type="password" name="password" class="form-control" placeholder="Enter Password">
                            </div>
                                <p class="pt-5 h5 text-danger">Leave blank to keep current details</p>
                                <input type="hidden" name="submitted" value="submitted">
                                <button type="submit" class="btn btn-lg btn-dark mt-5">Update Shipping</button> 
                        </form>
                        </div>
                        </div>
                    </div>
           
           <%}else{%>
           <%
                if (u.getPassword().equals(password)){
                    u.updateShipping(street, suburb, city, country, postCode);
                    DBManager manager = (DBManager)session.getAttribute("manager");
                    manager.updateShipping(u.getEmail() ,u.getStreet(), u.getSuburb(), u.getCity(), u.getCountry(), u.getPostCode());            
                 
           %> 
            
           <div class="container my-5">
              <div class="row border-bottom border-dark pb-4 pt-5 pl-4">
                  <div class="col-md-12">
                      <span class="text-dark h1">Update Shipping</span>
                  </div>
                  </div>
             <div class="row py-3 bg-success mt-1">
                 <div class="col-md-12 h1 text-center text-light">Shipping Details Updated!</div>
                        </div>
                    </div>
           
           <%   } else {%>
                       <!-- My Account -->      
                         <div class="container my-5">
              <div class="row border-bottom border-dark pb-4 pt-5 pl-4">
                  <div class="col-md-12">
                      <span class="text-dark h1">Update Shipping Details</span>
                  </div>
                  </div>
             <div class="row pt-5">
                 <div class="col-md-12">
                    <form action="update_shipping.jsp" method="POST">                           
                            <div class="form-group">
                                <label class="float-left pt-4" for="exampleInputEmail1">Street</label>
                                <input type="name" name="street" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="123 Corner Street...">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Suburb</label>
                                <input type="name" name="suburb" class="form-control mb-3" placeholder="Enter Suburb">
                            </div>
                         <div class="form-group">
                                <label class="float-left pt-4">City</label>
                                <input type="Name" name="city" class="form-control" placeholder="Enter City">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Country</label>
                                <input type="Name" name="country" class="form-control" placeholder="Enter Country">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Post Code</label>
                               <input type="number" name="postCode" class="form-control" placeholder="Enter Post Code">
                            </div>
                        <div class="form-group">
                                <label class="float-left pt-4">Password</label>
                               <input type="password" name="password" class="form-control" placeholder="Enter Password">
                            </div>
                                <p class="pt-5 h5 text-danger">PASSWORDS WAS WRONG, TRY AGAIN</p>
                                <p class="pt-5 h5 text-danger">Leave blank to keep current details</p>
                                <input type="hidden" name="submitted" value="submitted">
                                <button type="submit" class="btn btn-lg btn-dark mt-5">Update Shipping</button> 
                        </form>
                        </div>
                        </div>
                    </div>
           <%   }  }%>
    </body>
</html>
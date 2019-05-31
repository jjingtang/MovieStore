<%-- 
    Document   : update_account
    Created on : May 18, 2019, 10:16:32 PM
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
        <title>Update Details</title>
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
                      <span class="text-dark h1">Update Account</span>
                  </div>
                  </div>
             <div class="row pt-5">
                 <div class="col-md-12">
                    <form action="updated_acc_details.jsp" method="POST">                           
                            <div class="form-group">
                                <label class="float-left pt-4" for="exampleInputEmail1">Email</label>
                                <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Password</label>
                                <input type="password" name="password" class="form-control mb-3" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Confirm Password</label>
                                <input type="password" name="confirm_password" class="form-control" placeholder="Confirm Password">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Phone Number</label>
                                <input type="phone" name="phone" class="form-control" placeholder="Phone Number">
                            </div>
                                <p class="pt-5 h5 text-danger">Leave blank to keep current details</p>
                                <button type="submit" class="btn btn-lg btn-dark mt-5">Update Details</button> 
                        </form>
                        </div>
                        </div>
                    </div>
          
    </body>
</html>

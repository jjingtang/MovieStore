<%-- 
    Document   : delete_account
    Created on : May 19, 2019, 7:56:59 PM
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
        <title>Account Deleted</title>
    </head>
    
     <% 
            DBManager manager = (DBManager)session.getAttribute("manager");                       
            User u = (User)session.getAttribute("userLogin");
     %>
    
    <body>

         <!-- Nav Bar -->
          <div class="container-fluid">
            <div class="row bg-dark pt-4 pb-4">
                <div class="col-md-4">
                    <a class="btn px-4 ml-5 btn-lg btn-outline-light" href="index.jsp">Home</a>
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
         
         <!-- Deleted Account Message -->
         <div class="container my-5">
              <div class="row border-bottom border-dark pb-4 pt-5">
                  <div class="col text-center">
                      <div class="col-md-12 h1 text-center text-dark"><%=u.getFirstName()%> <%=u.getLastName()%>'s account has been deleted successfully</div>
                  </div>
                  </div>  
                  <div class='row mt-5 text-center'>
                      <div class='col-md-12 my-5'>
                          <p class='h3'>We're sad to see you go :(</p>
                      </div>
                      <div class='col-md-12 my-5'>
                          <a class='btn btn-lg btn-danger' href='index.jsp'>Return to Home</a>
                      </div>
                  </div>
                  </div>
    </body>
      <% 
            manager.deleteUser(u.getEmail());
            session.invalidate();
      %>
</html>

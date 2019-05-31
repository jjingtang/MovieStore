<%-- 
    Document   : register
    Created on : May 14, 2019, 8:12:22 PM
    Author     : sadkmalk
--%>

<%
	String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Create an Account</title>
    </head>
    <body style="background-color: #ccb483">
        
        <div class="container-fluid">
               
               <!-- Navigator Bar-->
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
               
            <!-- Sign In and Create Account  -->
            <div class="row m-5 py-5 text-center bg-light">
                <div class="bg-dark border border-dark col-md-4  my-4">
                    <h1 class="text-light py-1">Create Account</h1>
                </div>
                <div class="col-md-8 offset-md-2 my-5">
                        <form action="<%=url %>/RegisterServlet" method="POST">
                            <div class="form-group">
                                <label class="float-left">Full Name</label>
                                <input type="name" name="fullname" class="form-control" placeholder="Full Name">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4" for="exampleInputEmail1">Email</label>
                                <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label class="float-left pt-4">Password</label>
                                <input type="password" name="password" class="form-control mb-3" placeholder="Password">
                            </div>
                                <button type="submit" class="btn btn-lg btn-dark mt-5">Create Account</button> 
                        </form>
                </div>
            </div>
        </div>
        
    </body>
</html>

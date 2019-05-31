<%-- 
    Document   : index
    Created on : 16/04/2019, 10:04:52 PM
    Author     : JordanSposito
--%>

<%
	String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<%@page import="oms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="oms.controller.*"%>
<%@page import="util.DerbyUtil"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!--import Bootstrap-->
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
        <title>Online  Movie Store</title>
        
        <% 
            String email = (String)session.getAttribute("email");
        %>
        
        <style>
            
            .img-fluid {
                height:100%;
            }
            
        </style>
    </head>
    <body>
        <div class="container-fluid bg-light">
            <!-- Navigator Bar-->
            <div class="row bg-dark pt-4 pb-4">
                <div class="col-md-4">
                    <%if (email == null || email.equals("")) {%>
                        <a class="btn h1 px-4 ml-5 btn-lg btn-outline-light" href="login.jsp">Login</a>
                        <a class="btn h1 px-4 ml-5 btn-lg btn-outline-light" href="register.jsp">Register</a>
                    <%} else {%>
                        <a class="btn h1 px-4 ml-5 btn-lg btn-outline-light" href="account.jsp"><%=email%></a>
                        <a class="btn h1 px-4 btn-lg btn-outline-light ml-4" href="<%=url %>/LogoutServlet">Log Out</a>
                    <%}%>            
                </div>
                <div class="col-md-4 text-center">
                    <h1 class="text-danger">Movie Store</h1>
                </div>
                <div class="col-md-4 mt-2">
                <form class="text-center form-inline float-right mr-5" action="index.jsp" method="GET">
                        <input class="form-control" name="title" type="search" placeholder="title" aria-label="Search" value="<%=request.getParameter("title")==null?"":request.getParameter("title")%>">  <p>
                        <input class="form-control" name="genre" type="search" placeholder="genre" aria-label="Search" value="<%=request.getParameter("genre")==null?"":request.getParameter("genre")%>"> <p>
                        <input class="form-control" name="date" type="search" placeholder="date" aria-label="Search" value="<%=request.getParameter("date")==null?"":request.getParameter("date")%>">  <p>                       
                        <button class="btn btn-outline-light ml-4" type="submit">Search</button></span>
                        <a class="btn btn-outline-light ml-4" href="./cart.jsp">Cart</a>
                    </form>
                </div>
            </div>
            
            
            <!--Side Bar-->
            <div class="row">
                <div class="col-md-2 p-0 m-0 text-danger">
                    <ul style="list-style-type: none;" class="text-center m-0 p-0">
                        <!-- <li class="h2 p-5 m-0 border border-dark text-light" style="background-color: #ccb483">Operation</li> -->
                        <%if (email != null) {%>
	                        <li class="h4 p-5 m-0 border border-dark text-dark">
								<a class="btn btn-outline-light ml-4" href="./movie/add.jsp">Add Movie</a>
							</li>
	                        <li class="h4 p-5 m-0 border border-dark text-dark">
								<a class="btn btn-outline-light ml-4" href="./logs.jsp">Logs</a>
							</li>
	                    <%}%>
                    </ul>
                </div>
                
                
                <!--Movies-->
                <div class="col-md-10 mb-0 p-5">
                    <div class="card-group">
						<% 
							String sql = "select * from movies where 1=1 ";
							if(request.getParameter("title")!=null){
								sql = sql + " and title like '%"+request.getParameter("title")+"%'";
							}
							if(request.getParameter("genre")!=null){
								sql = sql + " and genre like '%"+request.getParameter("genre")+"%'";
							}
							if(request.getParameter("searchtime")!=null){
								sql = sql + " and searchtime = '"+request.getParameter("searchtime")+"'";
							}
							sql = sql + " order by createtime desc";
							List<Map<String,Object>> list = DerbyUtil.select(sql, new Object[] {});
							for(Map<String,Object> map : list){%>
								<div class="btn btn-outline-danger card">
								<a href="#"><img class="img-fluid img-fluid card-img-top" src="imgs/poster.jpg" height="184" width="273" alt="Card image cap"></a>
								<p>
									<a href="./movie/edit.jsp?id=<%=map.get("ID") %>&title=<%=map.get("TITLE") %>&genre=<%=map.get("GENRE") %>&price=<%=map.get("PRICE") %>&amount=<%=map.get("AMOUNT") %>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="<%=url %>/DeleteMovieServlet?id=<%=map.get("ID") %>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="<%=url %>/AddtoCartServlet?id=<%=map.get("ID") %>">Purchase</a>
								</p>
								
								<p><%out.println(map.get("TITLE"));%></p>
								</div>
							<%}
						%>
                </div>                   
            </div>
        </div>

    </body>
</html>

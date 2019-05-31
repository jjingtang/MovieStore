<%@page import="oms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="oms.controller.*"%>
<%@page import="util.DerbyUtil"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>CART</title>
<script type="text/javascript" src="./resources/js/jquery.min.js" ></script>
<link href="./resources/css/gouwu.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="page">
<div id="listdiv"> <h4>CART</h4>
<p></p>
<form action="cart.jsp" method="GET">
number:<input type="text" value="" name="orderid" />&nbsp; date:<input type="text" value="" name="date"/>

<input type="submit" value="search" />
</form>
<p></p>
   <table width="750" cellpadding="0" cellspacing="0" id="gwcTable">
    <tr>
      <td width="150">Id</td>
      <td width="150">Movie</td>
      <!-- <td width="92">Price</td> -->
      <td width="230">Amount</td>
      <td width="100">Create Date</td>
      <td width="40">Status</td>
      <td width="60">Operate</td>
    </tr>
    
    <% 
    String sql = "select * from t_order where 1=1 ";
    String email = (String)session.getAttribute("email");
    if(email!=null&&(!"".equals(email))){
    	sql = sql + " and userid='"+email+"'";
    }
    String id = request.getParameter("orderid");
     if(id!=null&&(!"".equals(id))){
     	sql = sql + " and id='"+id+"'";
     }
    String searchdate = request.getParameter("date");
     if(searchdate!=null&&(!"".equals(searchdate))){
     	sql = sql + " and createtime='"+searchdate+"'";
     }
    sql = sql +  " order by createtime desc";
		List<Map<String,Object>> list = DerbyUtil.select(sql, new Object[] {});
		for(Map<String,Object> map : list){%>
			<tr>
		      <td><%=map.get("ID") %></td>
		      <td><p><img src="imgs/poster.jpg" height="184" width="273" /></p><p><%=map.get("MOVIETITLE") %></p></td>
		      <td><%=map.get("AMOUNT") %></td>
		      <td><%=map.get("CREATETIME") %></td>
		      <td id="stotal3"><%=map.get("STATUS") %></td>
		      <td>
		      <% if(map.get("STATUS").equals("created")){%>
		      	<a href="<%=url %>/AddServlet?id=<%=map.get("ID") %>"  class="a">Add</a>
		      	<a href="<%=url %>/ReduceServlet?id=<%=map.get("ID") %>"  class="a">Reduce</a>
		      	<a href="<%=url %>/CancelOrderServlet?id=<%=map.get("ID") %>"  class="a">Cancel</a>
		      	<a href="<%=url %>/ConfirmOrderServlet?id=<%=map.get("ID") %>"  class="a">Confirm</a>
		      <%}%>
		      <% if(map.get("STATUS").equals("confirmed")){%>
		      	<a href="<%=url %>/PayServlet?id=<%=map.get("ID") %>"  class="a">Pay</a>
		      <%}%>
		      </td>
		    </tr>
		<%}%>
  </table>
  </div>
  <div id="jiesuan">
    <div class="t jisuanbtn">
      <a href="./payment.jsp">Payment List</a>
    </div>
  </div>
</div>
</body>
</html>

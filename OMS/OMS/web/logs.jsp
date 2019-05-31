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
<div id="listdiv"> <h4>Logs</h4>
<p></p>
<form action="logs.jsp" method="GET">
id:<input type="text" value="" name="userid" />&nbsp; date:<input type="text" value="" name="date"/>

<input type="submit" value="search" />
</form>
<p></p>
   <table width="750" cellpadding="0" cellspacing="0" id="gwcTable">
    <tr>
      <td width="100">Id</td>
      <td width="100">Email</td>
      <td width="100">Create time</td>
      <td width="100">Type</td>
      <td width="100">Operation</td>
    </tr>
    
    <% 
		String sql = "select * from log where 1=1 ";
    String email = (String)session.getAttribute("email");
    if(email!=null&&(!"".equals(email))){
    	sql = sql + " and email='"+email+"'";
    }
    String id = request.getParameter("userid");
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
		      <td><%=map.get("EMAIL") %></td>
		      <td><%=map.get("CREATETIME") %></td>
		      <td><%=map.get("TYPE") %></td>
		      <td><a href="<%=url%>/DeleteLogServlet?id=<%=map.get("ID") %>">delete</a></td>
		    </tr>
		<%}%>
  </table>
  </div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<nav class="nav-main">
		<img alt="logo" src="img/irishmall-logo.jpeg">
		<div class="nav-main_stock">���</div>
		<div class="nav-main_import">�԰�</div>
		<div class="nav-main_export">���</div>
		<div class="nav-main_statistics">���</div>
			<%
				Date date = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy�� MM�� dd�� HH�� mm��");
				String today = sf.format(date);
			%>
		<div class="nav-bar_date">
			<%= today%>
		</div>	
	</nav>

</body>
</html>
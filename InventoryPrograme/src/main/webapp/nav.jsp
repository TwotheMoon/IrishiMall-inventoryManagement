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
		<div class="nav-main_stock">재고</div>
		<div class="nav-main_import">입고</div>
		<div class="nav-main_export">출고</div>
		<div class="nav-main_statistics">통계</div>
			<%
				Date date = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
				String today = sf.format(date);
			%>
		<div class="nav-bar_date">
			<%= today%>
		</div>	
	</nav>

</body>
</html>
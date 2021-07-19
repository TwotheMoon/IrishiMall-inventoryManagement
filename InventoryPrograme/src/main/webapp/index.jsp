<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.css" >
	<meta http-equiv="content-Type" content="text/html" charset="UTF-8">
	<meta name="viewport"  content="width=device-width, initial-scale=1" />
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
<title> IrishMall 매니지먼트 사이트 </title>
</head>
<body id="index-body">
	<div id="index-main">
		<nav>
			<%@include file="nav.jsp" %>		
		</nav>
		
		<section>
			<%@include file="section.jsp" %>
		</section>
	
	</div>
</body>
</html>
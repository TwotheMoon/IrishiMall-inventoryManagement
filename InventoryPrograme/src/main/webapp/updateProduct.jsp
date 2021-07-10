<%@page import="java.awt.Stroke"%>
<%@page import="com.oreilly.servlet.MultipartResponse"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.css" >
	<meta http-equiv="content-Type" content="text/html" charset="UTF-8">
	<meta name="viewport" content="width=device-width initial-scale-1">
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
<title> IrishMall 상품 수정</title>
</head>
<body>

	<%@include file="nav.jsp" %>
		<div class="jumbotron">
			<div class="container">
				<h1> 상품 수정 </h1>
			</div>
		</div>	
		
		<%
			String pID = request.getParameter("pID");
			ProductDao dao = ProductDao.getinstance();
			Product product = dao.getProduct(pID);
		%>
		
		<div class="container">
		
			<div class="col-md-3">
				<%@include file="sidebar.jsp"  %>
			</div>
			<div class="col-md-9">	
				<form name="newproduct" method="post" action="updateProductAction.jsp" enctype="multipart/form-data">
		
					<div class="form-group row">
						<label class="col-sm-2">상품코드</label>
						<div class="col-sm-3">
							<input type="text" name="pID" class="form-control" value="<%=product.getpID() %>" readonly="readonly">
						</div>
						<label>*수정불가</label>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" name="pName" class="form-control" value="<%=product.getpName() %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품가격</label>
						<div class="col-sm-3">
							<input type="text" name="pPrice" class="form-control" value="<%=product.getpPrice() %>">
						</div>
					</div>
					<div class="form-group row">
							<label class="col-sm-3">사이즈</label>
							<div class="col-sm-3">
							<%
								if(product.getpSize().equals("20X20")){
							%>
								<input type="radio" name="pSize" value="20X20" checked="checked">20X20
								<input type="radio" name="pSize" value="40X50">40X50
							<%	
								} else {
							%>
								<input type="radio" name="pSize" value="20X20">20X20
								<input type="radio" name="pSize" value="40X50" checked="checked">40X50
							<% 		
								}
							%>
							</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" name="pQuantity" class="form-control" value="<%=product.getpQuantity() %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지파일</label>
						<div class="col-sm-3">
							<input type="hidden" name="oldpImg" value="<%=product.getpImg()%>" >
							<input type="file" name="pImg" class="form-control">
							<label>기존파일 : <%=product.getpImg()%></label>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3"></div>
						<input type="submit" class="btn btn-primary" value="수정">
					</div>
				</form>
			</div>
		</div>
</body>
</html>
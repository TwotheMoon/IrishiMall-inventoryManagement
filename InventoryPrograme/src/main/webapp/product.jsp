<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.css" >
	<meta http-equiv="content-Type" content="text/html" charset="UTF-8">
	<meta name="viewport"  content="width=device-width, initial-scale=1" />
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

<title> 제품 상세 페이지 </title>
</head>
<body>

	<%@include file ="nav.jsp" %>
	
		<div class="jumbotron">
			<div class="container">
				<h1> 제품 정보 </h1>
			</div>
		</div>
		
		<%
			request.setCharacterEncoding("UTF-8");
			String pID = request.getParameter("pID");
			
			ProductDao dao = ProductDao.getinstance();
			Product product = dao.getProduct(pID);
		%>		
		
		<div class="container">
			<div class="col-md-3">
				<%@include file="sidebar.jsp"  %>
			</div>
			
			<div class="row">
				<div class="col-md-5">
					<img alt="" src="img/<%=product.getpImg()%>" style="width: 100%">
				
				</div>
				
				<div class="col-md-3">
					<h3><%=product.getpName() %></h3>
					<p> 상품 코드 : <%=product.getpID() %>
					<p> 상품 사이즈 : <%=product.getpSize() %>
					<%
						if(product.getpQuantity() == 0){
					%>
					<p> 상품 재고 : 매진
					<% 		
						} else {
					%>
					<p> 상품 재고 : <%=product.getpQuantity() %>
					<%
						}
					%>
					<p> 상품 가격 : <%=product.getpPrice() %>
					<%
						if(product.getactivation() == 0){
					%>
					<p> 판매 상태 : 미판매 
					<% 	
						} else {
					%>
					<p>	판매 상태 : 판매중
					<% 							
						}
					%>
					<div class="container">
						<a href="updateProduct.jsp?pID=<%=product.getpID() %>" class="btn btn-info" >상품수정</a>
						<a href="productList.jsp" class="btn btn-info">상품목록</a>
					</div>
				</div>
			</div>
		</div>

</body>
</html>
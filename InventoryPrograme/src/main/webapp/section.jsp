<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.css" >
	<meta http-equiv="content-Type" content="text/html" charset="UTF-8">
	<meta name="viewport" content="width=device-width initial-scale-1">
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
<title> IrishMall 상품 관리 </title>
</head>
<body>

		<div class="jumbotron">
			<div class="container">
				<h1> 상품 관리 </h1>
			</div>
		</div>	
	<%
		request.setCharacterEncoding("UTF-8");
			
		ArrayList<Product> listProducts = new ArrayList<>();
		
		String key = request.getParameter("key");
		String keyword = request.getParameter("keyword");
		
		if(key == null || keyword == null){
			ProductDao dao = ProductDao.getinstance();
			listProducts = dao.getAllProducts();
		} else {
			ProductDao dao = ProductDao.getinstance();
			listProducts = dao.serarchGetAllProducts(key, keyword);
		}
	%>
		<div class="container">
			<div class="col-md-3">
				<%@include file="sidebar.jsp"  %>
			</div>
			<div class="col-md-9">	
				<div style="padding-top: 50px">
		<% // 조회 %>
			<div class="col-sm-6"> <%// 공백 %></div>
			<div class="col-sm-6">
				<form action="index.jsp" method="post" name="form">
					<div class="form-group row">
						<div class="col-sm-4">
							<select name="key" class="form-control">
								<option value="pName">상품명</option>
								<option value="pID">상품코드</option>
								<option value="pPrice">가격</option>
								<option value="pSize">사이즈</option>
								<option value="activation">활성화 0 = 미판매 1 = 판매중</option>
							</select>
						</div>
						
						<div class="col-sm-7">
							<input type="text" name="keyword" placeholder="search" class="form-control">	
						</div>
						
						<div class="col-sm-1">
							<input type="submit" value="조회" class="btn btn-default">
						</div>
					</div>
				</form>
			</div>
			<table class="table table-hover">
				<tr>
					<th> 이미지 </th>
					<th> 상품코드 </th>
					<th> 상품명 </th>
					<th> 가격 </th>
					<th> 사이즈 </th>
					<th> 재고 </th>
					<th> 활성화</th>
				</tr>
			<%
			// 리스트 개수가 == 0 인경우 => 제품이 없는경우 / 검색 결과가 없는경우
			if(listProducts.size() == 0){
			%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>조회 결과 없음</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			<% 
			}else{	// 제품이 있는경우				
			for(int i = 0; i<listProducts.size(); i++){
					Product product = listProducts.get(i);
			%>	
				<tr onclick="location.href='product.jsp?pID=<%=product.getpID()%>'">
					<td width="150" style="word-break:break-all">
						<img src="img/<%=product.getpImg()%>" style="width: 50%">
						<br> <%=product.getpImg()%>
					</td>
					<td><%=product.getpID()%></td>
					<td><%=product.getpName() %></td>
					<td><%=product.getpPrice() %></td>
					<td><%=product.getpSize() %></td>	
				<%
					if(product.getpQuantity() == 0){
				%>
					<td>매진</td>
				<% 		
					}else{
				%>
					<td><%=product.getpQuantity() %></td>
				<%
					}
				%>
				<%
					if(product.getactivation() == 1){
				%>
					<td>판매중</td>
				<% 
					}else if(product.getactivation() == 0){
				%>
					<td>미판매</td>
				<% 
					}else if(product.getactivation() == 2){
				%>
					<td>매진</td>
				<% 		
					}
				%>
					<td><a href="updateProduct.jsp?pID=<%=product.getpID() %>"><button class="badge badge-danger">수정</button></a></td>
					<td><a href="deleteProductAction.jsp?pID=<%=product.getpID() %>" ><button class="badge badge-danger" onclick="return confirm('삭제 하시겠습니까?')">삭제</button></a></td>
					<td><a href="activeProductAction.jsp?pID=<%=product.getpID() %>"><button class="badge badge-danger">상태</button> </a></td>
				</tr>
			<%
					}
				}	
			%>
					</table>
				</div>
			</div>
		</div>
</body>
</html>
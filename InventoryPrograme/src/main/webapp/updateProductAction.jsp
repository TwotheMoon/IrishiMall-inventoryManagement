<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%
		request.setCharacterEncoding("UTF-8");
	
		String realFolder="C:/Users/2theMoon/git/IrishiMall-inventoryManagement/InventoryPrograme/src/main/webapp/img";
	
		MultipartRequest multi = new MultipartRequest(
			request, realFolder, 1024*1024*100, "UTF-8", new DefaultFileRenamePolicy()
			);
		
		String pID = multi.getParameter("pID");
	 	String pName = multi.getParameter("pName");
	 	String pPrice = multi.getParameter("pPrice");
	 	String pSize = multi.getParameter("pSize");
	 	String pQuantity = multi.getParameter("pQuantity");
	 	String pImg = multi.getFilesystemName("pImg");
	 	
	 	if(pImg == null){
	 		pImg = multi.getParameter("oldpImg");
	 	}
	 	
		Integer price;
	 	
	 	if(pPrice.isEmpty() ){
	 		price = 0;
	 	} else {
	 		price = Integer.valueOf(pPrice);
	 	}
	 	
	 	Integer quantity;
	 	
	 	if(pQuantity.isEmpty() ){
	 		quantity = 0;
	 	} else {
	 		quantity = Integer.valueOf(pQuantity);
	 	}
	 	
	 	ProductDao dao = ProductDao.getinstance();
	 	Product product = new Product();
	 	
	 	product.setpID(pID);
	 	product.setpName(pName);
	 	product.setpQuantity(quantity);
	 	product.setpPrice(price);
	 	product.setpImg(pImg);
	 	product.setpSize(pSize);
	 	product.setactivation(1);
	 	
	 	dao.updateProduct(product);
	 	
	 	response.sendRedirect("index.jsp");
	%>
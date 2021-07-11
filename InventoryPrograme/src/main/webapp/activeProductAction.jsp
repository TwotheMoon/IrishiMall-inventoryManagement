<%@page import="java.io.PrintWriter"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("UTF-8");
    	String pID = request.getParameter("pID");
    	ProductDao dao = ProductDao.getinstance();
    
    	int result = dao.activation(pID);
    	
    	if(result == 1){
    		PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('변경 성공');");
			script.print("location.href = 'index.jsp'");
			script.print("</script>");
    	} else {
    		PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('오류!! 형오한테 문의하세요');");
			script.print("history.back()");
			script.print("</script>");
    	}
   
    	
    	

    %>
    
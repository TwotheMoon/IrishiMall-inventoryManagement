<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
			<%
				Date date = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
				String today = sf.format(date);
			%>
			
  <nav class="navbar navbar-default">
    	<div class="container">
    	
    		<div class="navbar-header">
    			<a class="navbar-brand" href="productList.jsp"> <img alt="Brand" src="img/irishmall-logo.jpeg"> </a>
    		</div>
    		<div class="collapse navbar-collapse">
    			<ul class="nav nav-pills">
    				<li role="presentation" class="active"><a href="productList.jsp"> 통합 재고 </a></li>
  					<li role="presentation"><a href="#"> 출고 </a></li>
  					<li role="presentation"><a href="#"> 입고 </a></li>
  					<li role="presentation"><a href="#"> 통계 </a></li>
		   			<ul class="nav navbar-nav navbar-right">
		    			<h3><span class="label label-default"><%= today%></span></h3>
		    		</ul>
    			</ul>
    		</div>
    		
    	</div>
    </nav>
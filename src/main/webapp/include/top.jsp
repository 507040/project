<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file = "/include/urimaker.jsp" %>
    <html>
    <head>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/basic.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">    
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="/resources/js/main.js"></script>		
		<script src="/resources/js/adress.js"></script>
		<script src="/resources/js/join.js"></script>
    </head>
    <body>
    <header>
	   	<nav class="navbar navbar-expand navbar-dark bg-white">
			<div class="container" style="display: flex;justify-content: space-between;">		
				<div class = "navbar-header">				
					<a class="navbar-brand text-dark" href="/">
				   		<img src="/resources/img/minilogo.jpg" width="30" height="24" class="d-inline-block align-text-top">
				  		Home
			   		</a>	  		
				</div>
				<div>
					<%
					      String session_id = (String)session.getAttribute("id");
				    	  String session_nic =(String)session.getAttribute("nicname");
				    	  if(session_id!=null){
				    	  %>
				    	    <a href="/cart.pn?Op=1"><i class="bi bi-cart4" style="font-size: 30px;color:#d27e2c"></i></a>&nbsp;&nbsp;
                            <a style="font-size: 13px;color:#d27e2c"><%=session_nic %></a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="/logout?URI=<%=uri_str %>" style="font-size: 13px;color:#d27e2c">로그아웃</a>
                            <%}else{%>
                            <a href="/login?URI=<%=uri_str %>" style="font-size: 13px;color:#d27e2c">로그인</a>&nbsp;&nbsp;
                            <a href="/join" style="font-size: 13px;color:#d27e2c">회원가입</a>
                            <%}%>  
				</div>
			</div>	
		</nav>    
 








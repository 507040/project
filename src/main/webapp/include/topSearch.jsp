<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="urimaker.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String str= request.getRequestURI();%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Blog</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/basic.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="/resources/js/main.js"></script>
</head>

<body>
    <header>
        <nav class="navbar navbar-expand navbar-light bg-white mb-4 fixed-top" id="topfix">
            <div class="container" style="flex-wrap: wrap">
                <div class="container">
                    <a class="navbar-brand" href="/">
                        <img src="/resources/img/minilogo.jpg" width="30" height="30" class="d-inline-block align-text-top">HOME
                    </a>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav" style="width: 80%">
                            <li class="nav-item active w-100">
                            <c:if test='<%=str.equals("/blog/listCategory.jsp") %>'><c:set value="/BloglistCategory.do" var="actionStr"/></c:if>
                            <c:if test='<%=str.equals("/blog/list.jsp") %>'><c:set value="/Bloglist.do" var="actionStr"/></c:if>                           
                            
                                <form action=<c:out value="/Bloglist.do"/> class="form-inline my-2 my-lg-0" method="get">
                                	<input type="hidden" name="category" value="<%=request.getParameter("category")%>">                                	
                                    <input class="form-control mr-2" id="searchInput" name="search" style="width: 80%" type="search" value="<%=request.getParameter("search") %>" placeholder="검색어를 입력하세요" aria-label="Search">
                                    <input type="hidden" name="p" value="1">
                                    <button class="tomato" type="submit"><i class="bi bi-search"></i></button>
                                </form>
                            </li>
                        </ul>
                        <div class="text-right" style="width:20%">
                        <form  class="form-inline m-0 p-0 col-12 text-right" style="display: flex;justify-content: flex-end;">
                          <%
					      String session_id = (String)session.getAttribute("id");
				    	  String session_nic =(String)session.getAttribute("nicname");
				    	  String session_lev =(String)session.getAttribute("level");
				    	  if(session_id!=null){%>				    	 
				    	    <a href="/cart.pn?Op=1"><i class="bi bi-cart4" style="font-size: 30px;color:#d27e2c"></i></a>&nbsp;&nbsp;
                            <a style="font-size: 13px;color:#d27e2c"><%=session_nic %></a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="/logout?URI=<%=uri_str %>" style="font-size: 13px;color:#d27e2c">로그아웃</a>
                            <%}else{%>
                            <a href="/login?URI=<%=uri_str %>" style="font-size: 13px;color:#d27e2c">로그인</a>&nbsp;&nbsp;
                            <a href="/join" style="font-size: 13px;color:#d27e2c">회원가입</a>
                            <%}%>  
					  </form>
					  </div>
			      </div>
				</div>
			    
			   	
		<div class="col-12">
		<div class="container text-center" style="justify-content: flex-start;">
			<a href="/BMain.do" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">블로그</a>			
			<a href="/BloglistCategory.do?category=1&search=<%=request.getParameter("search")%>&p=1" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">소개</a>
			<a href="/BloglistCategory.do?category=2&search=<%=request.getParameter("search")%>&p=1" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">소개</a>
			<a href="/BloglistCategory.do?category=3&search=<%=request.getParameter("search")%>&p=1" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">소개</a>			
			<a href="/SMain.pn" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">쇼핑</a>
			<a href="/" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">고객센터</a>			
		</div>
		</div>
	</nav>	
		
	</header>
	<main id="wrapper">

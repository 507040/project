<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/urimaker.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="URF-8">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>블로그</title>




    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">




    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/4.6/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/4.6/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/4.6/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon.ico">
    <meta name="msapplication-config" content="/docs/4.6/assets/img/favicons/browserconfig.xml">
    <meta name="theme-color" content="#563d7c">



    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/blog/">
    <link href="blog.css" rel="stylesheet">
    <link href="/resources/css/basic.css" rel="stylesheet">    
    <script src="/resources/js/myblog.js"></script>
    <script src='/resources/js/autosize-master/dist/autosize.js'></script>


</head>

<body id="wrapper">


    <div class="container">
        <header class="blog-header py-3">
            <div class="row flex-nowrap justify-content-between align-items-center">
                <div class="col-4 pt-1">
                    <a class="text-muted" href="/">Home</a>
                </div>
                <div class="col-4 text-center">
                    <a class="logoTag_a blog-header-logo text-dark" href="/BMain.do">Blog</a>
                </div>
                <div class="col-4 d-flex justify-content-end align-items-center">

                    <a class="text-muted nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false">
                            <circle cx="10.5" cy="10.5" r="7.5" />
                            <path d="M21 21l-5.2-5.2" />
                        </svg>
                    </a>

                    <div class="dropdown-menu" style="border: 0px;">
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" id="searchInput" style="width: 80%" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                            <button class="btn btn-outline-success my-sm-0" type="submit"><i class="bi bi-search"></i></button>
                        </form>
                    </div>
					<%
						String session_id = (String)session.getAttribute("id");
						String session_nic =(String)session.getAttribute("nicname");
						if(session_id!=null){
					%>	
						<a href="/cart.pn?Op=1"><i class="bi bi-cart4 text-secondary" style="font-size: 30px;"></i></a>&nbsp;&nbsp;				
						<a class="text-secondary" style="font-size: 13px;"><%=session_nic %></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a  href="/logout?URI=<%=uri_str %>" class="text-secondary" style="font-size: 13px;">로그아웃</a>
					<%}else{%>
				       <a class="btn btn-sm btn-outline-secondary" href="/login?URI=<%=uri_str %>" href="#">Sign up</a>				   
					<%}%>

                    

                </div>
            </div>
        </header>
        <div class="nav-scroller py-1 mb-2">
            <nav class="nav d-flex justify-content-start">
                <a class="p-2 text-muted" href="/BMain.do">블로그 홈</a>
                <a class="p-2 text-muted" href="#">주제 별 보기</a>
                <a class="p-2 text-muted" href="#">인기 블로그</a>
            </nav>
        </div>
	
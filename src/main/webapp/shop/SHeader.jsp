<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/urimaker.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!doctype html>
<html lang="UTF-8">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>쇼핑</title>



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

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/blog/">
    <link rel="stylesheet" href="/resources/css/basic.css">

    <script src="/resources/js/shop.js"></script>
    <script src="/resources/js/Order.js"></script>

</head>

<body>
    <header>
        <nav class="navbar navbar-expand navbar-light bg-white mb-0" style="display: flex;flex-wrap: wrap;">
            <div class="nav col-12">
                <div class="nav col-4">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/" style="align-content: center;">
                                <img src="/resources/img/minilogo.jpg" width="30" height="30" class="d-inline-block align-text-top">
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="navbar-brand m-0" href="/SMain.pn">Shop</a>
                        </li>
                    </ul>
                </div>


                <div class="nav col-8 m-0 p-0" style="display: flex;justify-content: flex-end;align-items: center;" title="장바구니?Uri=<%=uri_str %>">
                    <%
                    
						String session_id = (String)session.getAttribute("id");
						String session_nic =(String)session.getAttribute("nicname");
						if(session_id!=null){
					%>	
						<a href="/cart.pn?Op=1"><i class="bi bi-cart4" style="font-size: 30px;color:#d27e2c;"></i></a>&nbsp;&nbsp;				
						<a style="font-size: 13px;color:#d27e2c;"><%=session_nic %></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/logout?URI=<%=uri_str %>" style="font-size: 13px;color:#d27e2c;">로그아웃</a>
					<%}else{%>
				       <a href="/login?URI=<%=uri_str %>" style="font-size: 13px;color:#d27e2c;">로그인</a>&nbsp;&nbsp;
				       <a href="/join" style="font-size: 13px;color:#d27e2c;">회원가입</a>					   
					<%}%>  
                </div>
            </div>

            <div class="row col-12 m-0 p-0">
                <!--검색-->
                <div class="col-9 m-0 p-0">
                    <form class="form-inline">
                        <input class="form-control mx-2 ml-0" id="searchInput" style="width: 80%" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                        <button class="tomato" type="submit"><i class="bi bi-search"></i></button>
                    </form>
                </div>

                <div class="col-3 row m-0 p-0" style="justify-content: flex-end;align-items: center;">
                    <!--인기검색어 롤링-->
                    <div class="block">
                        <ul id="ticker">
                            <li><a href="#">1.aa</a></li>
                            <li><a href="#">2.bb</a></li>
                            <li><a href="#">3.cc</a></li>
                            <li><a href="#">4.dd</a></li>
                            <li><a href="#">5.ee</a></li>
                        </ul>
                    </div>
                    <!--인기검색어 dropdown-->
                    <div class="box m-0" style="position: relative;">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false"> </a>
                        <div class="box">
                            <ul class="dropdown dropdown-menu dropdown-menu-right">
                                <li id="drItem1"><a id="drItem2" class="dropdown-item link m-0 p-1">1.aa</a></li>
                                <li id="drItem1"><a id="drItem2" class="dropdown-item link m-0 p-1">2.aa</a></li>
                                <li id="drItem1"><a id="drItem2" class="dropdown-item link m-0 p-1">3.aa</a></li>
                                <li id="drItem1"><a id="drItem2" class="dropdown-item link m-0 p-1">4.aa</a></li>
                                <li id="drItem1"><a id="drItem2" class="dropdown-item link m-0 p-1">5.aa</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--카테고리-->

        </nav>

    </header>

    <body>

        <nav class="navbar navbar-expand navbar-light bg-white m-0 p-0 mb-2" style="border:1px solid #DDD;">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">카테고리별A</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">카테고리별B</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">카테고리C</a>
                </li>
            </ul>
        </nav>
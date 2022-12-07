<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="BHeader.jsp" %>



<div class="row mb-2">
    <div class="col-md-6">
        <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static">
                <strong class="d-inline-block mb-2 text-primary">인기Blog</strong>
                <h3 class="mb-0">Featured post</h3>
                <div class="mb-1 text-muted">Nov 12</div>
                <p class="card-text mb-auto"></p>
                <a href="#" class="stretched-link">Continue reading</a>
            </div>
            <div class="col-auto d-none d-lg-block">
                <svg class="bd-placeholder-img" width="200" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                </svg>

            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static">
                <strong class="d-inline-block mb-2 text-primary">인기Blog</strong>
                <h3 class="mb-0">Featured post</h3>
                <div class="mb-1 text-muted">Nov 12</div>
                <p class="card-text mb-auto"></p>
                <a href="#" class="stretched-link">Continue reading</a>
            </div>
            <div class="col-auto d-none d-lg-block">
                <svg class="bd-placeholder-img" width="200" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                </svg>

            </div>
        </div>
    </div>
</div>
<div class="row mb-2">
    <div class="col-md-6">
        <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static">
                <strong class="d-inline-block mb-2 text-primary">인기글</strong>
                <h3 class="mb-0">Featured post</h3>
                <div class="mb-1 text-muted">Nov 12</div>
                <p class="card-text mb-auto"></p>
                <a href="#" class="stretched-link">Continue reading</a>
            </div>
            <div class="col-auto d-none d-lg-block">
                <svg class="bd-placeholder-img" width="200" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                </svg>

            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static">
                <strong class="d-inline-block mb-2 text-primary">인기글</strong>
                <h3 class="mb-0">Featured post</h3>
                <div class="mb-1 text-muted">Nov 12</div>
                <p class="card-text mb-auto"></p>
                <a href="#" class="stretched-link">Continue reading</a>
            </div>
            <div class="col-auto d-none d-lg-block">
                <svg class="bd-placeholder-img" width="200" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                </svg>

            </div>
        </div>
    </div>
</div>


<main role="main" class="container">
    <div class="row">
        <div class="col-md-8 blog-main">
            <h4 class="pb-4 mb-4 font-italic border-bottom">
                이웃블로그
            </h4>
            <div class="row mb-4">
                <a class="col-md-4"> 글 6개</a>
                <a class="col-md-4"> 글 6개</a>
                <a class="col-md-4"> 글 6개</a>
                <a class="col-md-4"> 글 6개</a>
                <a class="col-md-4"> 글 6개</a>
                <a class="col-md-4"> 글 6개</a>
            </div>
            <div class="row mb-3">
                <div class="col-md-12 blog-main">
                    <nav class="nav d-flex justify-content-start" style=" border-top: 1px solid #8f9194;; border-bottom: 1px solid #8f9194;">
                        <a class="p-2 text-muted" href="#">전체</a>
                        <a class="p-2 text-muted" href="#">cartegory A</a>
                        <a class="p-2 text-muted" href="#">cartegory b</a>
                        <a class="p-2 text-muted" href="#">cartegory c</a>
                        <a class="p-2 text-muted" href="#">cartegory d</a>
                        <a class="p-2 text-muted" href="#">갤러리</a>
                    </nav>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 blog-main">
                    사진형 블로그 전체글

                </div>
            </div>
        </div>
		<div class="col-md-4 blog-aside">
			<c:choose>
				<c:when test="<%=session_id != null%>">
					<div class="container_grid_log">											
						<div class="grid_item_loga"><span class="logbox_text_logout"><a href="/Myblog.do?list=0&id=<%=session.getAttribute("id")%>"><img src="/resources/img/profile/<%=session.getAttribute("profile") %>" class="logbox_img_logout rounded-circle img-fluid p-2 m-2"></a></span></div>
						<div class="grid_item_logb"><b class="logbox_text_top">...ㅎㅇ</b></div>
						<div class="grid_item_logc">  <a href="/logout?URI=<%=uri_str %>" class="btn btn-sm btn-success pull-right">logout</a></div>
						<div class="grid_item_logd"> ㅎㅇㅎㅇㅎㅇ</div>
						<div class="grid_item_loge"><a class="logbox_p">aaa</a>&nbsp;<a class="logbox_p">내 정보</a>&nbsp;<a class="logbox_p">쪽지함</a></div>
					</div>				
				</c:when>
				<c:otherwise>
					<div class="col-12 m-0 p-0">
		               <a href="/login?URI=<%=uri_str %>">
		               	   <img class="img img-md" src="/resources/img/login.jpg" style="width:100%;height:175px;">
		               </a>
		               <p class="m-0 p-0 text-right">
			               <input type="button" onclick="window.open('http://localhost:8080/member/search_iden.jsp','','width=500px,height=500px')" class="button_loginpage_mini" id="cursor" value="회원찾기">
		                   <input type="button" onclick="location.href='join'" class="button_loginpage_mini text-rigth" id="cursor" value="회원가입">
	                   </p>
		           </div>							
				</c:otherwise>
			</c:choose>
		
        
            
            <div class="col-md-12 m-0 p-0" style="height:auto;">
                <div class="col-md-12 m-0 p-0" style="height:250px;width:100%;background-color: #d12d12">
                    <p>광고
                </div>
                <div class="col-md-12 m-0 p-0" style="height:150px;width:100%;background-color: #d1fd1f">
                    <p>쇼핑몰
                </div>
                <div class="m-0 p-0" style="width:100%;background-color: #dxfdxf">
                    <div style="font-weight: bold;display: flex;justify-content: space-between"><span>공지사항</span><span>+</span></div>
                    <input type="text" id="tableidI" readonly="readonly" style="border: 0px;background-color: #dxfdxf;direction: none;">
                </div>
            </div>
        </div>

    </div>
    </main>
<%@ include file ="BFooter.jsp" %>

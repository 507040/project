<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
	<%@include file="/include/top.jsp" %>
	<%@include file="/include/header.jsp" %>		
	<c:set value='<%=session.getAttribute("pass")%>' var="session_pass"/>
	<c:set value='<%=session.getAttribute("profile")%>' var="session_profile"/>
	    <div class="container text-center"> 
		<div class="container_grid" style="width:1140px;">	
				<div class="grid_item1">		
								
				</div>
				<div class="grid_item2" style="vertical-align: bottom;">${session_profile}
					<c:choose>
						<c:when test="<%=session_id != null%>">
							<div class="container_grid_log">											
								<div class="grid_item_loga"><span class="logbox_text_logout"><img src="/resources/img/${session_profile}" class="logbox_img_logout rounded-circle img-fluid p-2 m-2"></span></div>
								<div class="grid_item_logb"><b class="logbox_text_top">...ㅎㅇ</b></div>
								<div class="grid_item_logc">  <a href="/logout?URI=<%=uri_str %>" class="btn btn-sm btn-success pull-right">logout</a></div>
								<div class="grid_item_logd"> ㅎㅇㅎㅇㅎㅇ</div>
								<div class="grid_item_loge"><a class="logbox_p">aaa</a>&nbsp;<a href="/updateMember" id="myintro" class="logbox_p">내 정보</a>&nbsp;<a class="logbox_p">쪽지함</a></div>
							</div>				
						</c:when>
						<c:otherwise>
							<div class="p-2" style="height:150px;">								
								<a href="/login?URI=<%=uri_str %>"><img src="/resources/img/login.jpg" style="width:100%;height:100px;margin-top: 10px;"></a>
								<p class="m-0 p-0">	<input type="button" onclick="window.open('http://localhost:8080/member/search_iden.jsp','','width=500px,height=500px')" class="button_loginpage_mini" id="cursor" value="회원찾기">
									<input type="button" onclick="location.href='join'" class="button_loginpage_mini" id="cursor" value="회원가입">
							</div>							
						</c:otherwise>
					</c:choose>					
				</div>
				
				<div class="grid_item3">
					<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
					  <div class="carousel-inner">
					    <div class="carousel-item active h-100" data-interval="1500">
					      <img src="/resources/img/2.jpg" style="height:150px;" class="d-block w-100">
					    </div>
					    <div class="carousel-item" data-interval="1500">
					      <img src="/resources/img/1.jpg" style="height:150px;" class="d-block w-100">
					    </div>
					    <div class="carousel-item" data-interval="1500">
					      <img src="/resources/img/3.jpg" style="height:150px;" class="d-block w-100">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-target="#carouselExampleInterval" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-target="#carouselExampleInterval" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </button>
					</div>				
				</div>
				<div class="grid_item4"></div>
		
		</div>
		</div>
		
		

<jsp:include page="/include/footer.jsp"/>
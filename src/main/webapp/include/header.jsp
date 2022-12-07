<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<div style="width:1100px; margin: 0 auto;">
	<div class="container">		
		<div class="jumbotron jumbotron-fluid p-0 m-0 bg-white" style="display: flex;">
			<a href="/"><img src="/resources/img/logo.jpg" class="img-fluid col-2" style="height:150px;"></a>
			<form action="/Bloglist.do" class="form-inline my-2 my-lg-0 col-10" method="post">
				<input type="hidden" name="p" value="1">
				<input class="form-control mr-sm-2" id="searchInput" name="search" style="width: 80%;height:50px;" type="search" placeholder="검색어를 입력하세요" aria-label="Search">	
	  			<button class="tomato" id="indextomato"  type="submit"><i class="bi bi-search"></i></button>
	  		</form>					  
		</div>				
	</div> 
	<nav class="navbar p-0 m-0 bg-white bg-opacity-10 text-center">
		<div class="container text-center" style="justify-content: flex-start;">
			<a href="/BMain.do" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">블로그</a>			
			<a href="/BloglistCategory.do?category=1&search=&p=1" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">소개</a>
			<a href="/BloglistCategory.do?category=2&search=&p=1" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">소개</a>
			<a href="/BloglistCategory.do?category=3&search=&p=1" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">소개</a>			
			<a href="/SMain.pn" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">쇼핑</a>
			<a href="/" class="menuitem p-1 m-1 font-weight-bolder text-decoration-none text-dark font-monospace">고객센터</a>			
		</div>
	</nav>	
</div>
</header>
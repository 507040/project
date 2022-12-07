<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String url = request.getParameter("URI");
	String str = request.getQueryString();
 	String querystr=null;
	String URL= null;
	try{
		
		int indexstr=str.lastIndexOf("?"); 	
		out.println(indexstr);
	 	querystr = str.substring(indexstr,str.length()); 	
	 	URL = str.substring(4,indexstr);
	 	if(indexstr != -1){
	 		
	 	}else{
	 		querystr="?";
	 	}
	}catch(Exception e){
		
	}		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/basic.css">
</head>
<body>

<div class="container_body">
<div class="container" align="center">
	<div class="col-md-4 col-md-offset-4">		
		<form class="form-signin" action="Login_Process" method="post">
		<%if(URL==null){%>
			<input type="hidden" name = "URL" value="<%=url%>">
		<%}else{%>
			<input type="hidden" name = "URL" value="<%=URL%>">
			<input type="hidden" name = "str" value="<%=querystr%>">
		<%} %>		
		    <div class="form-group text-center">				
				<a href="/"><img src="/resources/img/login.jpg" class="rounded img-fluid"></a>
			</div>
			<div class="form-group">				
				<input type="text" class="form-control" placeholder="ID" id="logid" name="id" required autofocus>
			</div>
			<div class="form-group">				
				<input type="password" class="form-control" placeholder="password" id="pass"name="pass" required>
			</div>
			<button class="button_loginpage btn bn btn-lg btn-block text-white font-weight-bold" type="submit">로&nbsp;&nbsp;그&nbsp;&nbsp;인</button>
			<span>
			  	<input type="button" onclick="search()" class="button_loginpage_mini" id="cursor" value="회원찾기">
				<input type="button" onclick="location.href='join.jsp'" class="button_loginpage_mini" id="cursor" value="회원가입">
            </span>
		</form>	
	</div>
</div>
</div>

</body>
</html>


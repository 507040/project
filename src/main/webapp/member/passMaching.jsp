<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/top.jsp" %>
<%
String profile=(String)session.getAttribute("profile");
%>
<%=profile %>
<div class="container_body">
	<div class="container" align="center">
		<div class="col-md-12 col-md-offset-12">	
			<div class="jumbotron bg-white">
				<h4 class="text-left mb-2">프로필 수정</h4>
				<p class="text-left" style="color:gray;">프로필을 수정해 보세요</p>
			</div>
			<div>
				<table class="col-12">
					<tr>
						
						
						<%
							if(profile.equals("person.jpg")||profile.trim().equals("person.jpg")){ %>
								<td>
									<img src="/resources/img/profile/<%=profile %>" style="width:auto;height: auto">
								</td>
								<td>
								<span id="img"></span>
									<form id="profileFrom" action="/profile_process.up" method="post" enctype="multipart/form-data">								
										<input type="file" name="uploadFile" >								
										<input type="hidden" name="profileStr" id="profileStr" value="<%=profile %>">
										<button class="btn btn-outline-primary" id="profileUpload">파일업로드</button>	
									</form>
									<a class="btn btn-outline-primary" id="profileDelBtn">삭제</a>
								</td>
							<%}else{%>
								<td>
									<img src="/resources/img/profile/<%=profile %>" style="width:auto;height: auto">
								</td>
								<td>
								<span id="img" ></span>
									<form id="profileFrom" action="/profile_process.up" method="post" enctype="multipart/form-data" >
									<div style="align-items: center;align-content: center;text-align: center;vertical-align: middle;">								
										<input type="hidden" name="uploadFile" >								
										<input type="text" name="profileStr" id="profileStr" value="<%=profile %>" style="width:auto;height: 38px;object-fit:fill;">
										<button class="btn btn-outline-primary m-0" id="profileUpload">파일업로드</button>
									</div>	
									</form>
									<a class="btn btn-outline-primary" id="profileDelBtn">삭제</a>
								</td>
							<%}%>
						
						
					</tr>
					<tr>
						<td colspan="2" class="text-right">
							<a class="btn btn-outline-primary" id="profileCenbtn">취소</a>
							<a class="btn btn-outline-primary" href="profileDBupdate.up?str=<%=profile %>" id="profileSubmitbtn">변경</a> 
						</td>
					</tr>
				</table>
			</div>       	
		</div>			
	</div>
</div>
</body>
<script>
$(document).ready(function(){
	$('#profileCenbtn').on('click',function(){
		//업로드파일명
		var targetFile = $('#profileStr').val();
		//업로드 파일 형태(이미지,일반파일)
		
		
		$.ajax({
			url:"/profile_delete.up",
			//클라이언트에서 서버로 전송(JSON타입)
			data: {fileName:targetFile},
			//서버가 응답처리시 데이터타입
			dataType:"text",
			type:"post",
			success:function(data, status, xhr){
				alert(data+"/"+status+"/"+xhr);
			}
		});//ajax end	

	});
	$("#profileDelBtn").on("click",function(e){//삭제버튼
		//업로드파일명
		var targetFile = $('#profileStr').val();
		//업로드 파일 형태(이미지,일반파일)
		
		
		$.ajax({
			url:"/profile_delete.up",
			//클라이언트에서 서버로 전송(JSON타입)
			data: {fileName:targetFile},
			//서버가 응답처리시 데이터타입
			dataType:"text",
			type:"post",
			success:function(result){
			}
		});//ajax end
		$('#profileStr').hide();
		$('#profileUpload').show();		
	});//.uploadResult end	
});
</script>
</html>;z
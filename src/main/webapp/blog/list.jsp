<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.dto.DTOBoard"%>
<%
ArrayList blA = (ArrayList)request.getAttribute("blistA");
ArrayList blB = (ArrayList)request.getAttribute("blistB");
ArrayList blC = (ArrayList)request.getAttribute("blistC");%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="/include/topSearch.jsp"/>
<div class="listBody">
	<div class="container">  
		<div class="board">
			<div class="category">
			   
			<div class="fir" style="border-bottom: 1px solid #ddd">
				
				<% 
					if(blA!=null){%>
						<h5>카테고리a</h5>
						<%for(int i=0;i<blA.size();i++){
						DTOBoard bA = (DTOBoard)blA.get(i);
						String subjectA = bA.getSubject();
						
						if(subjectA.length()<=20){
							subjectA= bA.getSubject();
						}else{
							subjectA= subjectA.substring(0,20)+".....";
						}
						
					%>	
					<div class="p-3" style="border-bottom: 1px solid #ddd">			
						<div>
							<img style="width:50px;height:50px;border:0px;outline: none;" ><a href="#"><%=bA.getId()%></a>ㅣ<%=bA.getRegDate() %>    
						</div>
						<div style="display:flex;flex-wrap: wrap;">
							<a><img class="col-3"></a><p class="text-break col-9"><a><b><%=subjectA%></b><br><%=bA.getComment()%></a>
						</div>					
					</div> 
					<%}
				}else{%>
					<p class="text-center">게시물이 없습니다...
				<%} %>
				<p class="text-right text-primary mb-0"><a href="/BloglistCategory.do?category=1&search=&p=1">더 보기 + </a>
			</div>               
			     
			<div class="sec" style="border-bottom: 1px solid #ddd">
				
				<% 
					if(blB!=null){%>
					<h5>카테고리b</h5>
					<%
						for(int i=0;i<blB.size();i++){
						DTOBoard bB = (DTOBoard)blB.get(i);
						String subjectB = bB.getSubject();
						
						if(subjectB.length()<=20){
							subjectB= bB.getSubject();
						}else{
							subjectB= subjectB.substring(0,20)+".....";
						}
						
					%>	
					<div class="p-3" style="border-bottom: 1px solid #ddd">			
						<div>
							<img style="width:50px;height:50px;border:0px;outline: none;"><a href="#"><%=bB.getId()%></a>ㅣ<%=bB.getRegDate() %>    
						</div>
						<div style="display:flex;flex-wrap: wrap;">
							<a><img class="col-3"></a><p class="text-break col-9"><a><b><%=subjectB%></b><br><%=bB.getComment()%></a>
						</div>					
					</div> 
					<%}
					
				}else{%>
					<p class="text-center">게시물이 없습니다...
				<%} %>
				<p class="text-right text-primary mb-0"><a href="/BloglistCategory.do?category=2&search=&p=1">더 보기 + </a>
			</div>
			     
			<div class="thi">
				
				<%
					if(blC!=null){%>
					<h5>카테고리c</h5>
					<%
						for(int i=0;i<blC.size();i++){
						DTOBoard bC = (DTOBoard)blC.get(i);
						String subjectC = bC.getSubject();
						
						if(subjectC.length()<=20){
							subjectC= bC.getSubject();
						}else{
							subjectC= subjectC.substring(0,20)+".....";
						}
						
					%>	
					<div class="p-3" style="border-bottom: 1px solid #ddd">			
						<div>
							<img style="width:50px;height:50px;border:0px;outline: none;"><a href="#"><%=bC.getId()%></a>ㅣ<%=bC.getRegDate() %>    
						</div>
						<div style="display:flex;flex-wrap: wrap;">
							<a><img class="col-3"></a><p class="text-break col-9"><a><b><%=subjectC%></b><br><%=bC.getComment()%></a>
						</div>					
					</div> 
					<%}
				}else{%>
					<p class="text-center">게시물이 없습니다...
				<%} %>
				<p class="text-right text-primary mb-0"><a href="/BloglistCategory.do?category=3&search=&p=1">더 보기 + </a>		
			</div>
			
			</div>
		</div>     
	</div>
</div>
</body>
</html>
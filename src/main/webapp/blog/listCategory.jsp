<%@page import="model.dto.DTOPage"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dto.DTOBoard"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");
	ArrayList boardlist = null;
	if(category.equals("1")){
		boardlist = (ArrayList)request.getAttribute("blistA");//블로그 리스트 가져오기
	}else if(category.equals("2")){
		boardlist = (ArrayList)request.getAttribute("blistB");//블로그 리스트 가져오기
	}else if(category.equals("3")){
		boardlist = (ArrayList)request.getAttribute("blistC");//블로그 리스트 가져오기
	}
	
	ArrayList pagelist = (ArrayList)request.getAttribute("page");
%>
<!DOCTYPE html>
<c:set value='<%=session.getAttribute("id") %>' var="masterId"/>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:set value='<%=request.getParameter("category")%>' var="category"/>
<jsp:include page="/include/topSearch.jsp"/>
<div class="mb-2"></div>
<div class="listBody">
	<div class="container">  
		<div class="board">
			<div class="category p-2">
			
			<div class="fir">
			<c:choose>
				<c:when test="${category eq 1}">
					<h5>카테고리a</h5>
				</c:when>
				<c:when test="${category eq 2 }">
					<h5>카테고리b</h5>
				</c:when>
				<c:when test="${category eq 3 }">
					<h5>카테고리c</h5>
				</c:when>
			</c:choose>
				
				<% 
					if(boardlist.size()>=1){
						for(int i=0;i<boardlist.size();i++){
						DTOBoard b = (DTOBoard)boardlist.get(i);
						
						String regDate = b.getRegDate();
	    				Date time=null;
	    				Date day_22=null;				
	
	    				//2일전 날짜
	    				Date today = new Date(); //오늘날짜
	    				Date day2 = new Date(today.getTime() - (long)(1000*60*60*24*2));//오늘 -2일
	    				SimpleDateFormat bbb = new SimpleDateFormat("yyyy-MM-dd");
	    				String day_2 = bbb.format(day2);	            				
						day_22 = new SimpleDateFormat("yyyy-MM-dd").parse(day_2);//2일 전
	    				
						time = new SimpleDateFormat("yyyy-MM-dd").parse(regDate);//게시물 등록일자
	    				
	    				String times= null;
	    				if(time.getTime()>=day_22.getTime()){//2일 내로 등록(신규글)
	    					times = "true";
	    				}else{//2일 보다 전에 등록
	    					times = "false";
	    				}
						
						String subject = b.getSubject();
						if(subject.length()<=20){
							subject= b.getSubject();
						}else{
							subject= subject.substring(0,20)+".....";
						}
						String FidThread= b.getFid()+b.getThread();
						
					%>	
					
					<c:set value="<%=times%>" var="time"/>
					<c:set value="<%=b.getGNS() %>" var="GNS"/>
					<div class="p-3" style="border-bottom: 1px solid #ddd">			
						<div>
							<a data-id="notice"><img style="width:50px;height:50px;border:0px;outline: none;"><%=b.getId()%></a>ㅣ<%=b.getRegDate() %>    
						</div>
						<div style="display:flex;flex-wrap: wrap;">
							<a href="/Myblog.do?list=<%=FidThread%>&bno=<%=b.getBno()%>&id=<%=b.getId()%>" data-master="<%=b.getId() %>" data-name="${GNS}" data-id="notice">
								<img class="col-3">							      
								<p class="text-break col-9">						
									<b><%=subject%>게시물</b>
									<c:if test="${GNS eq 'S'}">
           								<span style="color:gray;font-size:8px;">
           									<i class="bi bi-file-lock"></i>
           								</span>
           							</c:if>
           							<c:if test="${time==true }">
           								<span class="blinking" style="color:tomato;font-size:5px;">new</span>
           							</c:if><br>							
								<%=b.getComment()%>
							</a>
						</div>
						<p class="text-right text-primary mb-0"><a></a>
					</div> 
					<%}
				}else{%>
				
				<div class="col-12">
					<p class="text-center">게시물이 없습니다...</p>
				</div>
				
				<% }%>
			</div>
			
			<div class="col-12">
			
			<%
			if(pagelist!=null){
				DTOPage p = (DTOPage)pagelist.get(0);
				int pageNum = Integer.parseInt(request.getParameter("p"));
			%>
			
			<c:set value="<%=p.getStartPage() %>" var="startPage"/>			
			<c:set value="<%=p.getEndpage()%>" var="endPage"/>
			<c:set value="<%=p.isPrev() %>" var="prev"/>
			<c:set value="<%=p.isNext() %>" var="next"/>
			<c:set value="<%=p.getTotal() %>" var = "total"/>			
			<c:set value="<%=pageNum-1 %>" var="prevPage"/>
			<c:set value="<%=pageNum+1 %>" var="nextPage"/>
			<c:if test="${endPage != 1}">				
				<c:choose>
					<c:when test="${prev==true}">
						&lt;
					</c:when>
					<c:otherwise>
						<a href="/BloglistCategory.do?category=<%=request.getParameter("category") %>&search=<%=request.getParameter("search") %>&p=${prevPage}">&lt;</a>						
					</c:otherwise>				
				</c:choose>				
				<c:forEach var="page" begin="${startPage}" step="1" end="${endPage}">
					<a href="/BloglistCategory.do?category=<%=request.getParameter("category") %>&search=<%=request.getParameter("search") %>&p=${page}" class="col-2" id="paging" data-page="${page}"><c:out value="${page }"/></a>
				</c:forEach>
				<c:choose>
					<c:when test="${next==true}">
						&gt;
					</c:when>
					<c:otherwise>
						<a href="/BloglistCategory.do?category=<%=request.getParameter("category") %>&search=<%=request.getParameter("search") %>&p=${nextPage}">&gt;</a>						
					</c:otherwise>				
				</c:choose>
			</c:if>
			<%}else{
				
			}%>
	
			</div>
		</div>     
	</div>
</div>
<%@include file="/include/footer.jsp"%>
</body>
</html>
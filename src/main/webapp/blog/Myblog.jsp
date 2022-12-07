<%@page import="model.dto.DTOPage"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dto.DTOBoard"%>
<%@page import="model.dto.DTOBlogList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/urimaker.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    ArrayList list = null;
    String FidThread = request.getParameter("list");  		
    ArrayList board = null;
    PrintWriter out2 = new PrintWriter(System.out);
    ArrayList v = null;   
    //int numI=(int)request.getAttribute("i");
    try{
    	if((ArrayList)request.getAttribute("blList")==null){
    		
    	}else{
    		list = (ArrayList)request.getAttribute("blList");
    	}    
    	
    	if(FidThread.equals("0")){//특정게시물 선택 시
    		board = (ArrayList)request.getAttribute("boardlistAll");
        }else{        	
        	board = (ArrayList)request.getAttribute("boardlist");
        }    	
    	if((ArrayList)request.getAttribute("view")==null){
    		
    	}else{
    		v = (ArrayList)request.getAttribute("view");
    	}
    }catch(Exception e){
    	e.getMessage();
    }finally{
    	out2.close();
    }
    
    ArrayList pagelist = (ArrayList)request.getAttribute("page");
    int pNum = 0;
    if(pagelist !=null){
		DTOPage p = (DTOPage)pagelist.get(0);
		pNum = p.getPageNum();
    }
    %>
    
<!doctype html>
<html lang="URF-8">
<c:set value='<%=session.getAttribute("id") %>' var="masterId"/>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title><%=request.getParameter("id") %>님의 블로그</title>




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
    <link href="/resources/css/basic.css" rel="stylesheet">
    <script src='/resources/js/autosize-master/dist/autosize.js'></script>
    <script src="/resources/js/myblog.js"></script>

<style>


</style>
</head>

<body oncontextmenu="return false">
<c:set value='<%=request.getParameter("bno") %>' var="bno"/>
<c:set value='<%=request.getParameter("id") %>' var="id"/>
<c:set value='<%=session.getAttribute("id") %>' var="session_id"/>	
<c:set value='<%=request.getParameter("bno")%>' var="view"/>
<main id="wrapper">
<div class="MyBlog">
    <header class="blog-header pt-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="text-muted" href="/">Home</a>
            </div>
            <div class="col-8 pt-1 text-right">
                <a class="blog_header_text_in" href="/MyBlog">내 블로그</a>
                <a class="blog_header_text_in">이웃 블로그</a>
                
				<%String sessionid= (String)session.getAttribute("id");
				if(sessionid!=null){%>				
					<span class="blog_header_text_in_button" style="font-weight: bold;"><%=session.getAttribute("id")%>님</span>
				<%}else{ %>               		
          			<a href="/login?URI=<%=uri_str %>" class="blog_header_text_in_button" style="background-color: #ddd">로그인</a>
                <%} %>

            </div>
        </div>
        <div style="width:1140px;margin: 0 auto;margin-top: 16px;margin-bottom: 16px;">
            <img src="../imges/testimg.jpg" style="width:1140px;height:150px;margin: 0 auto;margin-top: 16px;margin-bottom: 16px;">


        </div>
    </header>
    <!--<form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" id="searchInput" style="width: 80%" type="search" placeholder="검색어를 입력하세요" aria-label="Search">	
            <button class="btn btn-outline-success my-sm-0" type="submit"><i class="bi bi-search"></i></button>
          </form>-->
    <div class="blog_main row m-0" style="width:1140px;">

        <div class="col-3 text-center m-0 p-0">
            <div style="widht:100%;border:1px solid #999999;border-radius:10px;">
                <img src="../imges/person.jpg" class="img p-2 mb-3" style="width:100%;height:100%;object-fit: fill;">
                <textarea class="text p-2" style="resize: none; border: 0px;width:100%;height:200px" readonly></textarea>
            </div>
            <div class="col-12 p-0 mt-1">
                <div style="border: 1px solid #ddd;" id="cartegory">
                    <p class="text-muted text-left m-0" style="border-radius: 10px;">category
                       <ul style="display: none;">
						<%		
							if(list!=null){
								for(int i=0;i<list.size();i++){
									DTOBlogList d = (DTOBlogList)list.get(i);
									if(d.getThread().equals("1")){%>
										</ul>
										<ul class="mb-1 pl-2" id="<%=d.getFid() %><%=d.getThread()%>" style="list-style:none;"><%=d.getTitle() %> 
										<button id="showbtn" class="<%=d.getFid() %><%=d.getThread()%>show btn btn-sm btn-outline-none m-0 p-0" style="width:10px;height:15px;font-size: 10px;display: none;">
		                            		<i class="bi bi-toggle-off"></i>
		                        		</button>
		                        		<button id="hidebtn" class="<%=d.getFid() %><%=d.getThread()%>hide btn btn-sm btn-outline-none m-0 p-0" style="width:10px;height:15px;font-size: 10px;">                            		
		                            		<i class="bi bi-toggle-on"></i>
		                        		</button>                       		
									<%}else{%>
										<li class="pl-3" name="<%=d.getFid() %><%=d.getThread()%>">
											<a href="/Myblog.do?list=<%=d.getFid()%><%=d.getThread()%>&id=<%=request.getParameter("id")%>">
												<%=d.getTitle() %>
											</a>
										</li>							
									<%}
								}
							}
						%>
                </div>

            </div>
            <div class="col-12 p-0 m-0">
                a

            </div>
        </div>
        <div class="blogContents col-9 m-0 p-0 pl-3 pb-3">
        	<div class="blogConwtentsTextBox">
	            <div class="blogConwtentsText col-12 mb-3 p-3" style="border-radius: 5px;border: 1px solid gray;">
	            	<!-- 전체(특정게시판) 글보기 -->
	            	<c:if test="${view==null}">
		            	<div class="col-12">
		            		<table class="table col-12">
		            			<tr class="text-center">
		            				<th >번호</th>
		            				<th>제목</th>	            				
		            				<th>글쓴이</th>
		            				<th>시간</th>
		            				<th>조회수</th>
		            				<th>추천</th>	       
	            				</tr>     				
		            			<%
		            			if(board!=null){
			            			for(int i=0;i<board.size();i++){ 
			            				DTOBoard d = (DTOBoard)board.get(i);           				
			            				
			            				String regDate = d.getRegDate();
			            				Date time=null;
			            				Date day_22=null;	
			            				String fidthreadList = d.getFid()+d.getThread();
		
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
			            				String regdate = d.getRegDate();
			            				
			            				
			            				if(regdate.length()>10){
			            					regdate = d.getRegDate().substring(0,10);
			            				}
			            				String subject = d.getSubject();
			            				if(subject.length()>20){
			            					subject = d.getSubject().substring(0,20)+".....";
			            				}	            				
			            				%>
			            				
			            				<c:set value="<%=times%>" var="time"/>
			            				<c:set value="<%=d.getGNS()%>" var="GNS"/>
		            				
			            				<tr class="text-center">
			            					<td ><%=i+1 %></td>
			            					<td class="col-6 text-left">
			            						<a href="/Myblog.do?list=<%=fidthreadList%>&bno=<%=d.getBno()%>&id=<%=d.getId()%>&p=<%=pNum %>" data-master="<%=d.getId() %>" data-id="notice" data-name="${GNS}">
			            							<%=subject %>
			            							<c:if test="${GNS eq 'S'}">
			            								<span style="color:gray;font-size:8px;">
			            									<i class="bi bi-file-lock"></i>
			            								</span>
			            							</c:if>
			            							<c:if test="${time==true }">
			            								<span class="blinking" style="color:tomato;font-size:5px;">new</span>
			            							</c:if>
		            							</a>
			            					</td>            					
			            					<td><%=d.getId() %></td>
			            					<td><%=regdate%></td>
			            					<td><%=d.getRef() %></td>
			            					<td><%=d.getUp() %></td>
			   							</tr>		
			            			<%
			            			}
		            			}
		            			else{ %>
		            				<tr class="text-center">
	        							<td colspan="6"> 게시글이 없습니다....</td>
									</tr>	
        						<%} %>
	           				</table>
		            	</div>
		            	<div class="col-12">
			
			<%
			if(pagelist !=null){
				DTOPage p = (DTOPage)pagelist.get(0);
				int pageNum = p.getPageNum();
			%>			
			
			
			<c:set value="<%=p.getStartPage() %>" var="startPage"/>
			<c:set value="<%=p.getEndpage()%>" var="endPage"/>
			<c:set value="<%=p.isPrev() %>" var="prev"/>
			<c:set value="<%=p.isNext() %>" var="next"/>
			<c:set value="<%=p.getTotal() %>" var = "total"/>			
			<c:set value="<%=pageNum-1 %>" var="prevPage"/>
			<c:set value="<%=pageNum+1 %>" var="nextPage"/>				
				<c:choose>
					<c:when test="${prev==true}">
						&lt;
					</c:when>
					<c:otherwise>
						<a href="/Myblog.do?list=<%=request.getParameter("list") %>&id=<%=request.getParameter("id")%>&p=${prevPage}">&lt;</a>						
					</c:otherwise>				
				</c:choose>				
				<c:forEach var="page" begin="${startPage}" step="1" end="${endPage}">
					<a href="/Myblog.do?list=<%=request.getParameter("list") %>&id=<%=request.getParameter("id")%>&p=${page}" class="col-2" id="paging" data-page="${page}"><c:out value="${page }"/></a>
				</c:forEach>
				<c:choose>
					<c:when test="${next==true}">
						&gt;
					</c:when>
					<c:otherwise>
						<a href="/Myblog.do?list=<%=request.getParameter("list") %>&id=<%=request.getParameter("id")%>&p=${nextPage}">&gt;</a>						
					</c:otherwise>				
				</c:choose>			
			
			</div>
			<%} %>
	            	</c:if>
	            	<!-- 전체(특정게시판) 글보기 끝 -->
	            	<!-- 게시글 보기 -->	            	
	            	<c:if test="${view!=null}">
		            	<div>
	           	        	<%
	           	        	if(v!=null){	
	           	        		for(int i=0;i<v.size();i++){ 
	           	        		DTOBoard vl = (DTOBoard)v.get(i);
	           	        	%>
	           	        		
				                <table width=100% align=center border=0 >		                
				                    <tr border=0>
				                        <!-- 제목 -->
				                        <td align=center colspan=2>
				                            <input id="subject" name="subject" class="TextSubjectView" value="<%=vl.getSubject()%>" readonly>
				                        </td>
				                    </tr>
				                    <tr class="ConnentInfo">
				                        <td class="text-left m-0 p-0" style="border-top:1px solid #eee;width:50%">
				                            <span>작성시간 : <%=vl.getRegDate()%></span>
				                        </td>
				
				                        <td class="text-right m-0 p-0" style="border-top:1px solid #eee;">
				                            <div style="display: flex;justify-content: flex-end;">
				                                <span>작성자 : <%=vl.getId()%></span>&nbsp;&nbsp;&nbsp;&nbsp;
				                                <span>조회수 : <%=vl.getRef()%></span>
				                            </div>
				                        </td>
				
				                    </tr>
				
				
				                    <!--내용  -->
				                    <tr>
				                        <td align=center colspan=3>
				
				                            <img src="" width=300>
				
				                            <div></div>
				
				                        </td>
				                    </tr>
				                    <tr border=0>
				                        <td align=center colspan=2>
				
				
				
				                            <textarea id="comment" rows="auto" name="comment" class="text_comment_view" readonly><%=vl.getComment()%></textarea>
				                            
				                            
				                        </td>
				                    </tr>
				
				
				                    <tr border=0>
				                        <!-- 추천 -->
				                        <td align=center colspan=2>
				                            <input id="up" name="up" type="button" onclick="up()" value="추천(<%=vl.getUp()%>)">
				                            <input id="down" name="down" type="button" onclick="down()" value="비추천(<%=vl.getDown()%>)">
				                        </td>
				                    </tr>
				
				
				                    <tr>
				
				                        <td colspan=2>
				
				                            첨부파일:<a href="#" download></a>
				
				                            <span>첨부파일:없음</span>
				
				                        </td>
				
				                    </tr>
				                    <tr>
				                        <td align=right colspan=2>
				                            <a class="btn btn-sm btn-outline-secondary my-0" onclick="uplist_go()"  id="cursor">추천목록</a>
				                            <c:if test="${id eq session_id }">
				                            <a class="btn btn-sm btn-outline-secondary my-0" id="blogUpdateBtn">수정</a>
											</c:if>				                            
				                        </td>
				                    </tr>
				                </table>
			                	<%}
	          	        		} %>
			                <!--댓글-->
			                <div class="row">
			                    <div class="col-12">
			                        <div class="panel panel-default">
			                            <div class="panel-heading">
			                                <i class="bi bi-chat-left-text">&nbsp;&nbsp;</i>댓글(#)<span class="textCount"></span>
			                            </div>
			                            <div class="addReplyBox" style="display: flex;flex-wrap: nowrap;">
			                                <textarea class="replyInputComment" placeholder="100자 이내로 입력하세요"></textarea>
			                                <input type="button" class="addReplyBtn" style="border:1px solid black" value="등록">
			                            </div>
			
			                            <div class="panel-body">
			                                <ul class="chat">
			                                    <li class="left clearfix" data-rno='12'>
			                                        <div>
			                                            <div class="header">
			                                                <strong class="primary-font">user00</strong>
			                                                <small class="pull-right text-muted">2022-10-12 16:20</small>
			                                            </div>
			                                            <p>Good Job!</p>
			                                        </div>
			                                    </li>
			                                </ul>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                <!-- 댓글 리스트 출력 종료 -->
						</div>
						
						
						
					</c:if>
	                <div class="panel-footer">
	
	                </div>
	                <!-- 게시글 보기 끝 -->
	
	             
	
	            </div>
	            <!-- 기능버튼 -->
				<div class="FunctionBtn text-right">
									
					<c:choose >					
						<c:when test="${bno==null}">
							<a class="btn btn-sm btn-outline-secondary my-0" href="/Myblog.do?list=0&id=<%=request.getParameter("id")%>&p=<%=request.getParameter("p")%>">전체목록</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-sm btn-outline-secondary my-0" href="/Myblog.do?list=<%=request.getParameter("list") %>&id=<%=request.getParameter("id")%>&p=<%=request.getParameter("p")%>">목록</a> 
						</c:otherwise>
					</c:choose>					
					<c:choose>
						<c:when test="${id == session_id}">
							<a class="btn btn-sm btn-outline-secondary my-0" id="writeBtn">글쓰기</a>
						</c:when>
					</c:choose>				
					
				</div>		
			</div>
			<!-- 글 수정 -->
			<%
        	if(v!=null){	
        		for(int i=0;i<v.size();i++){ 
        		DTOBoard vl2 = (DTOBoard)v.get(i);
        	%>
        	<div class="updateFromDiv" style="display:none;">
				<form id="updateFrom" name="updateFrom" action="/BoardUpdate.do"  method="post">
				<input type="hidden" name="id" value='<%=request.getParameter("id")%>'>
				<input type="hidden" name="bno" value="<%=vl2.getBno()%>">
					<div class="blogContentsText col-12 mb-3 p-3" style="border-radius: 5px;border: 1px solid gray;">
						<table width=100% align=center border=0>
							<tr>
								<td>
									<select id="ThreadU" name="Thread" class="selectBoxForm">
										<option value="0">분류</option>
										<%
										String caTitle=null;											
										for(int j=0;j<list.size();j++){
											DTOBlogList d = (DTOBlogList)list.get(j);
											if(d.getThread().equals("1")){
												caTitle=d.getTitle();%>
											<%}else{
												String str = d.getFid()+d.getThread(); 
											%>												
												<option value="<%=str%>"<%if(FidThread.equals(str)){%>selected<%}%>><%=caTitle%>-<%=d.getTitle()%></option>
											<%}
										}%>
									</select>
									<select id="categoryU" name="category" class="selectBoxForm">
										<option value="0" <c:if test='<%=vl2.getCategory().equals("0") %>'>selected</c:if>>분류</option>
										<option value="1" <c:if test='<%=vl2.getCategory().equals("1") %>'>selected</c:if>>자유</option>
										<option value="2" <c:if test='<%=vl2.getCategory().equals("2") %>'>selected</c:if>>카테고리A</option>
										<option value="3" <c:if test='<%=vl2.getCategory().equals("3") %>'>selected</c:if>>카테고리B</option>
									</select>
									<select id="GNSU" name="GNS" class="selectBoxForm">
											<option value="G" <c:if test='<%=vl2.getGNS().equals("G") %>'>selected</c:if>>공지</option>
											<option value="N" <c:if test='<%=vl2.getGNS().equals("N") %>'>selected</c:if>>일반</option>
											<option value="S" <c:if test='<%=vl2.getGNS().equals("S") %>'>selected</c:if>>비밀</option>									
										</select>
								</td>	
							</tr> 
							<tr border=0>										
								<td align=center>
									<input id="subjectFormU" name="subjectForm" class="TextSubjectViewForm" placeholder="제목을 입력하세요." value="<%=vl2.getSubject() %>" style="text-align: left;" required>
								</td>
							</tr>
						<!--내용  -->             
							      
							<tr border=0>
								<td align=center colspan=0>	
									<textarea id="commentFormU" rows="auto" name="commentForm" class="text_comment_viewForm" required><%=vl2.getComment() %></textarea>
								</td>
							</tr>
							
							<tr>			
								<td colspan=0>
									<div>
										<!-- <input type="file" name="files" multiple="multiple"> -->
									</div>
								</td>
							
							</tr>								
						</table>
					</div>
					<div class="FunctionBtn text-right">			     
						<a class="btn btn-sm btn-outline-secondary my-0" onclick="document.updateFrom.submit()">수정</a> 
						<a class="btn btn-sm btn-outline-secondary my-0" id="blogUpdateCancel">취소</a>
					</div>
				</form>
				</div>
               	<%}
       	        		} %>
       	        		<!-- 글 수정 끝 -->	
			<!-- 글쓰기 -->
			<%
				String session_id = (String)session.getAttribute("id");
				String session_level = (String)session.getAttribute("level");
				if(session!=null){%>
				<div class="writeFromDiv" style="display:none;">
					<form id="writeFrom" name="writeFrom" action="/BlogWrite.do"  method="post">
					<input type="hidden" name="session_id" value="<%=session_id %>">
					<input type="hidden" name="session_level" value="<%=session_level %>">
						<div class="blogContentsText col-12 mb-3 p-3" style="border-radius: 5px;border: 1px solid gray;">
							<table width=100% align=center border=0>
								<tr>
									<td>
										<select id="Thread" name="Thread" class="selectBoxForm">
											<option value="0">분류</option>
											<%
											String caTitle=null;											
											for(int i=0;i<list.size();i++){
												DTOBlogList d = (DTOBlogList)list.get(i);
												if(d.getThread().equals("1")){
													caTitle=d.getTitle();%>
												<%}else{
													String str = d.getFid()+d.getThread(); 
												%>												
													<option value="<%=str%>"<%if(FidThread.equals(str)){%>selected<%}%>><%=caTitle%>-<%=d.getTitle()%></option>
												<%}
											}%>
										</select>
										<select id="category" name="category" class="selectBoxForm">
											<option value="0">분류</option>
											<option value="1">자유</option>
											<option value="2">카테고리A</option>
											<option value="3">카테고리B</option>
										</select>
										<select id="GNS" name="GNS" class="selectBoxForm">
												<option value="G">공지</option>
												<option value="N" selected>일반</option>
												<option value="S">비밀</option>									
											</select>
									</td>	
								</tr> 
								<tr border=0>										
									<td align=center>
										<input id="subjectForm" name="subjectForm" class="TextSubjectViewForm" placeholder="제목을 입력하세요." style="text-align: left;" required>
									</td>
								</tr>
							<!--내용  -->             
								      
								<tr border=0>
									<td align=center colspan=0>	
										<textarea id="commentForm" rows="auto" name="commentForm" class="text_comment_viewForm" required></textarea>
									</td>
								</tr>
								
								<tr>			
									<td colspan=0>
										<div>
											<!-- <input type="file" name="files" multiple="multiple"> -->
										</div>
									</td>
								
								</tr>								
							</table>
						</div>
						<div class="FunctionBtn text-right">			     
							<a class="btn btn-sm btn-outline-secondary my-0" id="blogSubmitBtn" href="#">등록</a> 
							<a class="btn btn-sm btn-outline-secondary my-0" id="blogCancel">취소</a>
						</div>
					</form>		
					<%} %>

			
        </div>
    </div>
    </div>
</div>
<%@include file="BFooter.jsp"%>
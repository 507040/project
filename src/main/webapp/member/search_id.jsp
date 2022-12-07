<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/dbconn.jsp" %>
<html>
<head>
<script src="/resource/js/search_iden.js"></script>
</head>
<body>
<%
String method = request.getMethod();
PreparedStatement pstmt=null;
String sql=null;
ResultSet rs=null;
String id = null;
int count = 0;
String level=null;
%>
<form id="search_id" name="search_id" action="#" method="post">
	<table width=200 border=1 align=center>	
		<tr>
			<th align=center><b>아이디찾기</b></th>
		</tr>
		<tr align=center>			
			<td>
			 	이름:<input id="sc_name" name="sc_name" value="">								
			</td>
			<td>
			 	전화번호:<input id="sc_phone2" name="sc_phone2" value="">-<input id="sc_phone3" name="sc_phone3" value="">								
			</td>								
		</tr>
		<tr>
			<td style="text-align: right;">
				<input type="button" onclick="search1()" value="검색">				
				<input type="button" onclick="window.close()" value="확인">
			</td>
		</tr>
		<%if(method.equals("POST")||method.trim().equals("POST")){	
			try{
				sql="select count(*) as count, id as id, level as level from member where name=? and phone2=? and phone3=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("sc_name"));
				pstmt.setString(2, request.getParameter("sc_phone2"));
				pstmt.setString(3, request.getParameter("sc_phone3"));
				rs = pstmt.executeQuery();		
				
				if(rs.next()){
					count = rs.getInt("count");				
					id = rs.getString("id");
					level= rs.getString("level");
				}
				out.print(count+"<br>");
				out.print(id+"<br>");
				out.print(level+"<br>");
				
				if(count!=0){//회원있음
					if(id!=null && !level.equals("0")){//일반회원%>
						<tr align=center>
							<td>
								아이디:<c:out value="<%=id %>"/>								
							</td>					
						</tr>
					<%
					}else if(id!=null && level.equals("0")){//탈퇴회원%>
						<tr align=center>
							<td>
								<c:out value="탈퇴한 회원입니다."/>								
							</td>					
						</tr>
						
					<%		
				}else{//회원없음%>
				<tr align=center>
					<td>
						<c:out value="일치하는 회원정보가 없습니다."/>								
					</td>					
				</tr>					
				<%
				}				
				}				
			}catch(Exception e){
				out.println("아이디 찾기 오류"+"<br>");
				out.println(e.getMessage());		
			}finally{
				try{
					if(rs != null){
						rs.close();
					}
					if(rs != null){
						rs.close();
					}
					if(rs != null){
						rs.close();
					}
				}catch(Exception ex){
					out.println("데이터베이스 종료오류"+"<br>");
					out.println(ex.getMessage());
				}
			}			
		}		
		%>	
			
	</table>
</form>
</body>
</html>
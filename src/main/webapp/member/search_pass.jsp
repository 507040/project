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
String pass=null;
int count = 0;
%>
<form id="search_pass" action="search_pass.jsp" method="post">
	<table width=200 border=1 align=center>	
		<tr>
			<th align=center><b>아이디찾기</b></th>
		</tr>
		<tr align=center>
			<td>
				아이디:<input id="sc_name" name="sc_name" value="">
			</td>
			<td>
			 	이름:<input id="sc_name" name="sc_name" value="">								
			</td>
			<td>
			 	전화번호:<select><option value="010">010</option><option value="010">011</option><option value="010">016</option></select><input id="sc_phone2" name="sc_phone2" value="">-<input id="sc_phone2" name="sc_phone3" value="">								
			</td>								
		</tr>
		<tr>
			<td style="text-align: right;">
				<button onclick="search2()">검색</button>
				<input type="button" onclick="window.close()" value="확인">
			</td>
		</tr>
		<%if(method.equals("POST")||method.trim().equals("POST")){	
			try{
				sql="select count(*) as count, pass as pass, from member where id=?,name=?, phone2=?,phone3=?,level!='0'";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("name"));
				pstmt.setString(2, request.getParameter("phone2"));
				pstmt.setString(3, request.getParameter("phone3"));
				rs = pstmt.executeQuery();		
				
				if(rs.next()){
					count = rs.getInt("count");					
					pass = rs.getString("pass");			
					
				}		
				out.print(count+"<br>");
				out.print(pass+"<br>");				
				
				if(count != 0){%>
				<tr align=center>
					<td>
						아이디:<c:out value="<%=pass %>"/>								
					</td>					
				</tr>
				<%}else{%>
					<tr align=center>
						<td>
							<c:out value="일치하는 회원정보가 없습니다."/>								
						</td>					
					</tr>					
				<%
				}		
					
			}catch(Exception e){
				out.println("비밀번호 찾기 오류"+"<br>");
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
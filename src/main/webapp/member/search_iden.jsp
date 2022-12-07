<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table width=300 border=1 align=center>	
	<tr>
		<td colspan=3 align=center><b>회원찾기</b></td>
	</tr>
	<tr align=center>
		<td>
			<button onclick="window.open('http://localhost:8080/member/search_id.jsp','','width=500px,height=500px')">아이디</button>
		</td>
		<td>
			<button onclick="window.open('http://localhost:8080/member/search_pass.jsp','','width=500px,height=500px')">비밀번호</button>
		</td>
		<td>
			<button onclick="window.close()">확인</button>
		</td>
	</tr>
</table>
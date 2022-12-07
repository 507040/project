<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%if(session.getAttribute("id")!=null){response.sendRedirect("/");}//로그인 후 회원가입 페이지 접근 시 메인화면으로 이동%>	
<jsp:include page="/include/top.jsp"/>
<div class="container text-left align-items-center" style="padding-top: 100px;">
	<div class="w-100 p-0 m-0 mb-2 text-center">
		<img src="/resources/img/join.jpg" class="img-fluid mx-3">
	</div>
	
	<form name="Ji" id="Ji" action="join_insert" method="post" class="form-signin">
		<!-- 아이디입력 -->
		<div class="form-group m-0" style="display: flex;justify-content: flex-start;">	
			<label for="inputId" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">아이디</label>
			<div class="input-group mx-3">
				<input type="text" id="inputId" name="inputId" class="form-control" aria-describedby="idHelpBlock" placeholder="UserID" tabindex="1" required>
			        <div class="input-group-prepend">
		            	 <div><a href="/"  class="input-group-text m-0" style="cursor: pointer;text-decoration: none; font-size: 15px; font-weight: 12px;" tabindex="2">중복확인</a></div>
			        </div>
        	</div>			
		</div>
		<!--아이디 유효성검사 경고 -->
		<div class="alert_join">
			<span class="col-sm-2 mx-2 p-0" ></span>
			<input class="alert_st w-100" id="alert_id" value="아이디는 ~~" readonly tabindex="-1" required>
		</div>
		
		<!-- 이름입력 -->
		<div class="form-group sm m-0" style="display: flex;justify-content: flex-start;">
			<label for="inputname" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">이름</label>
			<input type="text" id="inputname" name="inputname" class="form-control mx-3" placeholder="UserName" tabindex="3" required>
		</div>
		<!--이름 유효성검사 경고 -->
		<div class="alert_join sm">
			<span class="col-sm-2 mx-2 p-0" ></span>
			<input class="alert_st w-100" id="alert_nicname" value="아이디는 ~~" readonly tabindex="-1" required>
		</div>
						
		<!-- 닉네임입력 -->
		<div class="form-group sm m-0" style="display: flex;justify-content: flex-start;">
			<label for="inputnicname" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">닉네임</label>
			<input type="text" id="inputnicname" name="inputnicname" class="form-control mx-3" placeholder="NickName" tabindex="4" required>
		</div>
		<!--닉네임 유효성검사 경고 -->
		<div class="alert_join sm">
			<span class="col-sm-2 mx-2 p-0" ></span>
			<input class="alert_st w-100" id="alert_name" value="아이디는 ~~" readonly tabindex="-1" required>
		</div>
		
		
		<!-- 비밀번호입력 -->
		<div class="form-group m-0" style="display: flex;justify-content: flex-start;">	
			<label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">비밀번호</label>
			<input type="password" id="inputPassword" name="inputPassword" class="form-control" aria-describedby="passHelpBlock" placeholder="UserPasswd" style="margin-left: 16px;" tabindex="5" required>
			<a class="pass_see input-group-text p-0" onclick="pass_see()" ><i class="bi bi-eye" id="pass_see_icon" style="font-size: 25px;width:40px;"></i></a>			
		</div>
		<!--비밀번호유효성검사 경고 -->
		<div class="alert_join">
			<span class="col-sm-2 mx-2 p-0" ></span>			
			<input class="alert_st w-100" id="alert_pass"  value="비밀번호는~~" readonly tabindex="-1">				
		</div>
		
		<!-- 비밀번호확인입력 -->
		<div class="form-group m-0" style="display: flex;justify-content: flex-start;">
			<label for="inputPasswordok" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">비밀번호확인</label>
			<input type="password" id="inputPasswordok" name="inputPasswordok" class="form-control mx-3" aria-describedby="passHelpBlock" placeholder="UserPasswd" tabindex="6" required>
		</div>		
		<!--비밀번호 일치여부 경고 -->
		<div class="alert_join">
			<span class="col-sm-2 mx-2 p-0" ></span>			
			<input class="alert_st w-100" id="alert_passok"  value="비밀번호 일치하지 않음" readonly tabindex="-1">				
		</div>
		
		<!-- 주민번호 -->	
		<div class="form-group m-0" style="display: flex;justify-content: flex-start;">
			<label for="securitynumber" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">주민번호</label>
			<div class="input-group mx-3">
			<!-- 주민번호 앞자리 6자리 -->
				<input type="text" class="form-control" id="securitynumber1" name="securitynumber1"  style="border-right: 0px;" placeholder="생년월일 ex)940101" tabindex="7" required>
			        <div class="input-group-prepend">
			          <div class="input-group-text">-</div>
			        </div>
	        <!-- 주민번호 뒷자리 7자리 작성금지-->	        
			    <input type="text" class="form-control" id="securitynumber2" name="securitynumber2" readonly tabindex="8" required>
			        <div class="input-group-prepend"></div>   			
			</div>
		</div>
		<!--주민번호 유효성검사 경고 -->
		<div class="alert_join">
			<span class="col-sm-2 mx-2 p-0" ></span>
			<!--주민번호 앞자리 유효성검사 경고 -->
			<input class="alert_st w-100" id="alert_sn"  value="주민번호 유효하지 않음 숫자만 입력" readonly tabindex="-1">				
		</div>
		
				
		<!-- 전화번호 -->	
		<div class="form-group m-0" style="display: flex;justify-content: flex-start;">
			<label for="inputPhone1" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">전화번호</label>
			<div class="input-group mx-3">
			<!-- 전화번호1 -->
				<input type="text" class="form-control" id="inputPhone1" name="inputPhone1" style="border-right: 0px;" tabindex="9" required readonly="readonly">
				 <select class="custom-select col-sm-1" id="inputphone1sel" onchange="inputPhone1.value=this.value">
		    	<!-- select -->			        			        
			        <option value="010" selected>010</option>
			        <option value="011">011</option>
			        <option value="016">016</option>
			      </select>	
			        <div class="input-group-prepend">
			          <div class="input-group-text">-</div>
			        </div>
	        <!-- 전화번호2 -->
			    <input type="text" class="form-control" id="inputPhone2" name="inputPhone2" style="border-right: 0px;" tabindex="10" required>
			        <div class="input-group-prepend">
			          <div class="input-group-text">-</div>
        			</div>
   			<!-- 전화번호3 -->
        		<input type="text" class="form-control" id="inputPhone3" name="inputPhone3" tabindex="11" required>
      		</div>
		</div>
		<!--전화번호 유효성검사 경고 -->
		<div class="alert_join">
			<span class="col-sm-2 mx-2 p-0" ></span>			
			<input class="alert_st w-100" id="alert_phone1"  value="숫자만 입력" readonly tabindex="-1">				
			<input class="alert_st w-100" id="alert_phone2"  value="숫자만 입력" readonly tabindex="-1">
		</div>
		
		<!-- 주소입력 -->
		<div class="form-group m-0" style="display: flex;justify-content: flex-start;flex-wrap: wrap;">
			<label for="adress1" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">주소</label>
			<div class="input-group mx-sm-3" >
			
			
			<!-- 우편번호찾기 -->
				<input type="text" id="sample6_postcode" name="adress1" placeholder="우편번호" class="form-control  col-2" readonly >
				<a onclick="sample6_execDaumPostcode()" tabindex="12" class="pass_see input-group-text col-1 m-0 p-0" style="vertical-align: middle;align-items:center;height:38px; cursor: pointer;text-decoration: none;font-size: 10px;"><i class="bi bi-search p-2" style="vertical-align: middle;font-size: 25px;"></i><span style="font-weight:bold; font-size:12px;" >Search</span></a>							        
				    <input type="text" id="sample6_address" name="adress2" placeholder="주소" class="form-control" required><br>       		
      		</div>      		
      		<!-- 상세주소//참고항목 -->
      		<div class="input-group mx-sm-3" >
	      		<input type="text" id="sample6_detailAddress" style="border-top:0px" name="adress3" placeholder="상세주소" class="form-control" tabindex="13" required>      		
				<input type="text" id="sample6_extraAddress" style="border-top:0px" name="adress4" placeholder="참고항목" class="form-control" tabindex="14" required>
			</div>
		</div>
		<!--주소 입력 유효성 검사 경고 -->
		<div class="alert_join">					
			<input class="alert_st w-100 mx-3" id="alert_address"  value="상세주소를 입력하세요" readonly tabindex="-1">				
		</div>
		
		<!-- 이메일 -->
		<div class="form-group m-0" style="display: flex;justify-content: flex-start;">
			<label for="inputemail1" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">이메일</label>
			<!-- 이메일1 -->
			<div class="input-group mx-sm-3" >	        
			    <input type="text" class="form-control" id="inputemail1" name="inputemail1" style="border-right: 0px;" placeholder="Email" tabindex="15" required>
			        <div class="input-group-prepend">
			          <div class="input-group-text">@</div>
        			</div>
   			<!-- 이메일2 -->
        		<input type="text" class="form-control" id="inputemail2" name="inputemail2" placeholder="직접입력" tabindex="16" required>        		  
			      <select class="custom-select col-sm-2" id="inputemail2select" onchange="inputemail2.value=this.value" tabindex="17" required>
		    <!-- select -->
			        <option selected>선택</option>			        
			        <option value="naver.com">naver.com</option>
			        <option value="gmail.com">gmail.com</option>
			        <option value="daum.net">daum.net</option>
			      </select>
      		</div>
		</div>
		<!--이메일 입력 유효성검사경고 -->
		<div class="alert_join">
			<span class="col-sm-2 mx-2 p-0" ></span>			
			<input class="alert_st w-100" id="alert_email"  value="이메일 입력하세요" readonly tabindex="-1">
			<input class="alert_st w-100" id="alert_email2"  value="이메일주소 입력/확인하세요" readonly tabindex="-1">				
		</div>
		
		
		<!-- 성별/지역 -->
		<div class="form-group row mb-2 m-0 p-0">			
			<div class="form-check p-0 col-sm-3">
			  <label class="col-sm-4 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">성별</label>
							
			  <input type="radio" name="gender" id="gender" value="1" checked tabindex="18">
				  <label class="form-check-label m-0 p-0">
				    남성
				  </label>		
			  <input type="radio" name="gender" id="gender" value="2" >
				  <label class="form-check-label">
				    	&nbsp;&nbsp;여성
				  </label>
		   </div>	
	    <!--선호지역 -->	       		
		   <div class="form-group p-0 col-sm-6 row">
			  <label for="inputId" class="col-sm-3 col-form-label col-form-label-sm font-weight-bold" style="font-size: 15px;">선호지역</label>        		  
				      <select class="custom-select col-sm-2" id="prisiteselect" name="prisite" onchange="prisite.value=this.value" tabindex="19" required>
			    	<!-- select -->
				        <option value="0" selected>선택</option>			        
				        <option value="1">강원</option>
				        <option value="2">경상</option>
				        <option value="3">부산</option>
				      </select>				     
	    	</div>
      	</div>      	 		      			
		<div class="form-group mb-2 mr-sm-3" style="display: flex;justify-content: flex-end;">
		   <button type="submit" class="btn btn-primary mr-3" tabindex="20">가입</button> 
		   <input type="button" onclick="cancle()" class="btn btn-primary" value="취소" tabindex="21">
		</div>		
	</form>
</div>
</body>
</html>
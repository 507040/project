
$(document).ready(function(){
	$('#inputId').blur(function(){//아이디 유효성 검사	
		var ghkrdls=/^[a-zA-Z0-9]{4,16}$/;
		var regExp = ghkrdls.test($('#inputId').val());		
		if(regExp==true){
			$('#alert_id').css('display','none');
			//ajax 포커스 아웃or클릭 시 데이터베이스 연결 중복확인 버튼 색 변경
			//버튼 색 변경 x 중복확인 하세요
		}else{		
			inputId.focus()
			$('#alert_id').css('display','block');
			return;
		}				
	});
	$('#inputname').blur(function(){//이름 유효성 검사		
		var ghkrdls1=/^[가-힣a-zA-Z]+$/;
		var regExp1 = ghkrdls1.test($('#inputname').val());			
		if(regExp1==true){
			$('#alert_name').css('display','none');
		}else{		
			inputname.focus()
			$('#alert_name').css('display','block');
			return;
		}		
	});
	$('#inputnicname').blur(function(){//이름 유효성 검사		
		var ghkrdls10=/^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{1,20}$/
		var regExp10 = ghkrdls10.test($('#inputnicname').val());			
		if(regExp10==true){
			$('#alert_nicname').css('display','none');
		}else{		
			inputnicname.focus()
			$('#alert_nicname').css('display','block');
			return;
		}		
	});
	$('#securitynumber1').blur(function(){//주민번호 유효성 검사		
		var ghkrdls2=/^[0-9]{6}$/;
		var regExp2 = ghkrdls2.test($('#securitynumber1').val());			
		if(regExp2==true){
			$('#alert_sn').css('display','none');
		}else{		
			securitynumber1.focus()
			$('#alert_sn').css('display','block');
			return;
		}		
	});
	/*$('#securitynumber2').blur(function(){//주민번호뒷자리 유효성 검사		
		var ghkrdls2=/^[0-9]{6}$/;
		var regExp2 = ghkrdls2.test($('#securitynumber2').val());			
		if(regEXP2==true){
			$('#alert_sn').css('display','none');
		}else{		
			inputname.focus()
			$('#alert_sn').css('display','block');
		}		
	});*/		
	$('#inputPassword').blur(function(){//비밀번호 유효성 검사		
		var ghkrdls3=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&S]{8,20}$/;
		var regExp3 = ghkrdls3.test($('#inputPassword').val());			
		if(regExp3==true){
			$('#alert_pass').css('display','none');
		}else{		
			inputPassword.focus()
			$('#alert_pass').css('display','block');
			return;
		}		
	});
	$('#inputPasswordok').blur(function(){//비밀번호확인 유효성 검사
		var pass =	$('#inputPassword').val();
		var passok =	$('#inputPasswordok').val();		
		if(pass!=passok){
			inputPasswordok.focus()
			$('#alert_passok').css('display','block');
			return;			
		}else{
			$('#alert_passok').css('display','none');			
		}		
	});	
	$('#inputPhone2').blur(function(){//전화번호2 유효성 검사		
		var ghkrdls4=/^[0-9S]{3,5}$/;
		var regExp4 = ghkrdls4.test($('#inputPhone2').val());			
		if(regExp4==true){
			$('#alert_phone1').css('display','none');
		}else{		
			inputPhone2.focus()
			$('#alert_phone1').css('display','block');
			return;
		}		
	});
	$('#inputPhone3').blur(function(){//전화번호3 유효성 검사		
		var ghkrdls5=/^[0-9S]{3,5}$/;
		var regExp5 = ghkrdls5.test($('#inputPhone3').val());			
		if(regExp5==true){
			$('#alert_phone2').css('display','none');
		}else{		
			inputPhone3.focus()
			$('#alert_phone2').css('display','block');
			return;
		}		
	});
	$('#sample4_detailAddress').blur(function(){//상세주소 유효성 검사					
		if($('#sample4_detailAddress').val().length<1){
			sample4_detailAddress.focus()
			$('#alert_address').css('display','block');
			return false;
		}else{			
			$('#alert_address').css('display','none');
			return true;
		}		
	});	
	$('#inputemail1').blur(function(){//이메일아이디유효성 검사	
		var ghkrdls6=/^[a-zA-Z0-9]{4,16}$/;
		var regExp6 = ghkrdls6.test($('#inputemail1').val());		
		if(regExp6==true){
			$('#alert_emai').css('display','none');
		}else{		
			inputemail1.focus()
			$('#alert_emai').css('display','block');
			return;
		}				
	});
	$('#inputemail2').blur(function(){//이메일주소 유효성 검사	
		var ghkrdls7=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var regExp7 = ghkrdls7.test($('#inputemail2').val());		
		if(regExp7==true){
			$('#alert_email2').css('display','none');
		}else{		
			inputemail2.focus()
			$('#alert_email2').css('display','block');
			return;
		}				
	});
	
});

//유효성 검사 submit 
//function joinup(){//빈칸 확인 및 insert 
	//if(nullcheck(inputid.value,"아이디")==flase){
	//	return ture;
//	}
//}
	
function cancle(){
	if(confirm("취소 하시겠습니까")){
		history.back();
	}else{
		return;
	}
}
	

function pass_see(){
	$(document).ready(function(){
		$()
	});
}


/*function check(regExp,e){
		if(regExp.test(e.value)){
			return true;
		}else{		
			return false;
		}
	}*/
	function nullcheck(v,checkmsg){//곻백이면 true
			if(!v){
				alert(checkmsg+"를(을) 입력하세요");
				e.select();
				e.focus();
				return false;
			}
		return ture;
	}
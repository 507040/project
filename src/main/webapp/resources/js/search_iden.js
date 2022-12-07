function search1(){
	if (sc_name.value==""){
		alert("이름입력하세요")
		sc_name.focus();
		return false;
	}
	if (sc_phone2.value==""){
		alert("전화번호 입력하세요")
		sc_phone2.focus();
		return false;
	}	
	if (sc_phone3.value==""){
		alert("전화번호 입력하세요")
		sc_phone3.focus();
		return false;
	}
	
	document.search_id.submit();
}

function search2(){
	if(sc_name.value == ""){
		alert("아이디 입력")
		sc_name.focus();
		return false;
	}
	if(sc_id.value == ""){
		alert("이름 입력")
		sc_id.focus();
		return false;
	}
	if(sc_phone2.value == ""){
		alert("전화번호 입력")
		sc_phone2.focus();
		return false;
	}if(sc_phone3.value == ""){
		alert("전화번호 입력")
		sc_phone3.focus();
		return false;
	}
	document.search_pass.submit();
}
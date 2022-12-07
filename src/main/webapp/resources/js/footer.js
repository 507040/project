function site_goa(){	
	if(site_url.value==0){					
	}else if(site_url.value=="naver"){
		location.href="https://www.naver.com/"
	}else if(site_url.value=="daum"){
		location.href="https://www.daum.net/"
	}else if(site_url.value=="google"){
		location.href="https://www.google.com/"
	}else if(site_url.value=="nate"){
		location.href="https://www.nate.com/"
	}
}

$(document).ready(function(){			
		//footer margin
		var footerhei = $('warpper').outerHeight(true);
		$('.footer').css('margin-top',footerhei);
	
});
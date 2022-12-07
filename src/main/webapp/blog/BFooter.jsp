<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

</main>
<footer >
	<div class="text-center">
    	Footer
    </div>
</footer>
</body>

 
    <script>
    autosize(document.querySelectorAll('textarea')); //textarea자동 높이 변경
    $(document).ready(function(){//footer위치
		//footer margin
		var footerhei = $('warpper').outerHeight(true);
		$('.footer').css('margin-top',footerhei);	
		$(function(){
			$('a[data-id="notice"]').on('click',function(e){				
				var GNS= $(this).data('name');				
				
				var masterid = $(this).data('master');//글쓴이
				var masterId = "${masterId}";//로그인된 계정 아이디

				if(GNS==="S"){
					if(masterid == masterId){
					
					}else{
						e.preventDefault();
						alert("비밀글 입니다");			
					}						
				}
							
			});
		});
	});
    </script>
</html>
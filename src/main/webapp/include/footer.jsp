<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/footer.js"></script>
</main>
 <footer>     
	<div class="jumbotron jumbotron-fluid m-0 p-0 text-muted">
		<div class="foot_flex">
			<div class="foot_flex_1">
				<p class="foot_p"><b>Creartors</b>&nbsp;크리에이터&nbsp;정유락
				<p class="foot_p"><b>email</b>&nbsp; wjddbfkr@gmail.com&nbsp;adress&nbsp;동래구.......a        
			</div>				
			<div class="foot_flex_2 text-center">
				<p>as
			</div>
			<div class="foot_flex_3 text-right">
				<span>관련 사이트<br></span>	        		        	
		        	<select class="form-select form-select-sm item-center" aria-label=".form-select-sm form-select-primary example" id="site_url" name="site_url" style="width:100px;">
		        		<option value="0">선택</option>
		        		<option value="naver">네이버</option>
		        		<option value="daum">다음</option>
		        		<option value="google">구글</option>
		        		<option value="nate">네이트</option>	        	        		
		        	</select>	
	       		<input type="button" class="btn btn-outline-secondary btn-sm" aria-label=".form-select-sm example" onclick="site_goa()" value="이동">
       		</div>		
		</div>
	</div>		
</footer>

<script>    
    $(document).ready(function(){//footer위치
		//footer margin
		$(function(){
			$('#myintro').on('click', function (e) {
				e.preventDefault();
				$('#myModal').show();
			});			
		});
		
			
		$(function(){
			$('a[data-id="notice"]').on('click',function(e){				
				var GNS= $(this).data('name');			
				var masterid = $(this).data('master');//글쓴이
				var masterId = "${masterId}";//로그인된 계정 아이디
				//alert(masterid);
				//alert(masterId);

				if(GNS==="S"){
					if(masterid == masterId){
					
					}else{
						e.preventDefault();
						alert("비밀글 입니다");			
					}						
				}
							
			})
			
		
				
			
		});
	});
    </script>
</body>
</html>

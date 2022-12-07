<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</body>
<footer>
    footer
</footer>
<script>
 $(document).ready(function(){//footer위치
		//footer margin
		var footerhei = $('warpper').outerHeight(true);
		$('.footer').css('margin-top',footerhei);	
	});
 </script>
</html>

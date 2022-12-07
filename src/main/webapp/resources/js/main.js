$(document).ready(function(){
		//include/header/검색버튼 크기
		var hei = $('#searchInput').outerHeight();
		$('#indextomato').css('height',hei);
		$('#indextomato').css('width',hei);
		
		//topfix margin
		var listhei = $('#topfix').outerHeight(true);
		$('.listBody').css('margin-top',listhei);
		
		
		var page=$("a[id='paging']").data('page');		
		if(page ==0){
			$("a[data-page=0]").css('display','none');		
		}
	
});
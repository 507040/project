$(document).ready(function() {	
	//SMain슬라이드 관련
	let intervalA = setInterval(HeaderSlid,2000);    
    let intervalb = setInterval(RsideSlid,3000);
    let intervalc = setInterval(BrandsideSlid,3000);
    
    function HeaderSlid(){
        $('#ticker li:first').animate({marginTop: '-20px'}, 400, function(){  
        	$(this).detach().appendTo('ul#ticker').removeAttr('style');
        });
    }
    function RsideSlid(){
        $('#ticker_rside li:first').animate({marginLeft: '-500px'}, 400, function(){  
            $(this).detach().appendTo('ul#ticker_rside').removeAttr('style');
        });
    }
    function BrandsideSlid(){
        $('#ticker_brand li:first').animate({marginLeft: '-500px'}, 400, function(){  
            $(this).detach().appendTo('ul#ticker_brand').removeAttr('style');
        });
    }
    $('#ticker').mouseover(function(){
        clearInterval(intervalA);
    });
    $('#ticker_rside').mouseover(function(){
        clearInterval(intervalb);
    });
    $('#ticker_brand').mouseover(function(){
        clearInterval(intervalc);
    });
    $('#ticker').mouseout(function(){
        intervalA = setInterval(HeaderSlid,2000);  
    });  
    $('#ticker_rside').mouseout(function(){
        intervalb = setInterval(RsideSlid,3000);
    });  
    $('#ticker_brand').mouseout(function(){
        intervalc = setInterval(BrandsideSlid,3000);
    });      
	//SMain슬라이드 관련 끝

	//cart 
	//cart 배송카테고리 버튼
    $('.Select').on("click",function(e){
        $(".Sel_Ac").removeClass("Sel").addClass("Sel");
        $(e.target).parent().removeClass('Sel');
        $(e.target).parent().addClass('Sel_Ac');            
    })
    //cart끝
    
  });  
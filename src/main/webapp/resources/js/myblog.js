//새로고침 방지
/*function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;*/

$(document).ready(function() {
	$(function(){
		$("a[data-id='notice']]").on('click',function(e){
			var GNS= $(this).data('name');
			alert(GNS)			
			if(GNS==="S"){
				e.preventDefault();
				alert("비밀글입니다.");
				
			}
						
		})
	});
	 
	$(function(){ //li숨기기
		$("button[id='hidebtn']").on('click',function(e){
			$targetId = e.target;//e.target.id;
			var ulidhide= $(this).parent().attr('id');//$targetId.data('name');
			//alert(ulidhide);
			var btnshow="."+ulidhide+"show";//btnshow
			var btnhide="."+ulidhide+"hide";//btnhide
			//alert(btnshow);
			$("ul[id='"+ulidhide+"']").children('li').hide();
			//$("ul[id='"+ulid+"']").children("button['id=hidebtn']").hide();
			//$("ul[id='"+ulid+"']").children("button['id=showbtn']").show();
			$(btnshow).show();//btnshow - show
			$(btnhide).hide();//btnhide - hide
			
		});
	});
	$(function(){//li보이기
		$(document).on('click',"button[id='showbtn']",function(e){
			$targetId = e.target;//e.target.id;
			var ulidshow= $(this).parent().attr('id');//$targetId.data('name');
			//alert(ulidshow);
			var btnshow="."+ulidshow+"show";//btnshow
			var btnhide="."+ulidshow+"hide";//btnhide
			//alert(btnshow);
			
			$("ul[id='"+ulidshow+"']").children('li').show();
			$(btnshow).hide();//btnshow - hide
			$(btnhide).show();//btnhide - show
		});
	});
	
	//글쓰기 submit	
	$('.TextSubjectViewForm').focusin(function(){
	    $('.TextSubjectViewForm').css('border','0px');
	});
	$('#Thread').focusin(function(){
	    $('#Thread').css('border','1px solid gray');
	});
	$('#category').focusin(function(){
	    $('#category').css('border','1px solid gray');
	});
	
	
	//글쓰기 유효성검사
	$(function(){
		$("#blogSubmitBtn").on('click',function(e){
			e.preventDefault();
			var subject = $('.TextSubjectViewForm').val();
			var $thread = $('#Thread').val();
			var $category = $('#category').val();
			
			if($thread==="0"){
				$('#Thread').css('border','1px solid red');
				                   
		        return;//.equals(
			}
			if($category==="0"){
				$('#category').css('border','1px solid red');
				                   
		        return;
			}
		   
		    if(!subject.trim()){	
		       $('.TextSubjectViewForm').css('border','1px solid red');                   
		        return;                    
		    }
				$("form[name='writeFrom']").submit();	
		
			
			
		});
	})
	//글쓰기 페이지
	$('#writeBtn').on('click',function(e){
		e.preventDefault();
		$(".blogConwtentsTextBox").hide();//글보기 숨기기		
		$(".writeFromDiv").css('display',"block");//글쓰기 보이기
		//글쓰기 창으로 스크롤 이동
		$(".TextSubjectViewForm").focus();//제목에 포커스
		$(".TextSubjectViewForm").blur();//포커스 빼기
		 
	});
	//글쓰기 취소
	$('#blogCancel').on('click',function(e){
		e.preventDefault();
		$('#Thread').val("0");
		$('#category').val("0");
		$('#GNS').val("N");
		$('#subjectForm').val("");
		$('#commentForm').val("");
		$(".blogConwtentsTextBox").show();//글보기 보이기
		$(".writeFromDiv").css('display',"none");//글쓰기 숨기기
		$('.updateFromDiv').css('display','none');//글 수정 숨기기
		
	});
	//글 수정
	$('#blogUpdateBtn').on('click',function(e){
		e.preventDefault();
		$(".blogConwtentsTextBox").hide();//글보기 숨기기		
		$(".writeFromDiv").hide();//글쓰기 숨기기
		$('.updateFromDiv').css('display','block');//글 수정 보이기
		//글쓰기 창으로 스크롤 이동
		$("#subjectFormU").focus();//제목에 포커스
		$("#subjectFormU").blur();//포커스 빼기		 
	});
	//글 수정 취소
	$('#blogUpdateCancel').on('click',function(e){	
		e.preventDefault();		
		$(".blogConwtentsTextBox").show();//글보기 보이기
		$(".writeFromDiv").css('display',"none");//글쓰기 숨기기
		$('.updateFromDiv').css('display','none');//글 수정 숨기기		
		 location.reload();
	});
			
          
            
    //댓글 글자수 제한
	var textarea = $('.replyInputComment');
	$(function() {
	    $('.replyInputComment').keyup(function(e) {
	
	        var content = $('.replyInputComment').val();
	
	        if (content.length == 0 || content == '') {
	            $('.textCount').text('');
	        } else {
	            $('.textCount').text('(' + content.length + ' / 100)');
	        }
	
	        // 글자수 제한
	        if (content.length >= 100) {
	            // 100자 부터는 타이핑 되지 않도록
	            $(this).val($(this).val().substring(0, 100));
	            // 100자 넘으면 경고
	            $('.textCount').text('(100 / 100)');
	            $('.textCount').css('color', 'red');
	        } else {
	            $('.textCount').css('color', '#aaa');
	        };
	
	    });
	});
    //댓글달기 버튼 높이
    $('.addReplyBtn').css('height',$('.replyInputComment').outerHeight())
    
    $(document).on('.addReplyBtn', 'click', function(e) {
        e.preventDefault();
    })
    
	var page=$("a[id='paging']").data('page');		
	if(page ==0){
		$("a[data-page=0]").css('display','none');		
	}
    
            // $("#myModal").modal("show");
            /*$("button[id='aaaa']").click(function(){
                $('#bbbb').hide();
                $("button[id='aaaa']").hide();
                $("button[id='dddd']").show();          */

            /*$('#bbbb').removeClass("nomal");     
            $('#bbbb').addClass('hidden');
            $("button[id='aaaa']").removeClass("nomal");     
            $("button[id='aaaa']").addClass('hidden');
            $("button[id='dddd']").removeClass('hidden');     
            $("button[id='dddd']").addClass('nomal');*/
            //});
            /*$("button[id='dddd']").click(function(){
                 $('#bbbb').show();
                 $("button[id='dddd']").hide();
                 $("button[id='aaaa']").show();*/

            /*$('#bbbb').removeClass("hidden");               
            $('#bbbb').addClass('nomal');
            $("button[id='dddd']").removeClass("nomal");     
            $("button[id='dddd']").addClass('hidden');
            $("button[id='aaaa']").removeClass("hidden");     
            $("button[id='aaaa']").addClass('nomal');*/
            //});                  
            /* $("button[id='cccc']").click(function() {
                 i++;
                 ACNum = ACNum + i;
                 $("#cartegory").append("<ul id='" + ac + "'><li><span>asdasd<button id='" + ac + "' class='cartegory btn btn-sm btn-outline-none m-0 p-0' style='width:10px;height:15px;font-size: 5px;'><i class='bi bi-x-circle' ></i></button><button  id='" + ac + "' class='cartegory btn btn-sm btn-outline-none hidden m-0 p-0' style='width:10px;height:15px;font-size: 5px;'><i class='bi bi-plus-circle'></i></button></span></li></ul>")
             });
             $(".cartegory").click(function(e) {
                 var ulId = $(e.target).attr(id)

                 $(".'" + ulID + "'").children().hide();
             });
             parent*/
        });

        
        
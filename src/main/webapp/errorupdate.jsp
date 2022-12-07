<%@page import="model.dto.DTOBlogList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="controller.BlogListController" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%	session.setAttribute("blog_id", "test");
       String blogid = (String)session.getAttribute("blog_id");
       ArrayList b = null;
       b = (ArrayList) request.getAttribute("blist");
    %>
    <%=blogid %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
	
	<div class="col-12 p-0 mt-1">
		<div style="border: 1px solid #ddd;" id="cartegory">
    		<p class="text-muted text-left m-0" style="border-radius: 10px;">category
    		<!-- 대분류 추가 -->
    		<button id='Pul' class='btn btn-sm btn-outline-none hidden m-0 p-0' style='width:10px;height:15px;font-size: 5px;'>
    			<i class='bi bi-plus-circle'></i>
    		</button>
<%
	if(b != null){
		int i = 0;//ul
		int j = 0;//li
		int num1 =  0;;//AC
		int num2 =  0;;//ACAC
		int size = b.size()-1;
		int num3 =0;
		
		while(true){
			DTOBlogList n = (DTOBlogList) b.get(size);
			String fidd = n.getFid();
			char charfid = fidd.charAt(0);
			int fidNum = (int)charfid;
			num1 = fidNum;
			String threadd = n.getThread();
			char charthreadd = threadd.charAt(0);
			int threadNum = (int)charthreadd;
			num2 = threadNum;			
			break;
		}	
		for(i=65;i<=num1;i++){			
			DTOBlogList n = (DTOBlogList) b.get(1);%>
			<ul id='<%=n.getFid()%><%=n.getThread()%>'>	<%=num1 %><%=num2 %>
				<%for(j=97;j<=num2;j++){%>						
					<li id='<%=n.getFid()%><%=n.getThread()%>'>	<%=n.getFid()%><%=n.getThread()%>						
						<input id='<%=n.getFid()%><%=n.getThread()%>' value='<%=n.getTitle()%>'><%=n.getFid()%><%=n.getThread()%></a><button name='cartegory' class='btn btn-sm btn-outline-none hidden m-0 p-0' style='width:10px;height:15px;font-size: 5px;'>
    			<i class='bi bi-plus-circle'></i>
    		</button>							
					</li>
				<%num3++;
				}%>
			</ul>   
			              	
			<%
		}	
	}
	%>


                    
                  
                    
		</div>
	</div>
	<script> 
	var ACNum=65; //대분류 A
	  var ACNumLi=96;//소분류 a
	  var i = 0;//대분류
	  var j = 0;//소분류
	  var x = 0;
	  var AC =null;

  $(document).ready(function(){
	         $("button[id='aaaa']").click(function(){
           $('#bbbb').hide();
           $("button[id='aaaa']").hide();
           $("button[id='dddd']").show();
       });
      $("button[id='dddd']").click(function(){
           $('#bbbb').show();
           $("button[id='dddd']").hide();
           $("button[id='aaaa']").show(); 
       });     
      
      $(document).on("click","button[id='Pul']",function(){//대분류 추가    	        	     
      	    	  
        AC = String.fromCharCode(ACNum+i);//
      	alert(AC);
        $("#cartegory").append("<ul id='"+AC+"'><input name='title' type='text' placeholder='게시판 제목 입력'><button type='button' name='cartegory' class='btn btn-sm btn-outline-none m-0 p-0' id='"+AC+"' style='width:10px;height:15px;font-size: 5px;'><i class='bi bi-x-circle' ></i></button><button type='button' name='delete' id='"+AC+"'>삭제</button></ul>");
        i++;
        j=0;
   	  });
      
      	$(document).on("click","button[name='delete']",function(e){//대분류 삭제
      		
      	  var deleteDocument = $(e.target).attr('id');
      	  alert(deleteDocument);
      	  $('ul[id="'+deleteDocument+'"]').empty();
      		
      	});     	
      	
      	
	    $(document).on("click","button[name='cartegory']",function(f){//소분류 추가
	    	  j++;
	    	  var ACLi = String.fromCharCode(ACNumLi+j);
	          var cartegoryUl = $(f.target).attr('id');   
	          var ACACli= AC+ACLi;
	          alert(AC+ACLi);	          
	          var fid = ACACli.substring(0,1);
	          var thread = ACACli.substring(1,2);
	          $('ul[id="'+AC+'"]').append("<li id='"+ACACli+"'><input type='hidden' name='id' value='<%=session.getAttribute("blog_id") %>'><input type='hidden' name='fid' value='"+fid+"'><input type='hidden' name='thread' value='"+thread+"'><input type='text' id='"+ACACli+"' name='"+ACACli+"' placeholder='게시판(소) 제목 입력'><button type='button' name='cartegorySm' id='"+ACACli+"'>삭제</button></li>");
	          
	          var form = new FormData();        
	          form.append("id","<%=session.getAttribute("blog_id") %>");
	          form.append("fid",fid);
	          form.append("thread",thread);
	         	          
	          var url = "http://localhost:8080/addlist.bl";
	          $.ajax({
	              type:"POST",
	              url:url,
	              dataType:"text",
	              data:{
	            	  id : "<%=session.getAttribute("blog_id") %>",
	                  fid : fid,
	                  thread : thread,
	                  GNS : "N"
	              },
	              success : function(data){
	
	              },
	              error : function(request,status,error){
	                  
	              }
	          
	          
	         /* $.ajax({
	      		url:"/addlist.bl", 
	      		processData:false,
	      		type: "post",
	      		datatype:"JSON",
	      		data:form,
	      		success:function(result){
	      			console.log(result);
	      		},
	          	error:function(result){
	      			console.log(result);
	      		}
	          
	      		});*/
	          
	      	});
	    });    
	    
	    $(document).on("click","button[name='cartegorySm']",function(g){//소분류 삭제
	    	  
	      	  var deleteDocumentSm = $(g.target).attr('id');
	      	  alert(deleteDocumentSm);
	      	  var fid = deleteDocumentSm.substring(0);
	      	  var thread = deleteDocumentSm.substring(1);
	      	  $('li[id="'+deleteDocumentSm+'"]').detach();
	      	  
	      	 var url = "http://localhost:8080/deletelist.bl";
	          $.ajax({
	              type:"POST",
	              url:url,
	              dataType:"text",
	              data:{
	            	  id : "<%=session.getAttribute("blog_id") %>",
	                  fid : fid,
	                  thread : thread,	                  
	              },
	              success : function(data){
	
	              },
	              error : function(request,status,error){
	                  
	              }
	      	  
      		});
	    });
      
 });
</script>
</body>
</html>


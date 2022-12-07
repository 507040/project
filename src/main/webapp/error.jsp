<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dto.DTOBoard"%>
<%@page import="model.dto.DTOBlogList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/urimaker.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    ArrayList list = (ArrayList)request.getAttribute("blList");
    String FidThread=null;    		
    ArrayList board = null;
    try{
    	FidThread = request.getParameter("list");
    	if(FidThread.equals("0")){//특정게시물 선택 시
    		board = (ArrayList)request.getAttribute("boardlistAll");
        }else{        	
        	board = (ArrayList)request.getAttribute("boardlist");
        }    	
    }catch(Exception e){
    	out.println(e.getMessage());
   	}
    
    
    %>
    

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<body>

    <div class="col-12 p-0 mt-1">
        <div style="border: 1px solid #ddd;" id="Notice">
                    <p class="text-muted text-left m-0" style="border-radius: 10px;">category
               			<button id="Pul" class="btn btn-sm btn-outline-none m-0 p-0" style="width:10px;height:15px;font-size: 10px;">                            		
                       		<i class="bi bi-toggle-on"></i>
                   		</button>
               		</p>
                       <ul class="testul" style="display: none;">
						<%						                    	
						for(int i=0;i<list.size();i++){
							DTOBlogList d = (DTOBlogList)list.get(i);
							if(d.getThread().equals("1")){%>
								</ul>
								<ul id="<%=d.getFid() %><%=d.getThread()%>"><%=d.getTitle() %> 
								<button id="del" class="<%=d.getFid() %><%=d.getThread()%>show btn btn-sm btn-outline-none m-0 p-0" style="width:10px;height:15px;font-size: 10px;display: none;">
                            		<i class="bi bi-toggle-off"></i>
                        		</button>
                        		<button id="mincartegory" class="<%=d.getFid() %><%=d.getThread()%>hide btn btn-sm btn-outline-none m-0 p-0" style="width:10px;height:15px;font-size: 10px;">                            		
                            		<i class="bi bi-toggle-on"></i>
                        		</button>                       		
							<%}else{%>
								<li name="<%=d.getFid() %><%=d.getThread()%>"><a href="/Myblog.do?list=<%=d.getFid() %><%=d.getThread()%>"><%=d.getTitle() %></a> </li>							
							<%}
						}%>
                </div>
    </div>
    <script>
        var ACNum = 65; //대분류 A
        var ACNumLi = 96; //소분류 a
        var i = 0; //대분류
        var j = 0; //소분류
        var x = 0;
        var asdasd = 

        $(document).ready(function() {
            /* $("button[id='aaaa']").click(function() {
                $('#bbbb').hide();
                $("button[id='aaaa']").hide();
                $("button[id='dddd']").show();
            });
            $("button[id='dddd']").click(function() {
                $('#bbbb').show();
                $("button[id='dddd']").hide();
                $("button[id='aaaa']").show();
            }); */

            $(document).on("click", "button[id='Pul']", function(e) { //대분류 추가
                var posturl = "http://localhost:8080/addlist.bl";                
	            var data = '[]';
	            	


                $.ajax({
                    type: "POST",
                    url: posturl,                    
                    data: {
                        "id": '<%=session.getAttribute("id")%>',
                        "fid":'A',                        
                        "GNS": 'N'
                        },                                        
                    success : function(data){							 
						alert(data);
                    	
                    },
                    error: function(request, status, error) {
                    	console.log(request);
                    	console.log(status); 
                    	console.log(error); 
                    }
                });
            });     
               

            $(document).on("click", "button[name='delete']", function(e) { //대분류 삭제

                var deleteDocument = $(e.target).attr('id');
                alert(deleteDocument);
                $('ul[id="' + deleteDocument + '"]').empty();

            });


            $(document).on("click", "button[name='mincartegory']", function(f) { //소분류 추가
                j++;
                var ACLi = String.fromCharCode(ACNumLi + j);
                var cartegoryUl = $(f.target).attr('id');
                var ACACli = cartegoryUl + ACLi;
                alert(cartegoryUl + ACLi);
                var fid = ACACli.substring(0, 1);
                var thread = ACACli.substring(1, 2);
                var charthread = thread.charAt(0);				
                $('ul[id="' + cartegoryUl + '"]').append("<li id='" + ACACli + "'><input type='text' id='" + ACACli + "' name='" + ACACli + "' placeholder='게시판(소) 제목 입력'><button type='button' name='cartegorySm' id='" + ACACli + "'>삭제</button></li>");
                
                
				
                var url = "http://localhost:8080/addlist.bl";
                $.ajax({
                    type: "POST",
                    url: url,
                    dataType: "text",
                    data: {
                        id: "<%=session.getAttribute("blog_id")%>",
                        fid: $(f.target).attr('id'),
                        thread: "a",
                        GNS: "N"
                    },
                    success: function(data) {
                    	
                    	
                    },
                    error: function(request, status, error) {

                    }
                });
                
                
            });

            $(document).on("click", "button[name='cartegorySm']", function(g) { //소분류 삭제

                var deleteDocumentSm = $(g.target).attr('id');
                alert(deleteDocumentSm);
                var fid = deleteDocumentSm.substring(0);
                var thread = deleteDocumentSm.substring(1);
                $('li[id="' + deleteDocumentSm + '"]').detach();

                var url = "http://localhost:8080/deletelist.bl";
                $.ajax({
                    type: "POST",
                    url: url,
                    dataType: "text",
                    data: {
                    	id: "<%=session.getAttribute("blog_id")%>",
                        fid: "A",
                        thread: "a",
                        GNS: "N"
                    },
                    success: function(data) {

                    },
                    error: function(request, status, error) {

                    }

                });
            });

        });

    </script>
</body>

</html>

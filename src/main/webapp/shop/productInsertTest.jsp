<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="SHeader.jsp"%>
<c:set value='<%=session.getAttribute("id") %>' var="id"/>
<c:if test="${id==null} ">
	<c:set value='로그인 하세요' var="id"/>
</c:if>
<div class="col-12 row m-0 p-0">
    <div class="col-2" style="" id="lside">
    </div>
    
    <div class="col-8" style="margin-top: 100px" id="main">
        <div class="col-12 mb-3 p-2" style="display: flex;flex-wrap: nowrap;height: auto;border: 1px solid gray;border-radius: 10px;">
            <div class="container">
            <div class="row" id="productupdate">
                <div class="col-md-5">
                    <img style="width:100%">
                </div>		
                <div class="col-md-6">
                <form id="fmt" name="fmt" action="/insertProduct.up" method="post">
                    <p><span style="">Pname&nbsp;&nbsp;</span><input name="Pname" placeholder="상품명을 입력하세요">
                    <p>pcontent<br><textarea id="content" name="content" placeholder="상품설명을 입력하세요"></textarea>
                    <p>분류
                    
						<select id="categoryU" name="category" class="selectBoxForm">
							<option value="0" >분류</option>
							<option value="1">자유</option>
							<option value="2">카테고리A</option>
							<option value="3">카테고리B</option>
						</select>
                   	
                    <p>가격:<input type="text" id="price" name="price" placeholder="가격을 입력하세요">
                    <p class="cellid">판매자:id                    
                    <p>재고수:<input type="number" name="instork" placeholder="수량을 입력하세요">
                    
                </form>
                	<p>이미지등록:<input type="file" name="files"><a class="btn btn-outline-primary btn-sm" id="uploadBtn" >이미지 미리보기 &raquo;</a></p>
	                    <a class="btn btn-outline-info" onclick="document.fmt.submit();" >등록 &raquo;</a>
	                    <a href="./products.jsp" class="btn btn-outline-secondary">취소 &raquo;</a>					                    
                </div>
            </div>    	
        </div>
           
        </div>
    </div>


    <div class="col-2 m-0 p-0" style="" id="rside">
     </div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){	
	
	$("#uploadBtn").on("click",function(e){
		e.preventDefault();
	
		var formData = new FormData();
		
		var inputFile = $("input[name='files']");
		var File = $("input[name='files']").val();		
		var steste=File.length;
		var StrFile=File.substring(12,steste);
		/*console.log(steste);
		console.log(File);
		alert(StrFile)*/
		
		
		var files = inputFile[0].files;
		
		
		
		formData.append("uploadFile",files[0]);						
		
		$.ajax({
			url:"/productInsert.up",			
			enctype: 'multipart/form-data',
			processData:false,		
			contentType:false,
			data:formData,
			type:"post",
			dataType:"json",
			success:function(result){
				alert("aa");
			},
			error : function(request, status, error) { 
				alert("error:"+request.status + "#" + request.message + "#" + error);
		    }
		});//		
		
	});//
});
</script>
</html>
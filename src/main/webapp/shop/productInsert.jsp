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
                 <form id="pIfmt"  name="pIfmt" action="/productInsert.up" method="post" enctype="multipart/form-data">
                    <p><span style="">Pname&nbsp;&nbsp;</span><input name="Pname" placeholder="상품명을 입력하세요">
                    <p>pcontent<br><textarea id="content" placeholder="상품설명을 입력하세요"></textarea>
                    <p>분류
                    
						<select id="categoryU" name="category" class="selectBoxForm">
							<option value="0" >분류</option>
							<option value="1">자유</option>
							<option value="2">카테고리A</option>
							<option value="3">카테고리B</option>
						</select>
                   	
                    <p>가격:<input name="price" name="price" placeholder="가격을 입력하세요">
                    <p>판매자:id                    
                    <p>재고수:<input type="number" name="instork" placeholder="수량을 입력하세요" min="1">
                    
                    <p>
                   
	                    <p>이미지등록:<input type="file" name="files"></p>
	                    <a class="btn btn-outline-info" onclick="document.pIfmt.submit();">상품등록 &raquo;</a>
	                    <a href="./products.jsp" class="btn btn-outline-secondary">취소 &raquo;</a>
					</form>                    
                </div>
            </div>    	
        </div>
           
        </div>
    </div>


    <div class="col-2 m-0 p-0" style="" id="rside">
     </div>
</div>
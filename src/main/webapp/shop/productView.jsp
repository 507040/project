<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/shop/SHeader.jsp" %>


<div class="col-12 row m-0 p-0">
    <div class="col-2" style="" id="lside">
    </div>
    
    <div class="col-8" style="margin-top: 150px" id="main">
        <div class="col-12 mb-3 p-2" style="display: flex;flex-wrap: nowrap;height: auto;border: 1px solid gray;border-radius: 10px;">
            <div class="container">
            <div class="row">
                <div class="col-md-5" >
                    <img style="width:100%">
                </div>		
                <div class="col-md-6">
                    <h3>Pname</h3>
                    <p>pcontent
                    <p><b>Pid</b>
                    <p><b>가격</b>:<span style="font-weight: bold">00,00원</span>
                    <p><b>판매자:</b>id
                    <p><b>분류:</b>category
                    <p><b>재고수:</b>InStork
                    
                    <p>
                    
                        <a href="#" class="btn btn-outline-info" onclick="addToCart();">삼품등록</a>
                        <a href="./products.jsp" class="btn btn-outline-secondary">상품목록</a>
                   
                </div>
            </div>    	
        </div>
           
        </div>
    </div>


    <div class="col-2 m-0 p-0" style="" id="rside">
     </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/shop/SHeader.jsp" %>
<div class="col-12 row m-0 p-0">
    <div class="col-2" style="background-color: antiquewhite;" id="lside">
</div>

<div class="col-8" style="background-color: aquamarine;" id="main">
   <div class="col-12 mb-3" style="display: flex;flex-wrap: nowrap;height: auto;border-bottom: 1px solid gray">
       
       <div class="col-2"><img class="img col-12">asd</div>
       <a href="#">
           <div class="col-10 text-left">
               <p class="mb-1" style="font-weight: bold;" >productName</p>
               <p class="mb-2" style="font-weight: bold; font-size: 15px">productPrice</p>
               <p class="mb-1" style="font-size: 12px;color: gray">productCartegory</p>
               <p class="mb-0">productcontent</p>
               <p class="my-0" style="font-size: 12px;color: gray">id/OrderCnt/Stock/Cart</p>                        
            </div>
        </a>
    </div>
</div>


<div class="col-2 m-0 p-0" style="background-color:beige;" id="rside">
   <div class="rside col-12 p-0 m-0" style="display: flex;flex-wrap: wrap">

       <div class="col-12 text-center  p-0 m-0 mb-2">
           <span><b>최근 본 상품</b></span>
           <div class="col-12 p-0 m-0"><a><img class="img"></a></div>
       </div>

       <div class="col-12 text-center p-0 m-0 mb-2">
           <span><b>특가</b></span>
           <div class="col-12 p-0 m-0">
               <div class="block_rside">
                   <ul id="ticker_rside">
                       <li><a href="#"><img src="/resources/img/고양이.jpg"><br>1</a></li>
                       <li><a href="#"><img src="/resources/img/dano.jpg"><br>2</a></li>
                       <li><a href="#"><img src="/resources/img/고양이.jpg"><br>3</a></li>
                   </ul>
               </div>
           </div>
       </div>

       <div class="col-12 text-center p-0 m-0 mb-2">
           <span><b>소식</b></span>
           <div class="col-12 p-0 m-0">
               <div class="block_brand">
                   <ul id="ticker_brand">
                       <li><a href="#"><img src="/resources/img/고양이.jpg"><br>1</a></li>
                       <li><a href="#"><img src="/resources/img/dano.jpg"><br>2</a></li>
                       <li><a href="#"><img src="/resources/img/고양이.jpg"><br>3</a></li>
                   </ul>
               </div>
           </div>
       </div>
       <div class="col-12 text-center p-0 m-0 mb-2" style="display: flex;flex-wrap: wrap;justify-content: space-around;">
            <span class="col-12"><b>신상품</b></span>
            <div class="col-6 px-2 pb-2"><a><img src="/resources/img/고양이.jpg"><br>이름:<br>가격</a></div>
            <div class="col-6 pr-2 pb-2"><a><img src="/resources/img/고양이.jpg"><br>이름:<br>가격</a></div>
            <div class="col-6 px-2 pb-2"><a><img src="/resources/img/고양이.jpg"><br>이름:<br>가격</a></div>
            <div class="col-6 pr-2 pb-2"><a><img src="/resources/img/고양이.jpg"><br>이름:<br>가격</a></div>
            <div class="col-6 px-2 pb-2"><a><img src="/resources/img/고양이.jpg"><br>이름:<br>가격</a></div>
            <div class="col-6 pr-2 pb-2"><a><img src="/resources/img/고양이.jpg"><br>이름:<br>가격</a></div>
        </div>
    </div>
</div>
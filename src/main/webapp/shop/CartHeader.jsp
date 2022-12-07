<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="Op" value="${param.Op}" />

<div class="col-9" style="margin: 0 auto;padding: 0;margin-bottom:15px;  ">
    <div class="row p-0 m-0 mt-3">
        <div class="col-12 text-left mx-0 p-0 mb-0">
            <span style="font-weight: bold;font-family:'맑은 고딕'';">&#166; 장바구니</span>
        </div>
        <div class="cartbox">

            <c:choose>
                <c:when test="${Op==1}">
                    <div style="width: 100%;min-width: 100%">
                        <div class="sizing" style="align-items: center;display: flex;padding-top:10px;padding-bottom: 10px;border-right:1px solid gray;border-left:1px solid gray;">
                            <div style="color:#a16730;font-weight: bold;text-align: center;width:30%;">장바구니</div>
                            <div style="width:70%;">
                                <div class="box">
                                    <div class="cartbox_Ac"><span>01.장바구니</span></div>
                                    <div class="cartbox" style="border-top: 1px solid gray;border-bottom: 1px solid gray">02.주문서작성</div>
                                    <div class="cartbox" style="border-top: 1px solid gray;border-bottom: 1px solid gray;border-left: 1px solid gray;">03.결제완료</div>
                                    <div class="cartbox" style="border: 1px solid gray;">04.주문완료</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:when test="${Op==2}">
                    <div style="width: 100%;min-width: 100%">
                        <div class="sizing" style="align-items: center;display: flex;padding-top:10px;padding-bottom: 10px;border-right:1px solid gray;border-left:1px solid gray;">
                            <div style="color:#a16730;font-weight: bold;text-align: center;width:30%;">장바구니</div>
                            <div style="width:70%;">
                                <div class="box">
                                    <div class="cartbox" style="border-left: 1px solid gray;"><span>01.장바구니</span></div>
                                    <div class="cartbox_Ac" style="border-top: 1px solid gray;border-bottom: 1px solid gray">02.주문서작성</div>
                                    <div class="cartbox" style="border-top: 1px solid gray;border-bottom: 1px solid gray;">03.결제완료</div>
                                    <div class="cartbox" style="border: 1px solid gray;">04.주문완료</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:when test="${Op==3}">
                    <div style="width: 100%;min-width: 100%">
                        <div class="sizing" style="align-items: center;display: flex;padding-top:10px;padding-bottom: 10px;border-right:1px solid gray;border-left:1px solid gray;">
                            <div style="color:#a16730;font-weight: bold;text-align: center;width:30%;">장바구니</div>
                            <div style="width:70%;">
                                <div class="box">
                                    <div class="cartbox" style="border-left: 1px solid gray;"><span>01.장바구니</span></div>
                                    <div class="cartbox" style="border-left: 1px solid gray;border-top: 1px solid gray;border-bottom: 1px solid gray">02.주문서작성</div>
                                    <div class="cartbox_Ac" style="border-top: 1px solid gray;border-bottom: 1px solid gray;">03.결제완료</div>
                                    <div class="cartbox" style="border: 1px solid gray;border-left: 0px;">04.주문완료</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:when test="${Op==4}">
                    <div style="width: 100%;min-width: 100%">
                        <div class="sizing" style="align-items: center;display: flex;padding-top:10px;padding-bottom: 10px;border-right:1px solid gray;border-left:1px solid gray;">
                            <div style="color:#a16730;font-weight: bold;text-align: center;width:30%;">장바구니</div>
                            <div style="width:70%;">
                                <div class="box">
                                    <div class="cartbox" style="border-left: 1px solid gray;"><span>01.장바구니</span></div>
                                    <div class="cartbox" style="border-left: 1px solid gray;border-top: 1px solid gray;border-bottom: 1px solid gray">02.주문서작성</div>
                                    <div class="cartbox" style="border-left: 1px solid gray;border-top: 1px solid gray;border-bottom: 1px solid gray;">03.결제완료</div>
                                    <div class="cartbox_Ac">04.주문완료</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>

            <div class="cmem" style="">
                <div class="cmem_box_left">
                    <div class="cmem_left">
                        혜택정보
                    </div>
                </div>
                <div class="cmem_box_right" style="padding: 10px;">
                    <div class="cmem_mid" >
                        <ul>
                            <li>
                                <span class="tb">nicname</span> 님은 <span class="tb">[ 회원등급 ]</span>입니다.
                            </li>
                            <li>
                                &nbsp;&nbsp;&nbsp;<span class="tb">##,###원</span> 이상 구매 시 <span class="tb">##%</span> 추가 적립 받으실 수 있습니다.
                            </li>
                            <li>
                                &nbsp;&nbsp;&nbsp;<span class="tb">##,###원</span> 이상 구매 시 <span class="tb">##%</span> 추가 적립 받으실 수 있습니다.
                            </li>
                            <li>------------------------------------</li>
                            <li>
                                <span class="tb">nicname</span> 님은 <span class="tb">[ 비회원 ]</span>입니다.
                            </li>
                            <li>
                                &nbsp;&nbsp;&nbsp;로그인 후 해택을 받아보세요.
                            </li>
                        </ul>
                    </div>
                    <div class="cmem_right" >
                        <ul>
                            <li>
                                기존적립금&nbsp;&nbsp;<span class="tb">##,###원</span>
                            </li>
                            <li>
                                쿠폰&nbsp;&nbsp;<span class="tb">#개</span>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

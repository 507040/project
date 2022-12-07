<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="SHeader.jsp"%>
<%@include file="CartHeader.jsp" %>



<div class="col-9" style="margin: 0 auto;padding: 0;margin-bottom:30px;  ">
    <div class="selectPost">
        <div class="Sel_Ac"><a class="Select" href="#">국내배송상품(#)</a></div>
        <div class="Sel"><a class="Select" href="#">해외배송상품(#)</a></div>
    </div>

    <div class="Sel_Product my-1">
        <span>선택상품(#)</span>
    </div>

    <div class="cartTable">
        <table class="table table-hover text-center mb-0">
            <tr>
                <th></th>
                <th colspan="2">상품정보</th>
                <th>가격</th>
                <th>수량</th>
                <th>적립금</th>
                <th>배송구분</th>
                <th>배송비</th>
                <th>합계</th>
                <th>선택</th>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <!--상품정보-->
                <td>
                    이미지
                </td>
                <td>
                    상품이름
                </td>
                <!--가격-->
                <td>
                    #,##원
                </td>
                <!--수량-->
                <td>
                    <input type="number" max="99" min="0">
                </td>
                <!--적립금-->
                <td>
                    (우수)#
                </td>
                <!--배송부근-->
                <td>
                    기본배송<br>(해외배송)
                </td>
                <!--배송비-->
                <td>
                    #
                </td>
                <!--합계-->
                <td>
                    ##,###
                </td>
                <!--선택-->
                <td style="display: flex;flex-wrap:wrap">
                    <input type="button" class="orderbtn" onclick="location.href='order.pn?Op=2'" value="주문하기" style="width:100%;margin-bottom: 3px;">
                    <input type="button" class="deletebtn" value="삭제" style="width:100%">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <!--상품정보-->
                <td>
                    이미지
                </td>
                <td>
                    상품이름
                </td>
                <!--가격-->
                <td>
                    <span class="saleText">#,##원<br></span>
                    #,##원
                </td>
                <!--수량-->
                <td>
                    <input type="number" max="99" min="0">
                </td>
                <!--적립금-->
                <td>
                    (우수)#
                </td>
                <!--배송부근-->
                <td>
                    기본배송<br>(해외배송)
                </td>
                <!--배송비-->
                <td>
                    #
                </td>
                <!--합계-->
                <td>
                    ##,###
                </td>
                <!--선택-->
                <td style="display: flex;flex-wrap:wrap">
                    <input type="button" class="orderbtn" onclick="location.href='order.pn?Op=2'" value="주문하기" style="width:100%;margin-bottom: 3px;">
                    <input type="button" class="deletebtn" value="삭제" style="width:100%">
                </td>
            </tr>
        </table>
        <div class="cartfoot">
            <div style="width:100%;">
                <span style="font-weight: bold;">[기본배송]</span>
                <span style="font-size: 13px;align-items: center;">상품 구매금액:##,### - 할인금액 ##,### = <b style="font-size: 15px;">합계 : ##,###원</b></span>
            </div>
        </div>
    </div>
</div>
<%@include file="SFooter.jsp" %>

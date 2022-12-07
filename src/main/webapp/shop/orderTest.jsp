<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>장바구니</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/blog/">



    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">




    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/4.6/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/4.6/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/4.6/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon.ico">
    <meta name="msapplication-config" content="/docs/4.6/assets/img/favicons/browserconfig.xml">
    <meta name="theme-color" content="#563d7c">
<script src="/resources/js/Order.js"></script>

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
    <style>
        .orderContainer .orderMain .order_Main .order_addr [type="radio"] {
            vertical-align: middle;
            appearance: none;
            border: max(1px, 0.2em) solid gray;
            border-radius: 50%;
            width: 1.25em;
            height: 1.25em;
        }

        .orderContainer .orderMain .order_Main .order_addr [type="radio"]:checked {
            border: 4px solid tomato;

        }

        .orderContainer .orderMain .order_Main .order_addr [type="radio"]:focus-visible {
            outline-offset: max(2px, 0.1em);
            outline: max(2px, 0.1em) dotted tomato;
        }

        .orderContainer .orderMain .order_Main .order_addr [type="radio"]:hover {
            box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
            cursor: pointer;
        }

        .saleText {
            text-decoration: line-through;
            opacity: 20%;
        }

        .orderContainer .orderMain .order_Main .order_addr [type="text"] {
            appearance: none;
            border: 1px solid gray;
            width: 200px;
        }

        .orderContainer {
            width: 1100px;
            margin: auto;
            background-color: #fafafa
        }

        .orderContainer td {
            vertical-align: middle;
            align-items: center;
        }

        .table input {
            text-decoration: none;
            border: none;
            text-align: center;
            width: auto;
            background-color: #fafafa;
        }

        .orderCart {
            border: 1px solid Gray;
            border-radius: 0px 0px 10px 10px;
        }

        .orderMain {
            width: 1100px;
            margin: auto;
            display: flex;
            flex-wrap: nowrap;
            border-left: 1px Solid Gray;
            border-right: 1px Solid Gray;
            border-radius: 10px 10px 10px 10px;
            background: linear-gradient(#ccc, #fafafa 1%, #fafafa 99%, #ccc);
        }

        .orderContainer .orderMain .order_Main {
            width: 65%;

        }

        .orderContainer .orderMain .order_Side {
            padding: 15px;
            width: 35%;
            border-left: 1px solid #c8c8c8;
        }

        .orderContainer .orderMain .order_Main .order_addr {
            width: 100%;
            padding: 15px;


        }

        .orderContainer .orderMain .order_Main .order_addr table {
            width: 100%;
            font-size: 13px;
            font-weight: bold;
        }

        .orderContainer .orderMain .order_Main .order_addr td {
            text-align: left;
            height: 30px;

        }

        .orderContainer .orderMain .order_Main .order_addr tr {}

        .oredrBackground {
            background: linear-gradient(165deg, #ffffff 50%, #ff6347);
            border-radius: 50px 50px 0px 0px;
        }

        .orderSaleCuppon {
            border-top: 1px solid #c8c8c8;
            padding: 15px;

        }

        .orderSaleCuppon table {
            font-size: 13px;
            font-weight: bold;
            width: 100%;
            margin-bottom: 30px;
        }

        .orderSaleCuppon .orderSale table td {
            height: 40px;
            vertical-align: middle;
            align-items: center;
        }

        .orderSaleCuppon .orderSale table td input {
            appearance: none;
            border: none;
            background-color: #fafafa;
            text-align: right;
        }

        .spanUnderLine {
            border-bottom: 1px solid #c8c8c8;
            text-align: right;
        }


        .orderPiointdiv {
            padding-left: 15px;
            padding-right: 10px;
            padding-bottom: 10px;
        }

        .orderPointResult {
            margin-top: -30px;
            border-top: 1px solid #c8c8c8;
            padding: 15px;
            font-size: 13px;
        }

        #orderPointTable {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border: 1px solid #c8c8c8;
            
            font-size: 13px;
        }

        #orderPointTable tr {
            padding: 15px;
            width: 100%
        }

        #orderPointTable tr th {
            width: 100% padding:10px;
            font-size: 13px;

        }

        #orderPointTable tr td {
            font-size: 12px;
        }

        #orderPointTable tr td input {
            height: 13px;
            text-align: right;
        }

        .orderPointResult input {
            appearance: none;
            border: none;
            text-align: right;
        }

        .orderPointResult input:focus {
            outline: none;
            color: transparent;
            text-shadow: 0 0 0 black;
        }

        .orderPointResult span {
            width: 50%;
        }

        .orderSubmit {
            width: 1100px;
            height: 130px;
            padding: 0;
            display: table-cell;
            vertical-align: middle;
            align-content: center;
            align-items: center;
            text-align: center;
            border-radius: 10px 10px 0px 0px;
            border: 1px solid Gray;
        }

        #orderSubmitBtn {
            outline: none;
            border: 0px;
            width: 200px;
            height: 70px;
            border-radius: 5px;
            background-color: tomato;
            color: white;
            font-size: 18px;
        }

        .order_Side div {}

        .orderSidePost {
            align-items: center;
            border-bottom: 0px solid #c8c8c8;
        }

        .orderSideIden {
            padding-bottom: 10px;
            border-bottom: 1px solid #c8c8c8;
        }

        .orderSideIdenText {
            color: tomato;
            opacity: 70%;
            font-size: 13px;
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 10px;


        }

        .orderPrice {
            border-top: 1px solid #c8c8c8;
            padding: 15px;
        }

        .orderSidePost p {
            padding-left: 10px;
            font-size: 13px;
            margin-bottom: 5px;
        }

        .orderPrice p {
            padding-left: 10px;
            font-size: 13px;
            margin-bottom: 5px;
            display: flex;
            justify-content: space-between;
            color: #a1a1a1;
        }

    </style>
</head>

<body>
    <main>
        <div class="orderContainer">
            <div class="orderCart">
                <table id="orderTable" class="table table-hover text-center mb-0">
                    <tr>
                        <th colspan="2">상품정보</th>
                        <th>수량</th>
                        <th>판매자</th>
                        <th>배송비</th>
                        <th>가격</th>
                    </tr>
                    <tr id="orderTr">

                        <!--상품정보-->
                        <td style="vertical-align: middle;">
                            이미지
                        </td>
                        <td>
                            상품이름
                        </td>
                        <!--수량-->
                        <td>
                            <input type="text" class="cartInput" value="##">
                        </td>
                        <!--적립금-->
                        <td>
                            판매자
                        </td>
                        <!--배송비-->
                        <td>
                            <span class="PostCost">3000</span>원
                        </td>
                        <!--물품금액-->
                        <td>
                            <span class="saleText">#,##원<br></span>
                            <span class="saleTextResult">100000</span>원
                        </td>
                    </tr>
                </table>
            </div>

            <div class="orderMain">
                <div class="order_Main">
                    <div class="order_addr">
                        <h5><b>배송지정보</b></h5>
                        <table>
                            <tr>
                                <td width="30%" style="text-align: left">배송지 선택</td>
                                <td>
                                    <input type="radio" id="post1" name="sel_post" value="1" checked>
                                    <label for="post1"><span>기존배송지</span></label>
                                    <input type="radio" id="post2" name="sel_post" value="2">
                                    <label for="post2"><span>신규배송지</span></label>
                                </td>
                            </tr>
                        </table>

                        <!--신규배송지-->
                        <table id="newPostSite" style="display: none;">
                            <tr>
                                <td width="30%" style="text-align: left"><span class="oredrBackground">수령인</span></td>
                                <td><input type="text" value="" placeholder="20자 이내로 입력하세요."></td>
                            </tr>
                            <tr>
                                <td width="30%" style="text-align: left">배송지명</td>
                                <td>
                                    <input type="text" id="postSite" placeholder="직접입력">
                                    <select id="select_postSite" onchange="postSite.value=this.value">
                                        <option value="">직접입력</option>
                                        <option value="1">집</option>
                                        <option value="2">회사</option>
                                        <option value="3">학교</option>
                                        <option value="4">가족</option>
                                        <option value="5">지인</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" style="text-align: left"><span class="oredrBackground">연락처</span></td>
                                <td><input type="text" class="orderPhone" placeholder="숫자를 입력하세요.(-제외)"></td>
                            </tr>
                            <tr>
                                <td width="30%" style="text-align: left"><span class="oredrBackground">배송지주소</span></td>
                                <td>
                                    <div style="width:100%;margin-bottom: 1px;">
                                        <!-- 우편번호찾기 -->
                                        <input type="text" id="sample6_postcode" name="adress1" placeholder="우편번호" style="width:20%" readonly>
                                        <a onclick="sample6_execDaumPostcode()" style="vertical-align: middle;align-items:center;text-decoration: none;width:auto;cursor: pointer;">
                                            <span style="font-weight:bold; font-size:15px;vertical-align: middle;align-items: center;">
                                                <i class="bi bi-search"></i>
                                            </span>
                                        </a>
                                        <input type="text" id="sample6_address" name="adress2" placeholder="주소" required><br>

                                    </div>
                                    <!-- 상세주소//참고항목 -->
                                    <div>
                                        <input type="text" id="sample6_detailAddress" name="adress3" placeholder="상세주소" required>
                                        <input type="text" id="sample6_extraAddress" name="adress4" placeholder="참고항목" required>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" style="text-align: left">배송메모</td>
                                <td><input type="text" name="ordermemo" placeholder="요청사항을 입력하세요."></td>
                            </tr>
                        </table>



                        <!--기존배송지-->
                        <table id="oldPostSite">
                            <tr>
                                <td width="30%" style="text-align: left">수령인</td>
                                <td>아무개</td>
                            </tr>
                            <tr>
                                <td width="30%" style="text-align: left">배송지명</td>
                                <td>##</td>
                            </tr>
                            <tr>
                                <td width="30%" style="text-align: left">연락처</td>
                                <td>000-0000-0000</td>
                            </tr>
                            <tr>
                                <td width="30%" style="text-align: left">배송지주소</td>
                                <td>
                                    <div style="width:100%;margin-bottom: 3px;">
                                        <!-- 우편번호찾기 -->
                                        <span style="margin-right: 5px;">###</span>
                                        <span>###</span><br>

                                    </div>
                                    <!-- 상세주소//참고항목 -->
                                    <div>
                                        <span style="margin-right: 5px;">###</span>
                                        <span>###</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" style="text-align: left">배송메모</td>
                                <td><input type="text" name="ordermemo" placeholder="요청사항을 입력하세요."></td>
                            </tr>
                        </table>
                    </div>

                    <div class="orderSaleCuppon">
                        <div class="orderCuppon">
                            <h5><b>할인 및 마일리지</b></h5>
                            <h6 style="margin-top: 15px;margin-bottom: 20px;font-weight: bold;">쿠폰 할인</h6>
                            <div style="padding-left:30px;">
                                <table width=100%>
                                    <tr>
                                        <td style="width:20%">상품/주문 쿠폰</td>
                                        <td>
                                            <p class="spanUnderLine" style="width:340px;margin-bottom: 0px;padding: 5px;"><b><span class="CupponSaleCost">500</span></b>&nbsp;<span style="font-weight: 100;">원</span></p>
                                        </td>
                                        <td style="width:11%">
                                            <button style="appearance: none;border:1px solid #c8c8c8;background-color: white;">쿠폰사용</button>
                                        </td>
                                        <td style="width:15%">
                                            <span style="width:100%;font-weight: 100;">(보유쿠폰 ##장)</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="orderSale">
                            <h6 style="margin-top: 15px;margin-bottom: 20px;font-weight: bold;">마일리지</h6>
                            <div style="padding-left:30px;">
                                <table width=100%>
                                    <tr>
                                        <td style="width:20%">보유</td>
                                        <td>
                                            <p class="spanUnderLine" style="width:340px;margin-bottom: 0px;padding: 5px;">
                                                <b><input type="text" id="orderPointSave" value="10000" readonly></b>&nbsp;
                                                <span style="font-weight: 100;">원</span>
                                            </p>
                                        </td>
                                        <td style="width:11%">

                                        </td>
                                        <td style="width:15%">

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%">사용</td>
                                        <td>
                                            <p class="spanUnderLine" style="width:340px;margin-bottom: 0px;padding: 5px;">
                                                <b><input type="text" id="orderPointUse" placeholder="0"></b>&nbsp;
                                                <span style="font-weight: 100;">원</span> &nbsp;
                                                <a id="TextDeleteBtn" style="cursor: pointer" href="#">
                                                    <i style="color:black " class="bi bi-x-circle"></i>
                                                </a>
                                            </p>
                                        </td>
                                        <td style="width:11%">
                                            <button id="orderPointUseBtn" style="appearance: none;border:1px solid #c8c8c8;background-color: white;">전액사용</button>
                                        </td>
                                        <td style="width:15%">
                                            <span style="width:100%;font-weight: 100;"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%">잔여포인트</td>
                                        <td>
                                            <p class="spanUnderLine" style="width:340px;margin-bottom: 0px;padding: 5px;">
                                                <b><input placeholder="0" id="orderPoint" readonly></b>&nbsp;
                                                <span style="font-weight: 100;">원</span>
                                            </p>
                                        </td>
                                        <td style="width:11%">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="orderPointResult">
                        <table id="orderPointTable">
                            <tr>
                                <th colspan="2" style="border-bottom: 1px solid #c8c8c8;">
                                    <div class="orderPiointdiv" style="display: flex;justify-content: space-between;margin-top:10px;">
                                        <span>포인트혜택</span>
                                        <span style="text-align: right;"><input id="orderMaxPointResult" value="###원" style="font-weight: bold;color: tomato"></span>
                                    </div>
                                </th>
                            </tr>

                            <tr>
                                <td style="width:60%">
                                    <div class="orderPiointdiv" style="width:100%;display: flex;flex-wrap: wrap;">

                                        <div style="margin-top: 0px; font-weight: bold;width:100%;padding-top: 10px;">
                                            <div class="orderPiointdiv" style="display: flex;justify-content: space-between;padding-bottom: 0px;">
                                                <span>구매적립</span>
                                                <input id="orderMaxPointResult" style="font-weight: bold" value="###원">
                                            </div>
                                        </div>

                                        <div style="margin-top: 0px; font-weight: bold;width:100%;">
                                            <div class="orderPiointdiv" style="display: flex;justify-content: space-between;padding-bottom: 0px;border-left: 3px solid #dddddd;padding-left: 10px;margin-left: 15px;margin-top: 5px;">
                                                <span>기본적립</span>
                                                <input id="orderMaxPointResult" value="###원">
                                            </div>
                                        </div>

                                        <div style="margin-top: 0px; font-weight: bold;width:100%;">
                                            <div class="orderPiointdiv" style="display: flex;justify-content: space-between;padding-bottom: 0px;border-left: 3px solid #dddddd;padding-left: 10px;margin-left: 15px;">
                                                <span style="">등급 추가적립</span>
                                                <input id="orderMaxPointResult" value="###원">
                                            </div>
                                        </div>

                                    </div>
                                </td>
                                <td width=40%>

                                    <div class="orderPiointdiv" style="padding-left: 0px; width:100%;display: flex;height: 100%">
                                        <div class="orderPiointdiv" style="border-left: 1px solid #c8c8c8; padding-right: 10px; display: flex;justify-content: space-between;margin-bottom: 0px;flex-wrap: wrap;height: 100%">
                                            <span style="width:50%;font-weight: bold;">리뷰적립</span>
                                            <span style="width:50%;text-align: right;">100원&nbsp;&nbsp;&nbsp;</span>
                                            <span style="width:100%;font-size: 10px;color: gray">동일상품의 리뷰는 1회만 적용됩니다.</span>
                                        </div>
                                    </div>

                                </td>
                            </tr>

                        </table>

                    </div>



                </div>


                <div class="order_Side m-0 p-0">
                    <div class="orderSidePost p-4">
                        <div class="orderSideIden">
                            <h6><b>주문자정보</b></h6>
                            <p>name</p>
                            <p id="orderphone"></p>
                            <p id="orderemail"></p>
                        </div>
                        <div class="orderSideIdenText">
                            * 개인정보를 확인 후 진행하세요.
                        </div>
                    </div>
                    <div class="orderPrice">
                        <h6><b>결제 상세</b></h6>
                        <p class="orderPriceTotal" style="color: black;">
                            <span>주문금액</span>
                            <span class="orderPriceTotal_Cost"></span>
                        </p>
                        <p class="orderPriceProduct">
                            <span>상품금액</span>
                            <span class="orderPriceProduct_Cost">

                            </span>
                        </p>
                        <p class="orderPricePost">
                            <span>배송비</span>
                            <span class="orderPricePost_Cost"></span>
                        </p>
                        <p class="orderPriceCuppon" style="padding-bottom: 5px;border-bottom: 1px solid #c8c8c8">
                            <span>쿠폰할인</span>
                            <span class="orderPriceCuppon_Cost"></span>
                        </p>
                    </div>
                    <div class="orderPrice" style="border-top: 0px; margin-top: -30px;">
                        <p class="orderPricePoint">
                            <span>마일리지 사용</span>
                            <span class="orderPricePoint_Cost">0</span>
                        </p>
                    </div>
                </div>


            </div>
            <div class="orderSubmit">
                <div>
                    <input type="button" id="orderSubmitBtn" value="결&nbsp;&nbsp;제&nbsp;&nbsp;하&nbsp;&nbsp;기">
                </div>
            </div>
        </div>
    </main>
</body>
</html>

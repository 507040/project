 $(document).ready(function() {

        var reg = /[0-9]/;
        $('#orderTr').mouseover(function() {
            $('.cartInput').css('background', '#e8e8e8');
        });
        $('#orderTable').mouseout(function() {
            $('.cartInput').css('background', '#fafafa');
        });
        $('.cartInput').mouseover(function() {
            $('.cartInput').css('background', '#e8e8e8');
        });
        $('.cartInput').mouseout(function() {
            $('.cartInput').css('background', '#e8e8e8');
        });

        $('#select_postSite').on('change', function() {
            var regTest = reg.test($('#select_postSite').val());
            if (regTest == true) {
                $('#postSite').attr('type', 'hidden');
            } else {
                $('#postSite').attr('type', 'text');
            }
        });

        $(function() {
            $('.orderPhone').keydown(function(event) {

                var key = event.charCode || event.keyCode || 0;
                $text = $(this);
                $text.val($text.val().replace(/[^0-9,-]/g, ""));

                if (key !== 8 && key !== 9) {
                    var textStr = $('.orderPhone').val();

                    if ($text.val().length === 3) {
                        $text.val($text.val() + '-');
                    }
                    if ($text.val().length === 8) {
                        $text.val($text.val() + '-');
                    }
                    if ($text.val().length === 13) {
                        var textStrStr = textStr.substring(0, 12);
                        $text.val(textStrStr);


                    }
                }

                return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
                // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
                // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
            })
        });

        //배송지선택
        $('input:radio[name=sel_post]').click(function() {
            var radioVal = $("input[name=sel_post]:checked").val();

            if (radioVal == 1) {
                $("table[id=newPostSite]").hide();
                $("table[id=oldPostSite]").show();
            }
            if (radioVal == 2) {
                $("table[id=newPostSite]").show();
                $("table[id=oldPostSite]").hide();
            }
            //side높이
            var postheight = ($('.order_addr').outerHeight()) + "px";
            $('.orderSidePost').css('height', postheight);

        });



        //상세결제
        var CostSale = $('.saleTextResult').text();
        $('.orderPriceProduct_Cost').text(CostSale + "원"); //상품금액

        var CostPost = $('.PostCost').text();
        $('.orderPricePost_Cost').text("+" + CostPost + "원"); //배송비
        $('.orderPricePost_Cost').css('text-decoration', 'line-through'); //배송비 쿠폰 사용

        var CostCuppon = $('.CupponSaleCost').text();
        $('.orderPriceCuppon_Cost').text("-" + CostCuppon + "원"); //쿠폰

        var CostPoint = $('.orderPricePoint_Cost').text(); //사용마일리지        



        CostSale = parseInt(CostSale);
        CostPost = parseInt(CostPost);
        CostCuppon = parseInt(CostCuppon);
        CostPoint = parseInt(CostPoint);



        var TotalResult = 0;
        if (CostPoint == 0) {
            TotalResult = (CostSale + CostPost - CostCuppon);
        } else {
            TotalResult = CostSale + CostPost - CostPoint - CostPoint;
        }

        $('.orderPriceTotal_Cost').text(TotalResult + "원");
        //상세결제 끝



        //마일리지사용
        //text remove
        var orderPointUse = $('#orderPointUse').val();
        $('#TextDeleteBtn').on('click', function(e) {

            e.preventDefault();
            $('#orderPointUse').val('');
            $('#orderPoint').val($('#orderPointSave').val());
            CostPoint = $('.orderPricePoint_Cost').text('0원'); //사용마일리지
                        
            $('.orderPriceTotal_Cost').text(TotalResult+"원"); //주문금액 결과


        });
        //마일리지 사용입력
        $(function() {
            $('#orderPointUse').keyup(function(e) {

                var orderkey = e.charCode || e.keyCode || 0;
                $text = $(this);
                $text.val($text.val().replace(/[^0-9]/g, ""));

                var orderPointUse = $('#orderPointUse').val(); //사용포인트
                var orderPointSave = $('#orderPointSave').val(); //보유포인트
                var orderPoint = orderPointSave - orderPointUse; //잔여포인트
                var orderPriceTotal = $('.orderPriceTotal_Cost').text(); //주문금액
                var orderPriceTotalCost = 0; //주문금액결과 초기화
                
                orderPriceTotal = parseInt(orderPriceTotal); //int 형변환
                
                var lengthUse=orderPointUse.length;
                
                var isNanbool=isNaN(orderPointUse);
                
                var testkey= "orderkey == 8 || orderkey == 9 || orderkey == 46 || (orderkey >= 48 && orderkey <= 57) || (orderkey >= 96 && orderkey <= 105)";
                
                if(!testkey){
                    return;
                }
                
                
                
                
                
                
                if (orderPoint <= 0) { //사용 할 포인트 가 가진 포인트보다 많을 때
                        var orderPointUse0 = $('#orderPointSave').val();
                        $('#orderPointUse' ).val(orderPointSave);
                        $('#orderPoint').val('0');
                        $('.orderPricePoint_Cost').text("-" + orderPointSave + '원'); //사용마일리지           
                        $('.orderPriceTotal_Cost').text(TotalResult-orderPointSave+"원"); //주문금액 결과

                }else if(lengthUse==0){//사용포인트가 0일때
                    
                    $('.orderPriceTotal_Cost').text(TotalResult+"원");
                    $('.orderPricePoint_Cost').text('0 원');
                    $('#orderPoint').val(orderPointSave);
                    
                }else{  
                    $('#orderPoint').val(orderPoint);
                    $('.orderPricePoint_Cost').text("-" + orderPointUse + '원'); //사용마일리지
                    orderPriceTotalCost = TotalResult - orderPointUse; //주문금액 - 사용마일리지
                    if(isNanbool != true){                            
                        $('.orderPriceTotal_Cost').text(orderPriceTotalCost+"원"); //주문금액 결과
                    }
                }
                
            });
            
        });
        //전액사용
        $('#orderPointUseBtn').on('click', function() {
            $('#orderPointUse').val($('#orderPointSave').val());
            $('#orderPoint').val('0');

            $('.orderPricePoint_Cost').text("-" + $('#orderPointSave').val() + '원'); //사용마일리지          

            $('.orderPriceTotal_Cost').text(TotalResult-$('#orderPointSave').val()+"원"); //주문금액 결과


        })
        //마일리지사용 끝

        ////side높이
        var postheight = ($('.order_addr').outerHeight()) + "px";
        $('.orderSidePost').css('height', postheight);
        ////side높이

        //전화번호 *처리
        var Stetest = "010-1213-5678";

        var indexfront = Stetest.indexOf('-');

        var index = Stetest.indexOf('-');
        var subStr = Stetest.substring(index + 1, index + 2); //중간4자리 중 1첫번째

        var indexlast = Stetest.lastIndexOf('-');
        var subStrlast = Stetest.substring(indexlast + 1, indexlast + 2); //뒷4자리 중 1첫번째

        var subStrfront = Stetest.substring(0, indexfront); //앞3자리
        var idenPhone = subStr + "***"; //중간4자리
        var idenPhonelast = subStrlast + "***"; //뒷4자리

        var endStrPhone = subStrfront + "-" + idenPhone + "-" + idenPhonelast;

        $('#orderphone').text(Stetest + " -> " + endStrPhone);
        //전화번호 *처리



        //이메일 *처리
        var emailtest = "ssssse@naver.com";

        var idindex = emailtest.indexOf('@'); //아이디 길이 구하기
        var idindexStr = emailtest.substring(0, idindex); //아이디구하기 중 첫번째
        var idStr = emailtest.substring(0, 1); //아이디구하기 중 첫번째


        var domaindex = emailtest.lastIndexOf('@');
        var domainStr = emailtest.substring(domaindex + 1); //도메인구하기

        var rollStrId = idStr;
        var i = 0;

        for (i = 1; i <= idindexStr.length; i++) {
            rollStrId = rollStrId + "*";

        }
        var endStrId = rollStrId + "@" + domainStr;
        $('#orderemail').text(emailtest + " -> " + endStrId);




    });
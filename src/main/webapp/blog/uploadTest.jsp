<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="URF-8">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>내 블로그</title>




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



    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/blog/">
    <link href="blog.css" rel="stylesheet">
    <link href="/resources/css/basic.css" rel="stylesheet">
    <script src='/resources/js/autosize-master/dist/autosize.js'></script>
    <script src="/resources/js/myblog.js"></script>


</head>

<body>

<div class="MyBlog">
    <header class="blog-header pt-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="text-muted" href="/">Home</a>
            </div>
            <div class="col-8 pt-1 text-right">
                <a class="blog_header_text_in" href="/MyBlog">내 블로그</a>
                <a class="blog_header_text_in">이웃 블로그</a>
                <input type="button" value="로그인" class="blog_header_text_in_button">

            </div>
        </div>
        <div style="width:1140px;margin: 0 auto;margin-top: 16px;margin-bottom: 16px;">
            <img src="../imges/testimg.jpg" style="width:1140px;height:150px;margin: 0 auto;margin-top: 16px;margin-bottom: 16px;">


        </div>
    </header>
    <!--<form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" id="searchInput" style="width: 80%" type="search" placeholder="검색어를 입력하세요" aria-label="Search">	
            <button class="btn btn-outline-success my-sm-0" type="submit"><i class="bi bi-search"></i></button>
          </form>-->
    <div class="blog_main row m-0" style="width:1140px;">

        <div class="col-3 text-center m-0 p-0">
            <div style="widht:100%;border:1px solid #999999;border-radius:10px;">
                <img src="../imges/person.jpg" class="img p-2 mb-3" style="width:100%;height:100%;object-fit: fill;">
                <textarea class="text p-2" style="resize: none; border: 0px;width:100%;height:200px" readonly></textarea>
            </div>
            <div class="col-12 p-0 mt-1">
                <div style="border: 1px solid #ddd;" id="cartegory">
                    <p class="text-muted text-left m-0" style="border-radius: 10px;">category

                        <!--카테고리 추가하기-->
                        <button id='cccc' onclick="plus()" class="btn btn-sm btn-outline-none m-0 p-0" style="width:10px;height:15px;font-size: 5px;">
                            <i class="bi bi-plus-circle"></i>
                        </button>
                        <!--카테고리 추가하기-->
                    

                    <ul>

                        <li><span>asdasd
                                <!--카테고리 접기-->
                                <button class="btn btn-sm btn-outline-none m-0 p-0" id="aaaa" style="width:10px;height:15px;font-size: 5px;">
                                    <i class="bi bi-x-circle "></i>
                                </button>
                                <!--카테고리 펼치기-->
                                <button id='dddd' class="btn btn-sm btn-outline-none hidden m-0 p-0" style="width:10px;height:15px;font-size: 5px;">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                            </span>
                            <ul id="bbbb">
                                <li>aa</li>
                                <li>aa</li>
                                <li>aa</li>
                            </ul>
                        </li>

                    </ul>
                </div>

            </div>
            <div class="col-12 p-0 m-0">
                a

            </div>
        </div>
        <div class="blogContents col-9 m-0 p-0 pl-3 pb-3">
        	<div class="blogConwtentsTextBox">
	            <div class="blogConwtentsText col-12 mb-3 p-3" style="border-radius: 5px;border: 1px solid gray;">
	                <table width=100% align=center border=0>
	                    <tr border=0>
	                        <!-- 제목 -->
	                        <td align=center colspan=2>
	                            <input id="subject" name="subject" class="TextSubjectView" value="제목" readonly>
	                        </td>
	                    </tr>
	                    <tr class="ConnentInfo">
	                        <td class="text-left m-0 p-0" style="border-top:1px solid #eee;width:50%">
	                            <span>작성시간 :11</span>
	                        </td>
	
	                        <td class="text-right m-0 p-0" style="border-top:1px solid #eee;">
	                            <div style="display: flex;justify-content: flex-end;">
	                                <span>작성자 :11</span>&nbsp;&nbsp;&nbsp;&nbsp;
	                                <span>조회수 :11</span>
	                            </div>
	                        </td>
	
	                    </tr>
	
	
	                    <!--내용  -->
	                    <tr>
	                        <td align=center colspan=3>
	
	                            <img src="" width=300>
	
	                            <div></div>
	
	                        </td>
	                    </tr>
	                    <tr border=0>
	                        <td align=center colspan=2>
	
	
	
	                            <textarea id="comment" rows="auto" name="comment" class="text_comment_view" readonly></textarea>
	                            
	                            
	                        </td>
	                    </tr>
	
	
	                    <tr border=0>
	                        <!-- 추천 -->
	                        <td align=center colspan=2>
	                            <input id="up" name="up" type="button" onclick="up()" value="추천">
	                            <input id="down" name="down" type="button" onclick="down()" value="비추천">
	                        </td>
	                    </tr>
	
	
	                    <tr>
	
	                        <td colspan=2>
	
	                            첨부파일:<a href="#" download></a>
	
	                            <span>첨부파일:없음</span>
	
	                        </td>
	
	                    </tr>
	                    <tr>
	                        <td align=right colspan=2>
	                            <input type="button" onclick="uplist_go()" value="추천목록" id="cursor">
	                            <button>수정</button>
	                            <input type="button" onclick="#" value="목록" id="cursor">
	                        </td>
	                    </tr>
	                </table>
	                <!--댓글-->
	                <div class="row">
	                    <div class="col-12">
	                        <div class="panel panel-default">
	                            <div class="panel-heading">
	                                <i class="bi bi-chat-left-text">&nbsp;&nbsp;</i>댓글(#)<span class="textCount"></span>
	                            </div>
	                            <div class="addReplyBox" style="display: flex;flex-wrap: nowrap;">
	                                <textarea class="replyInputComment" placeholder="100자 이내로 입력하세요"></textarea>
	                                <input type="button" class="addReplyBtn" style="border:1px solid black" value="달기">
	                            </div>
	
	                            <div class="panel-body">
	                                <ul class="chat">
	                                    <li class="left clearfix" data-rno='12'>
	                                        <div>
	                                            <div class="header">
	                                                <strong class="primary-font">user00</strong>
	                                                <small class="pull-right text-muted">2022-10-12 16:20</small>
	                                            </div>
	                                            <p>Good Job!</p>
	                                        </div>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <!-- 댓글 리스트 출력 종료 -->
	
	                <div class="panel-footer">
	
	                </div>
	
	             
	
	            </div>
	            <!-- 기능버튼 -->
				<div class="FunctionBtn text-right">
					<a class="btn btn-sm btn-outline-secondary my-0">목록</a> 
					<a class="btn btn-sm btn-outline-secondary my-0" id="writeBtn" href="#">글쓰기</a>
				</div>		
			</div>	
			<!-- 글쓰기 -->
			<%
				String session_id = (String)session.getAttribute("id");
				String session_level = (String)session.getAttribute("level");
				if(!session_id.equals("")||session!=null){%>
				<div class="writeFromDiv" style="display:none;">
					<form id="writeFrom" name="writeFrom" action="/BlogWrite.do"  method="post">
					<input type="hidden" name="session_id" value="<%=session_id %>">
					<input type="hidden" name="session_level" value="<%=session_level %>">
						<div class="blogContentsText col-12 mb-3 p-3" style="border-radius: 5px;border: 1px solid gray;">
							<table width=100% align=center border=0>
								<tr>
									<td>
										<select id="Thread" name="Thread" class="selectBoxForm">
											<option value="0">분류</option>
											<option value="1">게시판이름</option>
											<option value="2">게시판이름</option>
											<option value="3">게시판이름</option>
										</select>
										<select id="category" name="category" class="selectBoxForm">
											<option value="0">분류</option>
											<option value="1">자유</option>
											<option value="2">카테고리A</option>
											<option value="3">카테고리B</option>
										</select>
										<select id="GNS" name="GNS" class="selectBoxForm">
											<option value="G">공지</option>
											<option value="N" selected>일반</option>
											<option value="S">비밀</option>									
										</select>
									</td>	
								</tr> 
								<tr border=0>										
									<td align=center>
										<input id="subjectForm" name="subjectForm" class="TextSubjectViewForm" placeholder="제목을 입력하세요." style="text-align: left;">
									</td>
								</tr>
							<!--내용  -->             
								      
								<tr border=0>
									<td align=center colspan=0>	
										<textarea id="commentForm" rows="auto" name="commentForm" class="text_comment_viewForm"></textarea>
									</td>
								</tr>
								
								<tr>			
									<td colspan=0>
										<div>
											<!-- <input type="file" name="files" multiple="multiple"> -->
										</div>
									</td>
								
								</tr>								
							</table>
						</div>
						<div class="FunctionBtn text-right">			     
							<a class="btn btn-sm btn-outline-secondary my-0" id="blogSubmitBtn" href="#">등록</a> 
							<a class="btn btn-sm btn-outline-secondary my-0">취소</a>
						</div>
					</form>
									
				<%} %>
			
			
			
        </div>
    </div>
</div>
<script>		
			//p506 파일업로드시 크기및 확장자 체크
			//RegExp : 정규식 처리하는 객체
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;//파일 업로드 최대크기 5M
			
			function checkExtension(fileName,fileSize){
				
				if(fileSize >= maxSize){
					alert("파일 크기 초과");
					return false;
				}
				
				//정규식을 테스트하여 조건에 만족하면 true 아니면 false
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				
				return true;
			}//
			
			//p520
			//class로 지정된 uploadDiv 영역을 복제
			var cloneObj = $(".uploadDiv").clone();
			
			$("#uploadBtn").on("click",function(e){
				
				//FormData?
				//<form>태그와 같은 효과로 key와value
				//형태로 저장되는 객체로 페이지 전환없이
				//폼 데이터를 서버로 전송가능하다.
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				//업로드한 파일 내역을 변수에 대입
				//업로된 파일들은 FileList 형태로 대입된다.
				var files = inputFile[0].files;
				
				for(var i=0;i<files.length;i++){
					
					//파일 확장자,크기가 조건에 맞지 않으면 업로드 처리 불가
					if(!checkExtension(files[i].name,files[i].size)){
						return false;
					}
					
					//서버로 전송시 업로드 파일내역을 매개변수로 전달
					formData.append("uploadFile",files[i]);
				}				
				
				$.ajax({
					url:"/uploadAjaxAction",
					//일반적으로 서버로 전송시 query string 형태로
					//인식하는데 formData 전송시 이렇게 인식하지 
					//않도록 반드시 false로 지정해야 한다.
					processData:false,
					//contentType의 기본값이 
					//application/x-www-form-unlencoded;utf-8
					//로 선언되는데 formData를 이용하여 파일을 업로드
					//시에는 multipart/form-data로 인식시키기 위해
					//반드시 false로 지정해야 한다.
					contentType:false,
					data:formData,
					type:"post",
					dataType:"json",
					success:function(result){
						console.log(result);
						
						//p523 업로드된 파일내역을 화면에 출력
						showUploadedFile(result);
						
						//p521
						//파일 업로드 정상처리후 화면 초기화 작업
						$(".uploadDiv").html(cloneObj.html());
					}
				});//
				
			});//
			
			//p522 업로드 파일을 uploadResult 영역에
			//출력
			//업로드 파일을 보여주는 ul 태그 영역 초기값을 
			//변수에 대입
			var uploadResult = $(".uploadResult ul");
			
			//업로드한 파일내역을 출력하는 함수
			function showUploadedFile(uploadResultArr){
				
				var str = "";
				
				$(uploadResultArr).each(function(i,obj){
					//업로드한 파일이 이미지가 아니면 처리					
					if(!obj.image){
						
						//p537
						//파일 경로(한글깨짐 방지를 위해 인코딩 처리)
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						//일반파일인 경우 a 태그 추가
						str += "<li><a href='/download?fileName="+fileCallPath+"'>" + "<img src='/resources/img/attach.png'>" + obj.fileName + "</a>" +"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span></div></li>";
					}else{//업로드 파일이 이미지인 경우
						
						//p528 업로드 파일 한글 처리
						//매개변수로 파일명을 전달시
						//한글이 깨지므로 encodeURIComponent() 메서드를
						//사용하여 한글깨짐 방지
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_" + obj.uuid + "_" + obj.fileName);
					
						//p541
						//원본 파일명 가져오기
						var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
						
						//url에서  사용하기 위해 파일명의 \\를 /로 모두 변경
						originPath = originPath.replace(new RegExp(/\\/g),"/");
											
						str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a>" + "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span></div></li>";
						
					}
					
				});
				
				//uploadResult 영역에 표시
				uploadResult.append(str);
			}//showUploadedFile
			
			
			//p547 X 표시 클릭 처리
			$(".uploadResult").on("click","span",function(e){
				
				//업로드파일명
				var targetFile = $(this).data("file");
				//업로드 파일 형태(이미지,일반파일)
				var type = $(this).data("type");
				
				$.ajax({
					url:"/deleteFile",
					//클라이언트에서 서버로 전송(JSON타입)
					data: {fileName:targetFile,type:type},
					//서버가 응답처리시 데이터타입
					dataType:"text",
					type:"post",
					success:function(result){
						alert(result);
					}
				});//ajax end
			});//.uploadResult end

		});//ready
	</script>

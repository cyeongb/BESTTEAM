<%@page import="vo.QnaBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	// 조회된 게시물 정보를 담은 ArrayList 객체(articleList)와 페이지 정보를 담은 PageInfo 객체(pageInfo)를
	// request.getAttribute() 메서드로 가져오기
	ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>)request.getAttribute("reviewList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();

	//qna
	// String nowPage = (String) request.getAttribute("page"); // String 타입으로 setAttribute() 메서드에 저장했을 경우
	// ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
	QnaBean qnabean = new QnaBean();
// 	UserBean userbean = new UserBean();
	int qnaNum = qnabean.getQna_num();
	String qnaSubject = qnabean.getQna_subject();
	String qnaWriter = qnabean.getQna_writer();
	
	

	ArrayList<QnaBean> articleList2 = (ArrayList<QnaBean>) request.getAttribute("articleList2");
	PageInfo pageInfo2 = (PageInfo) request.getAttribute("pageInfo2");

	System.out.println("jsp에서 reviewList.size: " + reviewList.size());
	int listCount2 = pageInfo.getListCount();
	int nowPage2 = pageInfo.getPage();
	int maxPage2 = pageInfo.getMaxPage();
	int startPage2 = pageInfo.getStartPage();
	int endPage2 = pageInfo.getEndPage();
%>

	
 
<!DOCTYPE html>
<html lang="en">
<head>
<title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Great+Vibes"
	rel="stylesheet">

<link rel="stylesheet" href="./css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="./css/animate.css">

<link rel="stylesheet" href="./css/owl.carousel.min.css">
<link rel="stylesheet" href="./css/owl.theme.default.min.css">
<link rel="stylesheet" href="./css/magnific-popup.css">

<link rel="stylesheet" href="./css/aos.css">

<link rel="stylesheet" href="./css/ionicons.min.css">

<link rel="stylesheet" href="./css/bootstrap-datepicker.css">
<link rel="stylesheet" href="./css/jquery.timepicker.css">
<link rel="stylesheet" href="./css/product-single.css">

<link rel="stylesheet" href="./css/flaticon.css">
<link rel="stylesheet" href="./css/icomoon.css">
<link rel="stylesheet" href="./css/style.css">

<link href="jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="jquery.bxslider/jquery.bxslider.js"></script>

<script type="text/javascript">
	 
// $(document).ready(function(){$('.bxslider').bxSlider({  auto: true,speed: 500,pause: 4000,mode:'fade',autoControls: true,pager:true,}); });
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}

		
</script>
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
// qna 안  카테고리 버튼 작동 자바스크립트
 	$(document).ready(function(index) {
 		$('#ac1').show();
 		$('#ac2').hide();
 		$('#ac3').hide();
 	});

 	$(document).ready(function(index) {
 		$('#btn1_1').click(function() {

 			$('#ac1').show();
 			$('#ac2').hide();
 			$('#ac3').hide();
 			var offset = $('#btn1_1').offset();

 		});
 	});

 	$(document).ready(function(index) {
 		$('#btn2_1').click(function() {
 			$('#ac1').hide();
 			$('#ac2').show();
 			$('#ac3').hide();
 			var offset = $('#btn2_1').offset();

 		});
 	});

 	$(document).ready(function(index) {
 		$('#btn3_1').click(function() {
 			$('#ac1').hide();
 			$('#ac2').hide();
 			$('#ac3').show();
 			var offset = $('#btn3_1').offset();

 		});
 	});
</script> 

<script type="text/javascript">
// 상세정보, 리뷰, qna 버튼 작동 자바스크립트
	//  		$(document).ready(function(index){
	//  			$('#btn1').click(function(){
	//  				$('.ftco-section').show();
	//  	 		    $('.ftco-section').focus();
	//  	 		  $('.ftco=section').hide();
	//  				});

	//  			});
	//  		});

	$(document).ready(function(index) {
		$('#btn1').css('color', '#212529');
		$('#btn1').css('background-color', '#c29963');
		$('#btn1').css('border-color', '#c29963');
		// 					$('#btn1').css('color','#c29963');
		// 					$('#btn1').css('background-color','#101012');
		// 					$('#btn1').css('border-color','#c29963');
		$('#btn2').css('color', '#c29963');
		$('#btn2').css('background-color', '#101012');
		$('#btn2').css('border-color', '#c29963');
		$('#btn3').css('color', '#c29963');
		$('#btn3').css('background-color', '#101012');
		$('#btn3').css('border-color', '#c29963');
		$('#ft1').show();
		$('#ft2').hide();
		$('#ft3').hide();

	});

	$(document).ready(function(index) {
		$('#btn1').click(function() {
			$('#btn1').css('color', '#212529');
			$('#btn1').css('background-color', '#c29963');
			$('#btn1').css('border-color', '#c29963');
			$('#btn2').css('color', '#c29963');
			$('#btn2').css('background-color', '#101012');
			$('#btn2').css('border-color', '#c29963');
			$('#btn3').css('color', '#c29963');
			$('#btn3').css('background-color', '#101012');
			$('#btn3').css('border-color', '#c29963');

			$('#ft1').show();
			$('#ft2').hide();
			$('#ft3').hide();
			var offset = $('#btn1').offset();
			$('body,html').animate({
				scrollTop : offset.top
			}, 300);

		});
	});

	$(document).ready(function(index) {
		$('#btn2').click(function() {
			$('#btn2').css('color', '#212529');
			$('#btn2').css('background-color', '#c29963');
			$('#btn2').css('border-color', '#c29963');
			$('#btn1').css('color', '#c29963');
			$('#btn1').css('background-color', '#101012');
			$('#btn1').css('border-color', '#c29963');
			$('#btn3').css('color', '#c29963');
			$('#btn3').css('background-color', '#101012');
			$('#btn3').css('border-color', '#c29963');
			$('#ft2').show();
			$('#ft1').hide();
			$('#ft3').hide();
			var offset = $('#btn2').offset();
			$('body,html').animate({
				scrollTop : offset.top
			}, 300);
		});
	});

	$(document).ready(function(index) {
		$('#btn3').click(function() {
			$('#btn3').css('color', '#212529');
			$('#btn3').css('background-color', '#c29963');
			$('#btn3').css('border-color', '#c29963');
			$('#btn1').css('color', '#c29963');
			$('#btn1').css('background-color', '#101012');
			$('#btn1').css('border-color', '#c29963');
			$('#btn2').css('color', '#c29963');
			$('#btn2').css('background-color', '#101012');
			$('#btn2').css('border-color', '#c29963');
			$('#ft3').show();
			$('#ft1').hide();
			$('#ft2').hide();
			var offset = $('#btn3').offset();
			$('body,html').animate({
				scrollTop : offset.top
			}, 300);
		});
	});
	
	$(document).ready(function(){

        var quantitiy=0;
           $('.quantity-right-plus').click(function(e){
                
                var quantity = parseInt($(this).siblings('.quantity').val());

                if (quantity>=1) {
                	quantity = quantity + 1;
                	$(this).siblings('.quantity').val(quantity);
                }
                
            });

             $('.quantity-left-minus').click(function(e){

            	 var quantity = parseInt($(this).siblings('.quantity').val());

                 if (quantity>1) {
                 	quantity = quantity - 1;
                 	$(this).siblings('.quantity').val(quantity);
                 }
                 
            });
             
             
            
     });
	
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 
<script> 

var j = $.noConflict(true); // $.noConflict(true) 를 사용해서 $ -> 변수로 선언한 j로 바꾸니 해결!

j(document).ready(function(){ 

    var main = j('.bxslider').bxSlider({ 

    mode: 'fade', 

    auto: true,	//자동으로 슬라이드 

    controls : true,	//좌우 화살표	

    autoControls: true,	//stop,play 

    pager:true,	//페이징 

    pause: 3000, 

    autoDelay: 0,	

    slideWidth: 800, 

    speed: 300, 

    stopAutoOnclick:true 

}); 




j(".bx-stop").click(function(){	// 중지버튼 눌렀을때 

    main.stopAuto(); 

    j(".bx-stop").hide(); 

    j(".bx-start").show(); 

    return false; 

}); 




j(".bx-start").click(function(){	//시작버튼 눌렀을때 

    main.startAuto(); 

    j(".bx-start").hide(); 

    j(".bx-stop").show(); 

    return false; 

}); 




j(".bx-start").hide();	//onload시 시작버튼 숨김. 

}); 
$(document).ready(function(){
	$("#rere").hide();


$( '#rere1' ).click(
	    function() {
	        $( '#rere' ).toggle();
	    }
	);
 </script> 
<!-- <style type="text/css"> -->
<!--  b {  -->
<!--  	font-size: 25px;  -->
<!--  	font-color: gold;  -->
<!--  }  -->

<!--  .nav-link {  -->
<!--  	backgound-color: #c49B63;  -->
<!--  }  -->

<!--  .nav-link active {  -->
<!--  	backgound-color: #c49B63;  -->
<!--  }  -->

<!--  .ftco-menu {  -->
<!--  	padding-top: 12em !important;  -->
<!--  }  -->

<!--  .pb-5, .py-5 {  -->
<!--  	padding-bottom: 0 !important;  -->
<!--  }  -->

<!--  .mb-5, .my-5 {  -->
<!--  	margin-bottom: 0 !important;  -->
<!--  }  -->

<!--  .table tbody tr td {  -->
<!--  	text-align: left !important;  -->
<!--  }  -->

<!--  .div0525 {  -->
<!--  	float: right !important;  -->
<!--  }  -->
<!-- </style>  -->
	
<%
	ItemBean itemBean = (ItemBean) request.getAttribute("itemBean");
%>

</head>
<body>

	<header>
		<jsp:include page="/inc/header.jsp" />
	</header>

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/bg_3.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Product Detail</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">Home</a></span> <span>Product Detail</span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section">
		<div class="container">
			<div class="row">


<div class="container1">
	<span id="sd"><img src="./itemUpload/<%=itemBean.getItem_img() %>" style="width: 500px; height: 500px;"></span>

  <!-- Full-width images with number text -->
  <div class="mySlides">
    <div class="numbertext"></div>
      <img src="./images/tt.jpg"  id="sd">
  </div>

  <div class="mySlides">
    <div class="numbertext"></div>
      <img src="./images/tt3.jpg"  id="sd">
  </div>

  <div class="mySlides">
    <div class="numbertext"></div>
      <img src="./images/tt4.jpg"  id="sd">
  </div>

  <div class="mySlides">
    <div class="numbertext"></div>
      <img src="./images/tt5.jpg"  id="sd">
  </div>

  

  <!-- Next and previous buttons -->
<!--   <a class="prev" onclick="plusSlides(-1)">&#10094;</a> -->
<!--   <a class="next" onclick="plusSlides(1)">&#10095;</a> -->

  <!-- Image text -->
  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <!-- Thumbnail images -->
  
</div>
				





				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3><%=itemBean.getItem_name() %></h3>

					<p class="price">
						<span><%=itemBean.getItem_price() %> 원</span>
					</p>
					<p><%=itemBean.getItem_info() %></p>
					<div class="col-md-12 mb-3">

						<div class="tagcloud">
							<a href="" class="tag-cloud-link"><%=itemBean.getItem_favor_acidity() %></a>
							<a href="" class="tag-cloud-link"><%=itemBean.getItem_favor_aroma() %></a> 
							<a href="" class="tag-cloud-link"><%=itemBean.getItem_favor_bitterness() %></a>
							<a href="" class="tag-cloud-link"><%=itemBean.getItem_favor_body() %></a>
							<a href="" class="tag-cloud-link"><%=itemBean.getItem_favor_sweetness() %></a>
						</div>


					</div>

					<div class="row mt-4">
						<div class="col-md-6">
							<div class="form-group d-flex"></div>
						</div>
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
<!-- 							<span class="input-group-btn mr-2"> -->
<!-- 								<button type="button" class="quantity-left-minus btn" -->
<!-- 									data-type="minus" data-field=""> -->
<!-- 									<i class="icon-minus"></i> -->
<!-- 								</button> -->
<!-- 							</span> <input type="text" id="quantity" name="quantity" -->
<!-- 								class="quantity form-control input-number" value="1" min="1" max="100" -->
<!-- 								style="width: 10px; height: 10px;"> <span -->
<!-- 								class="input-group-btn ml-2"> -->
<!-- 								<button type="button" class="quantity-right-plus btn" -->
<!-- 									data-type="plus" data-field=""> -->
<!-- 									<i class="icon-plus"></i> -->
<!-- 								</button> -->
<!-- 							</span> -->
							<div class="input-group mb-3">
<!--             <span class="input-group-btn mr-2"> -->
<!--                   </span> -->
                  
                    
<!--               <span class="input-group-btn ml-2"> -->
                    <button type="button" class="quantity-left-minus btn input-group-btn" >
                     	<i class="icon-minus"></i>
                    </button>&nbsp;
                   <input type="text" name="quantity"  class="quantity form-control input-number" value="1" min="1" max="100"/>&nbsp;
                    <button type="button" class="quantity-right-plus btn input-group-btn" >
                       <i class="icon-plus"></i>
                   </button>
<!--                  </span> -->
                      </div>
						</div>
					</div>
					<p>
						<a href="cart.jsp" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart">Add to Cart</a>
						<a href="cart.html" class="btn btn-primary py-3 px-5">BUY</a>
						
								
		<div class="row1">
					
   <div class="row1">
    <div class="column">
      <img class="demo cursor" id="im" src="./images/tt.jpg"  onclick="currentSlide(1)" alt="">
    </div>
    <div class="column"> 
      <img class="demo cursor" id="im" src="./images/tt3.jpg"  onclick="currentSlide(2)" alt="">
    </div>
    <div class="column">
      <img class="demo cursor" id="im" src="./images/tt4.jpg"  onclick="currentSlide(3)" alt="">
    </div>
    <div class="column">
      <img class="demo cursor" id="im" src="./images/tt5.jpg"  onclick="currentSlide(4)" alt="">
    </div>
    
  </div>
					



				</div>
			</div>
		</div>
	</section>

						<section class="ftco-menu mb-5 pb-5" >
							<div class="nav ftco-animate nav-pills justify-content-center"
								id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-top: -100px;">

								<a class="nav-link active"  data-toggle="pill"
									href="#v-pills-0" role="tab" aria-controls="v-pills-0" id="btn1"
									aria-selected="true" style="width: 200px; text-align: center;">상세정보</a> 
								<a class="nav-link"  data-toggle="pill" href="#v-pills-1" id="btn2"
									role="tab" aria-controls="v-pills-1" aria-selected="false" style="width: 200px; text-align: center;">상품후기</a>
								<a class="nav-link"  data-toggle="pill" href="#v-pills-2" id="btn3"
									role="tab" aria-controls="v-pills-2" aria-selected="false" style="width: 200px; text-align: center;">상품Q&A</a>  
								
								<%  String sessionId = (String) session.getAttribute("id");
							
									if(sessionId != null) {
										if(sessionId.equals("admin")) { %>
											<a class="nav-link"  href="itemModify.em?item_num=<%=itemBean.getItem_num() %>" id="btn4"
												role="tab" aria-controls="v-pills-2" aria-selected="false" style="width: 200px; text-align: center; 
												color: white !important;">상품정보 수정</a>
												
											<a class="nav-link"  href="itemDeletePro.em?item_num=<%=itemBean.getItem_num() %>" id="btn4"
												role="tab" aria-controls="v-pills-2" aria-selected="false" style="width: 200px; text-align: center; 
												color: white !important;">상품정보 삭제</a>
								<%  	} 
									} %>
					
								<!-- 		              <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Desserts</a> -->
							
							</div>
						
						
						</section>

							
	<section class="ftco-section" id="ft1">
		<div class="row rows" >
			<div class="col-md-12 ftco-animate">
					
					<table class="table">
						<tr>
							<td><class="img11"><img src="./itemUpload/<%=itemBean.getItem_content() %>"></td>
						</tr>

					</table>
				</div>
			</div>
	</section>

	<section class="ftco=section" id="ft2">
		<div class="container">
			<div class="row d-flex">
				<div class="blog-entry align-self-stretch">
					<br>
					<br>
					<tr>REVIEW</tr>
					<table class="table thead-light">
					<%
											if (reviewList != null && listCount > 0) {
												
										%>
					
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
						<%
						for (int i = 0 ; i < reviewList.size() ; i++) {
							System.out.println(reviewList.get(i).getReview_num());
						
						%>
						<tr>
							
 							<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse"><%=reviewList.size()-i %></a><div id="collapse" class="panel-collapse collapse in">
 							<div class="panel-body"><br><%=reviewList.get(i).getReview_content() %></div></div></td>
 							<td><%=reviewList.get(i).getReview_subject() %></td>
 							<td><%=reviewList.get(i).getReview_date() %></td> 
 							<td><%=reviewList.get(i).getReview_user_id() %></td> 
 							<td><%=reviewList.get(i).getReview_readcount() %></td> 
							
						</tr>
<%-- 						<tr><td id="rere" colspan="5"><%=reviewList.get(i).getReview_content() %></td></tr> --%>

						
               <%}
 				}%>	 
					</table>
					<a href='reviewPro.re?item_num=<%=itemBean.getItem_num() %>' class="btn btn-primary btn-outline-primary" style="float: right;">글쓰기</a>
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<li><a href="#">&lt;</a></li>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&gt;</a></li>
								</ul>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

				
<!-- QNA -->
	<section class="ftco=section" id="ft3">
		<div class="container">
			<div class="row d-flex">
				<div class="blog-entry align-self-stretch" style="margin: auto;">

					    <p class="breadcrumbs mt-5" style="text-align: center;"> 
							<span class="mr-2"> <a href="faq.jsp"> <b>배송 관련</b> </a></span>| 
							<span><a href="faq2.jsp"> 결제 관련 </a></span>|
							<span><a href="faq3.jsp"> 교환/환불 관련 </a></span> 
							<a href="qnaWriteForm.qna?item_num=<%=itemBean.getItem_num() %>">qna 작성</a>
					 	</p>

					<section class="ftco=section" id="ac1">
						<div class="container">
							<table class="table thead-light" id="ac1">
								<tr>
									<td><a data-toggle="collapse">번호</a></td>
									<td><a data-toggle="collapse">제목 </a></td>
									<td><a data-toggle="collapse">작성자</a></td>
									<td><a data-toggle="collapse">작성일</a></td>
									</tr>
									<%
										if (articleList2 != null && listCount2 > 0) {
											for (int i = 0; i < articleList2.size(); i++) {
									%>
									
								<tr>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=articleList2.size() - i %></a></td>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=articleList2.get(i).getQna_subject() %> </a>
										<div id="collapse<%=i %>" class="panel-collapse collapse in">
											<div class="panel-body">
												<br> <b><%=articleList2.get(i).getQna_content() %></b>
												<section class="ftco=section" id="ac1">
													<div class="container">
														<div class="col-md-8 ftco-animate div0525">
															<a href="QnaModifyForm.qna?qna_num=<%=articleList2.get(i).getQna_num() %>" class="btn btn-primary btn-outline-primary" style="float: right;">수정</a> 
															<a href="QnaDeletePro.qna?qna_num=<%=articleList2.get(i).getQna_num() %>" class="btn btn-primary btn-outline-primary" style="float: right;" onclick="delconfirm('<%=articleList2.get(i).getQna_num() %>')">삭제</a>
														</div>
													</div>
												</section>
											</div>
										</div>
									</td>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=articleList2.get(i).getQna_writer() %></a></td>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=articleList2.get(i).getQna_date() %></a></td>
								</tr>
								<%
									}
									}
								%>
							</table>
						</div>
					</section>
				</div>
			</div>
		</div>

	</section>

<section>
		<div class="container" >
			<div class="row" >
				<div class="col-md-4" style="margin-top: 30px; width: 80%;">
					<div class="media d-block text-center block-6 services" >
						<div
							class="icon d-flex justify-content-center align-items-center mb-5" style="border: 1px solid #FAFAFA;">
							<span class="flaticon-choices" style="color: #FAFAFA;"></span>
						</div>
						<div class="media-body">
							<h3 class="heading" style="color: #FAFAFA;">Easy to Order</h3>
							
						</div>
					</div>
				</div>
				<div class="col-md-4" style="margin-top: 30px; width: 80%;">
					<div class="media d-block text-center block-6 services">
						<div
							class="icon d-flex justify-content-center align-items-center mb-5" style="border: 1px solid #FAFAFA;">
							<span class="flaticon-delivery-truck" style="color: #FAFAFA;"></span>
						</div>
						<div class="media-body">
							<h3 class="heading" style="color: #FAFAFA;">Fastest Delivery</h3>
							
						</div>
					</div>
				</div>
				<div class="col-md-4" style="margin-top: 30px; width: 80%;">
					<div class="media d-block text-center block-6 services">
						<div
							class="icon d-flex justify-content-center align-items-center mb-5" style="border: 1px solid #FAFAFA;">
							<span class="flaticon-coffee-bean" style="color: #FAFAFA;"></span>
						</div>
						<div class="media-body">
							<h3 class="heading" style="color: #FAFAFA;">Quality Coffee</h3>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-section img">
		<jsp:include page="/inc/footer.jsp" />
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="./js/jquery.min.js"></script>
	<script src="./js/jquery-migrate-3.0.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.easing.1.3.js"></script>
	<script src="./js/jquery.waypoints.min.js"></script>
	<script src="./js/jquery.stellar.min.js"></script>
	<script src="./js/owl.carousel.min.js"></script>
	<script src="./js/jquery.magnific-popup.min.js"></script>
	<script src="./js/aos.js"></script>
	<script src="./js/jquery.animateNumber.min.js"></script>
	<script src="./js/bootstrap-datepicker.js"></script>
	<script src="./js/jquery.timepicker.min.js"></script>
	<script src="./js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>
	<script src="./js/jquery.bxslider.min.js"></script>




</body>
</html>
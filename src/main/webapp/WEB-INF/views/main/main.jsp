<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="stylesheet" href="../resources/css/main/main.css" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="../resources/js/main/main.js"></script>
<title>Insert title here</title>
<style>
	#section #first {
		position:fixed;
		border-bottom:0px;
	}
	/* --------------- section second --------------- */
	#section #second {
	  width: 100%;
	  height: 1000px;
	  overflow: hidden;
	  position: relative;
	}
	#section #second #img_box {
	  width: 500%;
	  display: flex;
	}
	#section #second .slide_img {
	  width: 100%;
	  height: 1000px;
	}
	#section #second .slide_prev_btn {
	  width: 1.5em;
	  height: 1.5em;
	  background-color: rgba(255, 255, 255, 0.445);
	  border-radius: 50%;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  font-size: 2em;
	  position: absolute;
	  top: 500px;
	  left: 10px;
	}
	#section #second .slide_next_btn {
	  width: 1.5em;
	  height: 1.5em;
	  background-color: rgba(255, 255, 255, 0.445);
	  border-radius: 50%;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  font-size: 2em;
	  position: absolute;
	  top: 500px;
	  right: 10px;
	}
	/* --------------- section third --------------- */
	#section #third {
	  width: 1400px;
	  height:600px;
	  margin: auto;
	  margin-top: 100px;
	  text-align: center;
	}
	#section #third #top {
	  width: 1400px;
	  height: 60px;
	  line-height: 60px;
	  font-size: 2.2em;
	  font-weight: 600;
	}
	#section #third #middle {
	  width: 1400px;
	  height: 30px;
	  line-height: 30px;
	  font-size: 0.9em;
	  color: grey;
	  opacity: 0.7;
	}
	#section #third #bottom {
	  width: 1400px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	#section #third #bottom #img_box {
	  width: 1200px;
	  display: flex;
	  justify-content:center;
	  align-items:center;
	  font-size: 14px;
	  font-weight: 600;
	  margin:10px 0;
	  overflow:hidden;
	}
	#section #third .img_items {
		width:260px;
		height:320px;
		border:1px solid white;
	}
	#section #third .img_items:hover {
		border:1px solid lightgrey;
	}
	#section #third #bottom .new_product_img {
	  width: 260px;
	  height: 260px;
	  margin:0 12px;
	  margin:auto;
	  cursor:pointer;
	}
	#section #third #bottom .new_product_img2 {
	  width: 260px;
	  height: 260px;
	  margin:0 12px;
	  margin:auto;
	  display:none;
	  cursor:pointer;
	}
	#section #third #bottom .slide_prev_btn {
	  font-size: 3em;
	  margin-right: 30px;
	  position: relative;
	  top: -30px;
	  cursor: pointer;
	}
	#section #third #bottom .slide_next_btn {
	  font-size: 3em;
	  margin-left: 30px;
	  position: relative;
	  top: -30px;
	  cursor: pointer;
	}
	#section #third .view_more {
	  background: white;
	  border: 1px solid grey;
	  width: 108px;
	  height: 36px;
	  opacity: 0.6;
	  font-size: 0.9em;
	  font-variant: small-caps;
	  font-weight: 900;
	  line-height: 30px;
	  margin: auto;
	  margin-top:20px;
	  display: flex;
	  justify-content: center;
	  border-radius: 2px;
	  cursor: pointer;
	}
	/* --------------- section fourth --------------- */
	#section #fourth {
	  width: 100%;
	  height: 570px;
	  margin: auto;
	  margin-top: 150px;
	}
	#section #fourth #img_box {
	  width: 100%;
	  position: absolute;
	}
	#section #fourth #content_box {
	  position: relative;
	  width: 400px;
	  height: 200px;
	  display: flex;
	  flex-direction: column;
	  justify-content: space-between;
	  top: 200px;
	  left: 400px;
	}
	#section #fourth img {
	  width: 100%;
	  height: 570px;
	}
	#section #fourth .text_up {
	  font-size: 45px;
	  line-height: 40px;
	  font-weight: 900;
	  color: white;
	}
	#section #fourth .text_down {
	  font-size: 19px;
	  line-height: 28px;
	  color: white;
	}
	#section #fourth .view_more {
	  background: white;
	  border: 1px solid grey;
	  width: 108px;
	  height: 36px;
	  font-size: 0.9em;
	  font-variant: small-caps;
	  font-weight: 900;
	  line-height: 30px;
	  display: flex;
	  justify-content: center;
	  border-radius: 2px;
	  cursor: pointer;
	}
	/* --------------- section fifth --------------- */
	#section #fifth {
	  width: 1400px;
	  height: 600px;
	  margin: auto;
	  margin-top: 150px;
	  text-align: center;
	}
	#section #fifth #top {
	  width: 1400px;
	  height: 60px;
	  line-height: 60px;
	  font-size: 2.3em;
	  font-variant: small-caps;
	  font-weight: 600;
	}
	#section #fifth #middle1 {
	  width: 1400px;
	  height: 30px;
	  line-height: 30px;
	  font-size: 1.5em;
	  font-variant: small-caps;
	  font-weight: 900;
	  color: grey;
	  opacity: 0.7;
	}
	#section #fifth #middle2 {
	  width: 420px;
	  margin: auto;
	  margin-top: 25px;
	  display: flex;
	  justify-content: space-between;
	}
	#section #fifth .middle2 a {
	  font-size: 1em;
	  color: grey;
	  opacity: 0.8;
	  position: relative;
	}
	#section #fifth .middle2 a::before {
	  content: "";
	  position: absolute;
	  width: 100%;
	  height: 2px;
	  bottom: -4px;
	  left: 0px;
	  background-color: #000000;
	  transition: all 0.2s ease-in-out;
	  transform: scale(0, 0);
	  visibility: hidden;
	}
	#section #fifth .middle2:hover a::before {
	  transform: scale(1, 1);
	  visibility: visible;
	}
	#section #fifth #bottom {
	  width: 1400px;
	  height: 400px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	#section #fifth #bottom #img_box {
	  width: 1200px;
	  display: flex;
	  justify-content: space-between;
	  align-items: center;
	  font-size: 0.9em;
	  font-weight: 600;
	  overflow:hidden;
	}
	#section #fifth #bottom .new_product_box:hover {
		border:1px solid lightgrey;
	}	
	#section #fifth #bottom .new_product_box {
	  width: 260px;
	  height:320px;
	  border:1px solid white;
	}
	#section #fifth #bottom .new_product_img {
	  width: 260px;
	  height: 260px;
	  margin: 0 12px;
	  cursor:pointer;
	  margin:auto;
	}
	#section #fifth #bottom .new_product_img2 {
	  width: 260px;
	  height: 260px;
	  margin: 0 12px;
	  margin:auto;
	  display:none;
	  cursor:pointer;
	}
	#section #fifth #bottom .slide_prev_btn {
	  font-size: 3em;
	  margin-right: 30px;
	  position: relative;
	}
	#section #fifth #bottom .slide_next_btn {
	  font-size: 3em;
	  margin-left: 30px;
	  position: relative;
	}
	#section #fifth .view_more {
	  background: white;
	  border: 1px solid grey;
	  width: 108px;
	  height: 36px;
	  opacity: 0.6;
	  font-size: 0.9em;
	  font-variant: small-caps;
	  font-weight: 900;
	  line-height: 30px;
	  margin: auto;
	  display: flex;
	  justify-content: center;
	  border-radius: 2px;
	  cursor: pointer;
	}
	/* --------------- section sixth --------------- */
	#section #sixth {
	  width: 100%;
	  height: 800px;
	  margin: auto;
	  margin-top: 100px;
	  text-align: center;
	}
	#section #sixth iframe {
	  width: 600px;
	  height: 800px;
	}
	/* --------------- section seventh --------------- */
	#section #seventh {
	  width: 1200px;
	  height: 400px;
	  margin: auto;
	  margin-top: 150px;
	}
	#section #seventh #img_box {
	  position: absolute;
	}
	#section #seventh #img_box img {
	  width: 1200px;
	  height: 360px;
	}
	#section #seventh #content_box {
	  width: 400px;
	  height: 150px;
	  display: flex;
	  flex-direction: column;
	  justify-content: space-around;
	  position: relative;
	  top: 100px;
	  left: 120px;
	}
	#section #seventh #content_box #text_up {
	  font-size: 30px;
	  font-weight: 900;
	  color: white;
	}
	#section #seventh #content_box #text_down {
	  color: grey;
	  font-size: 15px;
	  font-weight: 900;
	}
	#section #seventh #view_more {
	  background: white;
	  width: 108px;
	  height: 36px;
	  font-size: 0.9em;
	  font-variant: small-caps;
	  font-weight: 900;
	  line-height: 30px;
	  display: flex;
	  justify-content: center;
	  border-radius: 2px;
	  cursor: pointer;
	}
</style>
<script>
	$(function(){
		// 스크롤 위치를 세션 스토리지에 저장
		window.addEventListener('scroll', function() {
		  sessionStorage.setItem('scrollMain', window.scrollY);
		});
		// 세션 스토리지에 저장된 스크롤 위치를 불러옴
		var scrollMain = sessionStorage.getItem('scrollMain');
		// 스크롤 위치를 조정
		if (scrollMain !== null) {
		  window.scrollTo(0, scrollMain);
		}
		//신상품목록 좌우버튼
		$('#third #img_box').slick({
			  slidesToShow: 4,
			  slidesToScroll: 4,
			  autoplay: true,
			  autoplaySpeed: 4000,
			  prevArrow:$('#third .slide_prev_btn'),
			  nextArrow:$('#third .slide_next_btn'),
			});
		$('#fifth #img_box').slick({
			  slidesToShow: 4,
			  slidesToScroll: 4,
			  autoplay: true,
			  autoplaySpeed: 4000,
			  prevArrow:$('#fifth .slide_prev_btn'),
			  nextArrow:$('#fifth .slide_next_btn'),
		});
	});
</script>
</head>
<body>
	<section>
		<div id="second">
		  <div class="slide_prev_btn">
		    <span class="material-symbols-rounded" id="left_btn">arrow_back_ios</span>
		  </div>
		  <div id="img_box">
		    <img src="../resources/pro/7.jpg" class="slide_img" />
		    <img src="../resources/pro/3.jpg" class="slide_img" />
		    <img src="../resources/pro/6.jpg" class="slide_img" />
		    <img src="../resources/pro/4.jpg" class="slide_img" />
		    <img src="../resources/pro/5.jpg" class="slide_img" />
		  </div>
		  <div class="slide_next_btn">
		    <span class="material-symbols-rounded" id="right_btn">arrow_forward_ios</span>
		  </div>
		</div>

		<div id="third">
			<div id="top">신상품</div>
		  <div id="middle">NEW ARRIVALS</div>
		  <div id="bottom">
		    <div class="slide_prev_btn">
		    	<span class="material-symbols-rounded">arrow_back_ios</span>
		    </div>
		    <div id="img_box">
		      <c:forEach items="${new_list}" var="nlist" varStatus="sts">
		      <div class="img_items">
		        <div><img src="../resources/pro/${nlist.pImg1}" class="new_product_img" onclick="location='../product/content?pCode=${nlist.pCode}'"/></div>
		        <div><img src="../resources/pro/${nlist.pImg2}" class="new_product_img2" onclick="location='../product/content?pCode=${nlist.pCode}'"/></div>
		        <div>${nlist.pName}</div>
		        <div><fmt:formatNumber pattern="#,###" value="${nlist.pPrice}"/>원</div>
		      </div>
		      </c:forEach>
		    </div>
		    <div class="slide_next_btn">
			    	<span class="material-symbols-rounded">arrow_forward_ios</span>
		    </div>
		  </div>
		  <div class="view_more" onclick="location='../product/display_list?pShow=1&pCode=p'">view more</div>
		</div>
		
		<div id="fourth">
		  <div id="img_box"><img src="../resources/pro/11.jpg" /></div>
		  <div>
		    <div id="content_box">
		      <div class="text_up">데이라이트 백팩 3.0</div>
			      <div class="text_down">
					        디자인 디테일부터 기능성까지 갖춘<br>당신의 일상을 함께할 데일리 백팩
			      </div>
		      <div class="view_more" onclick="location='../product/content?pCode=p010501090'">view more</div>
		    </div>
		  </div>
		</div>
		
		<div id="fifth">
		  <div id="top">베스트 아이템</div>
		  <div id="middle1">best item</div>
		  <div id="middle2">
		    <div class="middle2" onclick="location='main?pCode=p'"><a>전체</a></div>
		    <div class="middle2" onclick="location='main?pCode=p__03'"><a>아우터</a></div>
		    <div class="middle2" onclick="location='main?pCode=p__01'"><a>상의</a></div>
		    <div class="middle2" onclick="location='main?pCode=p__02'"><a>하의</a></div>
		    <div class="middle2" onclick="location='main?pCode=p__07'"><a>신발</a></div>
		    <div class="middle2" onclick="location='main?pCode=p__06'"><a>모자</a></div>
		    <div class="middle2" onclick="location='main?pCode=p__05'"><a>가방</a></div>
		  </div>
		  <div id="bottom">
		    <div class="slide_prev_btn">
			      <span class="material-symbols-rounded">arrow_back_ios</span>
		    </div>
		    <div id="img_box">
		    	<c:forEach items="${best_list}" var="blist">
		      <div class="new_product_box">
		        <img src="../resources/pro/${blist.pImg1}" class="new_product_img" onclick="location='../product/content?pCode=${blist.pCode}'"/>
		        <img src="../resources/pro/${blist.pImg2}" class="new_product_img2" onclick="location='../product/content?pCode=${blist.pCode}'"/>
		        <div>${blist.pName}</div>
		        <div><fmt:formatNumber pattern="#,###" value="${blist.pPrice}"/>원</div>
		      </div>
		    	</c:forEach>
		    </div>
		    <div class="slide_next_btn">
			      <span class="material-symbols-rounded">arrow_forward_ios</span>
		    </div>
		  </div>
		  <div class="view_more" onclick="location='../product/display_list?pShow=2&pCode=p'">view more</div>
		</div>
		
		<div id="sixth">
		  <iframe
		    src="https://www.youtube.com/embed/TKtW2bN3VMg?autoplay=1&mute=1&loop=1&playlist=TKtW2bN3VMg&modestbranding=1"
		    title="YouTube video player"
		    frameborder="0"
		    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
		    allowfullscreen
		  >
		    이 브라우저는 frame태그를 지원하지 않습니다!
		  </iframe>
		</div>
		
		<div id="seventh">
		  <div id="img_box">
		    <img src="../resources/pro/12.jpg" />
		  </div>
		  <div id="content_box">
		    <div id="text_up">온라인스토어 회원 헤택</div>
		    <div id="text_down">
		     	할인+적립금 헤택은 회원 등급에 따라 차등 적용
		    </div>
		    <div id="view_more" onclick="location='../product/membership'">view more</div>
		  </div>
		</div>
	</section>
</body>
</html>
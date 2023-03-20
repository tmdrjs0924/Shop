<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		section {
      width: 100%;
      height: 100%;
      display: flex;
    }
    section #sidemenu {
      width: 15%;
      border-right: 1px solid black;
    }
    section #sidemenu #up {
    	width:100%;
    	display:flex;
    	justify-content:space-between;
    	align-items:center;
 			height:40px;
 			font-size:14px;
 			font-weight:900;
 			padding-left:15px;
 			border-bottom:1px solid black;
 			background:#F1EAE1;
    }
    section #sidemenu #up:hover .text {
    	color:maroon;
    }
    section #sidemenu #menu_icon {
    	font-size: 35px;
    	margin-right:10px;
 		}
 		section #menu_icon2 {
 			background:white;
 			display:none;
 			position:relative;
 			height:45px;
 			top:20px;
 			left:-5px;
 			padding-left:5px;
 			box-shadow:3px 3px 4px 1px lightgrey;
 		}
 		section #menu_icon2 #menu_view_btn {
 			font-size:45px;
 		}
 		section #sidemenu .view_icon {
    	font-size: 25px;
    	margin-right:10px;
 		}
 		section #sidemenu .hide_icon {
    	font-size: 25px;
    	margin-right:10px;
    	display:none;
 		}
 		section #sidemenu ul {
    	width:100%;
 			padding:0px;
 			margin:0px;
 		}
 		section #sidemenu ul li {
    	width:100%;
 			list-style:none;
 			line-height:40px;
 			cursor:pointer;
 			border-bottom:1px solid black;
 		}
 		section #sidemenu > ul > li {
 			height:40px;
 			font-size:14px;
 			font-weight:900;
 			text-indent:15px;
 			overflow:hidden;
 			background:#F1EAE1;
 		}
 		section #sidemenu > ul > .main > div {
 			display:flex;
 			justify-content:space-between;
 			align-items:center;
 			height:40px;
 			border-bottom:1px solid black;
 		}
 		section #sidemenu > ul > li:hover .text {
 			font-size:15px;
 			color:maroon;
 		}
 		section #sidemenu .sub {
 			font-size:13px;
 			font-weight:900;
 			text-indent:30px;
 			float:left;
 			visibility:hidden;
 			opacity:0;
 			transition:all 0.3s ease-in-out;
 		}
 		section #sidemenu .sub li {
 			height:40px;
 			color:#562912;
 			background:#FFFBF3;
 		}
 		section #sidemenu .sub li:hover {
 			background:#562912;
 			color:#F2F2F2;
 		}
    section #product {
      width: 85%;
    }
    section #product #product_title {
    	font-size:20px;
    	font-weight:900;
    	text-indent:15px;
    	letter-spacing:1px;
    	height:40px;
    	line-height:40px;
    	border-bottom:1px solid black;
    }
		section table {
			max-width:1500px;
			min-height:600px;
			margin:auto;
			margin-top:50px;
		}
		section table td {
			width:330px;
			height:450px;
		}
		section table .img_box {
			width:330px;
			height:330px;
			display:flex;
			flex-direction:column;
			align-items:center;
			justify-content:center;
			margin:auto;
			font-size:15px;
			font-weight:600;
		}
		section table .pname {
			width:210px;
			text-align:center;
			margin-top:10px;
		}
		section table .pname span {
			cursor:pointer;
		}
		section table .etc_box {
			width:330px;
			height:80px;
			margin:auto;
			text-align:center;
		}
		section table .etc_box .dc {
			font-size:12px;
			color:grey;
		}
		section table .etc_box .price {
			font-size:14px;
			margin-bottom:5px;
		}
		section .wish_cart_box img {
			cursor:pointer;
		}
		section table .product_img1 {
			width: 280px;
	 		height: 280px;
	 		cursor:pointer;
		}
		section table .product_img2 {
			width: 280px;
	  	height: 280px;
			display:none;
	 		cursor:pointer;
		}
		section table .wish_img,
		section table .cart_img {
			width: 25px;
	  	height: 25px;
		}
		section .stitle {
			font-size:15px;
			font-weight:900;
			text-indent:15px;
		}
		section .ctitle {
			font-size:15px;
			font-weight:900;
			text-indent:15px;
			height:40px;
			line-height:40px;
			border-bottom:1px solid lightgrey;
			display:flex;
			justify-content:space-between;
			align-items:center;
			padding-right:10px;
		}
		section #namesearch {
			display: flex;
			justify-content:space-between;
			align-items:center;
			height:40px;
			border-bottom:1px solid lightgrey;
		}
		section #pricesearch {
			display: flex;
			justify-content:space-between;
			align-items:center;
			height:40px;
			border-bottom:1px solid lightgrey;
		}
		section #colorsearch {
			display:flex;
			flex-wrap:wrap;
			margin-top:5px;
		}
		section #searchbox {
			display: flex;
			justify-content:space-between;
			align-items:center;
			margin-right:10px;
		}
		section #keyword {
			width:150px;
			height:30px;
			outline:none;
			border-radius:5px;
			border:1px solid lightgrey;
			font-size:14px;
			text-indent:10px;
		}
		section #ssubmit {
			border-radius:5px;
			background:white;
			border:1px solid lightgrey;
			position:relative;
			width:40px;
			height:30px;
			font-size:13px;
			font-weight:900;
			color:#CCCCCC;
			cursor:pointer;
		}
		section #pricebox {
			margin-right:10px;
			display:flex;
			align-items:center;
		}
		section #sprice,
		section #eprice {
			width:70px;
			height:25px;
			border:1px solid lightgrey;
			border-radius:5px;
			text-align:right;
			outline:none;
		}
		section #price_btn {
			font-weight:900;
			width:40px;
			height:25px;
			border:1px solid lightgrey;
			text-align:center;
			border-radius:5px;
			color:lightgrey;
			margin-left:2px;
			cursor:pointer;
		}
		section #reset_btn {
			width:60px;
			height:30px;
			border:1px solid lightgrey;
			text-align:center;
			border-radius:5px;
			color:grey;
			margin-left:2px;
			outline:none;
			cursor:pointer;
		}
		#colorsearch div {
        width:25px;
        height:25px;
        text-align:center;
        border-radius:50%;
        margin:5px;
        border:1px solid #CCCCCC;
        cursor:pointer;
    }
    #red {
      background:red;
    }
    #burgundy {
      background:maroon;
    }
    #pink {
      background:pink;
    }
    #orange {
      background:orange;
    }
    #yellow {
      background:yellow;
    }
    #ivory {
      background:ivory;
    }
    #beige {
      background:beige;
    }
    #oatmeal {
      background:rgb(240, 216, 186);
    }
    #mustard {
      background:rgb(238, 188, 51);
    }
    #melange {
      background:lightgray;
    }
    #white {
      background:white;
    }
    #green {
      background:green;
    }
    #khaki {
      background:rgb(90, 100, 52);
    }
    #olive {
      background:olive;
    }
    #blue {
      background:blue;
    }
    #navy {
      background:navy;
    }
    #lilac {
      background:rgb(226, 176, 226);
    }
    #purple {
      background:purple;
    }
    #violet {
      background:violet;
    }
    #black {
      background:black;
    }
    #grey {
      background:gray;
    }
    #charcoal {
      background:rgb(70, 70, 70);
    }
    #brown {
      background:rgb(116, 76, 24);
    }
    #denim {
      background:skyblue;
    }
		section #paging {
			margin:auto;
			margin:50px 0;
			font-size:16px;
			font-weight:700;
			color:#D5D5D5;
			text-align:center;
			display:flex;
			justify-content:center;
			align-items:center;
			position:relative;
			bottom:0px;
		}
		section #paging a {
			padding:10px 12px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script>
		$(function(){
			//상품이미지에 마우스를 올렸을 때 보조이미지 보이기
			test1=$(".product_img1");
			$(".product_img1").mouseover(function(){
				n=test1.index(this);
				$(".product_img1").eq(n).css("display","none");
				$(".product_img2").eq(n).css("display","table-cell");
			});
			test2=$(".product_img2");
			$(".product_img2").mouseout(function(){
				n=test2.index(this);
				$(".product_img2").eq(n).css("display","none");
				$(".product_img1").eq(n).css("display","table-cell");
			});
			//사이드메뉴 클릭 시 하위메뉴 보이기
			test3=$(".main");
			$(".main").click(function(){
				n=test3.index(this);
				if($(".main").eq(n).css("overflow")=="hidden"){
					$(".main").css("overflow","hidden");
					$(".hide_icon").css("display","none");
					$(".view_icon").css("display","inline");
					$(".main").eq(n).css("overflow","visible");
					$(".sub").eq(n).css("visibility","visible");
					$(".sub").eq(n).css("opacity","1");
					$(".view_icon").eq(n).css("display","none");
					$(".hide_icon").eq(n).css("display","inline");
				}
				else{
					$(".main").eq(n).css("overflow","hidden");
					$(".sub").eq(n).css("visibility","hidden");
					$(".sub").eq(n).css("opacity","0");
					$(".view_icon").eq(n).css("display","inline");
					$(".hide_icon").eq(n).css("display","none");
				}
			});
			//사이드바 메뉴 활성화/비활성화
			$("#menu_icon").click(function(){
				$("#sidemenu").css("display","none");
				$("#menu_icon2").css("display","block");
				$("#product").css("width","100%");
			});
			$("#menu_icon2").click(function(){
				$("#menu_icon2").css("display","none");
				$("#sidemenu").css("display","block");
				$("#product").css("width","85%");
			});
		});
		//cart테이블에 상춤추가
		function cart_add2(pcode){
			var chk=new XMLHttpRequest();
			chk.onload=function(){
				if(chk.responseText=="2"){
					location="../member/login?chk=9";
				}
				else if(chk.responseText=="1"){
					alert("이미 담긴 상품입니다");
				}
				else{
					alert("해당 상품을 장바구니에 담았습니다");
					location.reload();
				}
			}
			chk.open("get", "cart_add2?pCode="+pcode);
			chk.send();
		}
		//wish테이블에 상품추가
		function wish_add2(pcode){
			var chk=new XMLHttpRequest();
			chk.onload=function(){
				if(chk.responseText=="2"){
					location="../member/login?chk=9";
				}
				else{
					location.reload();
				}
			}
			chk.open("get", "wish_add2?pCode="+pcode);
			chk.send();
		}
		//검색창 입력 값 초기화
		function page_reset(){
			document.sform.keyword.value="";
			document.pform.sprice.value="";
			document.pform.eprice.value="";
		}
		//가격검색 입력창에 숫자만 기입가능
		function check(my){
	    my.value=my.value.replace(/[^0-9]/g,"");
		}
		//가격검색 시 우측이 더 큰 값일 때 검색가능
		function price_check(){
			var sprice=document.sform.sprice.value;
			var eprice=document.sform.eprice.value;
			if(sprice>eprice){
				alert("가격을 다시 입력해주세요");
				return false;
			}
			else
				return true;
		}
		function submit_btn(){
			if(price_check())
			document.sform.submit();
		}
	</script>
</head>
<body>
	<section>
		<div id="menu_icon2"><span class="material-symbols-rounded" id="menu_view_btn">chevron_right</span></div>
		<div id="sidemenu">
			<div id="up">SHOP<span class="material-symbols-rounded" id="menu_icon">menu_open</span></div>
			<ul>
				<li onclick="location='../product/dc_list'"><div class="text">SALE</div></li>
				<li onclick="location='../product/display_list?pShow=1&pCode=p'"><div class="text">신상품</div></li>
				<li onclick="location='../product/list?pCode=p'"><div class="text">전체상품</div></li>
				<li class="main">
					<div>
						<div class="text">아우터</div>
						<span class="material-symbols-rounded view_icon">expand_more</span>
						<span class="material-symbols-rounded hide_icon">expand_less</span>
					</div>
					<ul class="sub">
						<li onclick="location='../product/list?pCode=p__03'">ALL</li>
						<li onclick="location='../product/list?pCode=p__0301'">윈드자켓</li>
						<li onclick="location='../product/list?pCode=p__0302'">플리스</li>
						<li onclick="location='../product/list?pCode=p__0303'">라이트아우터</li>
						<li onclick="location='../product/list?pCode=p__0304'">헤비아우터</li>
						<li onclick="location='../product/list?pCode=p__0305'">etc</li>
					</ul>
				</li>
				<li class="main">
					<div>
						<div class="text">상의</div>
						<span class="material-symbols-rounded view_icon">expand_more</span>
						<span class="material-symbols-rounded hide_icon">expand_less</span>
					</div>
					<ul class="sub">
						<li onclick="location='../product/list?pCode=p__01'">ALL</li>
						<li onclick="location='../product/list?pCode=p__0101'">니트/카디건</li>
						<li onclick="location='../product/list?pCode=p__0102'">맨투맨/후드</li>
						<li onclick="location='../product/list?pCode=p__0103'">긴팔티셔츠</li>
						<li onclick="location='../product/list?pCode=p__0104'">반팔티셔츠</li>
						<li onclick="location='../product/list?pCode=p__0105'">민소매티셔츠</li>
						<li onclick="location='../product/list?pCode=p__0106'">etc</li>
					</ul>
				</li>
				<li class="main">
					<div>
						<div class="text">하의</div>
						<span class="material-symbols-rounded view_icon">expand_more</span>
						<span class="material-symbols-rounded hide_icon">expand_less</span>
					</div>
					<ul class="sub">
						<li onclick="location='../product/list?pCode=p__02'">ALL</li>
						<li onclick="location='../product/list?pCode=p__0201'">숏팬츠</li>
						<li onclick="location='../product/list?pCode=p__0202'">롱팬츠</li>
						<li onclick="location='../product/list?pCode=p__0203'">스커트</li>
					</ul>
				</li>
				<li>
					<div onclick="location='../product/list?pCode=p__04'" class="text">셋업</div>
				</li>
				<li class="main">
					<div>
						<div class="text">가방</div>
						<span class="material-symbols-rounded view_icon">expand_more</span>
						<span class="material-symbols-rounded hide_icon">expand_less</span>
					</div>
					<ul class="sub">
						<li onclick="location='../product/list?pCode=p__05'">ALL</li>
						<li onclick="location='../product/list?pCode=p__0501'">백팩</li>
						<li onclick="location='../product/list?pCode=p__0502'">크로스백</li>
						<li onclick="location='../product/list?pCode=p__0503'">토트백</li>
						<li onclick="location='../product/list?pCode=p__0504'">스쿨백</li>
					</ul>
				</li>
				<li class="main">
					<div>
						<div class="text">모자</div>
						<span class="material-symbols-rounded view_icon">expand_more</span>
						<span class="material-symbols-rounded hide_icon">expand_less</span>
					</div>
					<ul class="sub">
						<li onclick="location='../product/list?pCode=p__06'">ALL</li>
						<li onclick="location='../product/list?pCode=p__0601'">볼캡</li>
						<li onclick="location='../product/list?pCode=p__0602'">캠프캡</li>
						<li onclick="location='../product/list?pCode=p__0603'">버킷햇</li>
						<li onclick="location='../product/list?pCode=p__0604'">비니</li>
					</ul>
				</li>
				<li onclick="location='../product/list?pCode=p__07'"><div class="text">신발</div></li>
				<li class="main">
					<div>
						<div class="text">악세서리</div>
						<span class="material-symbols-rounded view_icon">expand_more</span>
						<span class="material-symbols-rounded hide_icon">expand_less</span>
					</div>
					<ul class="sub">
						<li onclick="location='../product/list?pCode=p__08'">ALL</li>
						<li onclick="location='../product/list?pCode=p__0801'">양말</li>
						<li onclick="location='../product/list?pCode=p__0802'">etc</li>
					</ul>
				</li>
				<li class="main">
					<div>
						<div class="text">키즈</div>
						<span class="material-symbols-rounded view_icon">expand_more</span>
						<span class="material-symbols-rounded hide_icon">expand_less</span>
					</div>
					<ul class="sub">
						<li onclick="location='../product/list?pCode=p04'">ALL</li>
						<li onclick="location='../product/list?pCode=p0403'">아우터</li>
						<li onclick="location='../product/list?pCode=p0401'">상의</li>
						<li onclick="location='../product/list?pCode=p0402'">하의</li>
						<li onclick="location='../product/list?pCode=p0404'">셋업</li>
						<li onclick="location='../product/list?pCode=p0405'">스쿨백</li>
					</ul>
				</li>
			</ul>
			<form name="sform" method="post" action="product_search" onsubmit="return price_check()">
				<div id="namesearch">
					<div class="stitle">검색</div>
					<div id="searchbox">
						<input type="text" name="keyword" id="keyword" value="${keyword}">
						<input type="button" value="검색" id="ssubmit" onclick="submit_btn()">
					</div>
				</div>
				<div id="pricesearch">
					<div class="stitle">가격</div>
					<div id="pricebox">
						<input type="text" name="sprice" id="sprice" value="${sprice}" onkeyup="check(this)">
						&nbsp;-&nbsp;
						<input type="text" name="eprice" id="eprice" value="${eprice}" onkeyup="check(this)">
						<input type="submit" value="적용" id="price_btn">
					</div>
				</div>
				<div class="ctitle">색상<input type="button" value="초기화" id="reset_btn" onclick="page_reset()"></div>
			</form>
			<div id="colorsearch">
				<div class="color" id="red" onclick="location='product_search?color=red&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="burgundy" onclick="location='product_search?color=burgundy&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="pink" onclick="location='product_search?color=pink&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="orange" onclick="location='product_search?color=orange&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="yellow" onclick="location='product_search?color=yellow&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="ivory" onclick="location='product_search?color=ivory&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="beige" onclick="location='product_search?color=beige&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="oatmeal" onclick="location='product_search?color=oatmeal&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="mustard" onclick="location='product_search?color=mustard&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="melange" onclick="location='product_search?color=melange&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="white" onclick="location='product_search?color=white&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="green" onclick="location='product_search?color=green&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="khaki" onclick="location='product_search?color=khaki&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="olive" onclick="location='product_search?color=olive&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="blue" onclick="location='product_search?color=blue&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="navy" onclick="location='product_search?color=navy&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="lilac" onclick="location='product_search?color=lilac&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="purple" onclick="location='product_search?color=purple&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="violet" onclick="location='product_search?color=violet&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="black" onclick="location='product_search?color=black&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="grey" onclick="location='product_search?color=grey&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="charcoal" onclick="location='product_search?color=charcoal&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="brown" onclick="location='product_search?color=brown&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
				<div class="color" id="denim" onclick="location='product_search?color=denim&keyword=${keyword}&sprice=${sprice}&eprice=${eprice}'"></div>
			</div>
		</div>

		<div id="product">
			<div id="product_title">
				<c:if test="${pCode=='p'}">전체상품</c:if>
				<c:if test="${pCode=='p__01'}">상의</c:if>
				<c:if test="${pCode=='p__0101'}">상의-니트/카디건</c:if>
				<c:if test="${pCode=='p__0102'}">상의-맨투맨/후드</c:if>
				<c:if test="${pCode=='p__0103'}">상의-긴팔티셔츠</c:if>
				<c:if test="${pCode=='p__0104'}">상의-반팔티셔츠</c:if>
				<c:if test="${pCode=='p__0105'}">상의-민소매티셔츠</c:if>
				<c:if test="${pCode=='p__0106'}">상의-etc</c:if>
				<c:if test="${pCode=='p__02'}">하의</c:if>
				<c:if test="${pCode=='p__0201'}">하의-숏팬츠</c:if>
				<c:if test="${pCode=='p__0202'}">하의-롱팬츠</c:if>
				<c:if test="${pCode=='p__0203'}">하의-스커트</c:if>
				<c:if test="${pCode=='p__03'}">아우터</c:if>
				<c:if test="${pCode=='p__0301'}">아우터-윈드자켓</c:if>
				<c:if test="${pCode=='p__0302'}">아우터-플리스</c:if>
				<c:if test="${pCode=='p__0303'}">아우터-라이트아우터</c:if>
				<c:if test="${pCode=='p__0304'}">아우터-헤비아우터</c:if>
				<c:if test="${pCode=='p__0305'}">아우터-etc</c:if>
				<c:if test="${pCode=='p__04'}">셋업</c:if>
				<c:if test="${pCode=='p__05'}">가방</c:if>
				<c:if test="${pCode=='p__0501'}">가방-백팩</c:if>
				<c:if test="${pCode=='p__0502'}">가방-크로스백</c:if>
				<c:if test="${pCode=='p__0503'}">가방-토트백</c:if>
				<c:if test="${pCode=='p__0504'}">가방-스쿨백</c:if>
				<c:if test="${pCode=='p__06'}">모자</c:if>
				<c:if test="${pCode=='p__0601'}">모자-볼캡</c:if>
				<c:if test="${pCode=='p__0602'}">모자-캠프캡</c:if>
				<c:if test="${pCode=='p__0603'}">모자-버킷햇</c:if>
				<c:if test="${pCode=='p__0604'}">모자-비니</c:if>
				<c:if test="${pCode=='p__07'}">신발</c:if>
				<c:if test="${pCode=='p__08'}">악세서리</c:if>
				<c:if test="${pCode=='p__0801'}">악세서리-양말</c:if>
				<c:if test="${pCode=='p__0802'}">악세서리-etc</c:if>
			</div>
			<table id="list_table">
				<tr>
					<td style="height:0px"></td>
					<td style="height:0px"></td>
					<td style="height:0px"></td>
					<td style="height:0px"></td>
				</tr>
				<tr>
				<c:forEach items="${list}" var="pvo" varStatus="sts">
					<td>
						<div class="img_box">
			        <div onclick="location='../product/content?pCode=${pvo.pCode}'">
			        	<img src="../resources/pro/${pvo.pImg1}" class="product_img1" />
			        	<img src="../resources/pro/${pvo.pImg2}" class="product_img2" />
			        </div>
			        <div class="pname"><span>${pvo.pName}</span></div>
			      </div>
			      <div class="etc_box">
		      	<c:if test="${pvo.pPrice!=pvo.pPrice-pvo.pPrice*pvo.pDc/100}">
				      <div class="dc"><s><fmt:formatNumber value="${pvo.pPrice}" pattern="#,###"/></s></div>
		      	</c:if>
				      <div class="price"><fmt:formatNumber value="${pvo.pPrice-pvo.pPrice*pvo.pDc/100}" pattern="#,###"/>원</div>
				      <div class="wish_cart_box">
				      	<c:choose>
					      	<c:when test="${fn:contains(wchk, pvo.pCode)}">
				          	<img src="../resources/pro/wish2.png" class="wish_img" onclick="wish_add2('${pvo.pCode}')"/>
					      	</c:when>
					      	<c:otherwise>
				          	<img src="../resources/pro/wish1.png" class="wish_img" onclick="wish_add2('${pvo.pCode}')"/>
					      	</c:otherwise>
				      	</c:choose>
				      	<c:choose>
					      	<c:when test="${fn:contains(cchk, pvo.pCode)}">
				          	<img src="../resources/pro/cart2.png" class="cart_img" onclick="cart_add2('${pvo.pCode}')"/>
					      	</c:when>
					      	<c:otherwise>
				          	<img src="../resources/pro/cart1.png" class="cart_img" onclick="cart_add2('${pvo.pCode}')"/>
					      	</c:otherwise>
				      	</c:choose>
			        </div>
			      </div>
					</td>
					<c:if test="${sts.count%4==0}">
					</tr>
					</c:if>
				</c:forEach>
				</tr>
			</table>

			<div id="paging">
				<c:if test="${pstart==1}">
					<a>
						<span class="material-symbols-rounded">arrow_back</span>
					</a>
				</c:if>
				<c:if test="${pstart!=1}">
					<a href="list?page=${pstart-1}&rnum=${rnum}&pCode=${pCode}">
						<span class="material-symbols-rounded">arrow_back</span>
					</a>
				</c:if>
				<c:forEach begin="${pstart}" end="${pend}" var="i">
					<c:if test="${page==i}">
						<a href="list?page=${i}&rnum=${rnum}&pCode=${pCode}" style="color:#000000;">${i}</a>
					</c:if>
					<c:if test="${page!=i}">
						<a href="list?page=${i}&rnum=${rnum}&pCode=${pCode}" style="color:#CCCCCC;">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pend!=total}">
					<a href="list?page=${pend+1}&rnum=${rnum}&pCode=${pCode}">
						<span class="material-symbols-rounded">arrow_forward</span>
					</a>
				</c:if>
				<c:if test="${pend==total}">
					<a>
						<span class="material-symbols-rounded">arrow_forward</span>
					</a>
				</c:if>
			</div>
		</div>
	</section>
</body>
</html>
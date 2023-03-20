<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/main/main.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<script src="../resources/js/main/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<script>
	$(function(){
		$(window).scroll(function(){
			  var st=$(window).scrollTop();
			  if(st>=300){
				  $("#fixed_btn").css("visibility","visible");
			  }
			  else{
				  $("#fixed_btn").css("visibility","hidden");
			  }
		});
		$("#fixed_btn > span").click(function(){
			  $(window).scrollTop("0");
		});
	});
</script>
<decorator:head/>
</head>
	<body>
	<div id="fixed_btn">
		<span class="material-symbols-rounded" id="top_btn">vertical_align_top</span>
		<span class="material-symbols-rounded" id="recent" onclick="location='../product/view_recent'">laundry</span>
		<a><img src="../resources/pro/counsel.png" width="50" height="50" id="popup"></a>
	</div>
	<style>
		#counsel_form {
			width:370px;
			height:306px;
			background:#F6F6F6;
			position:fixed;
			right:20px;
			bottom:20px;
			border-radius:30px;
			z-index:112;
			display:none;
		}
		#counsel_form #caption {
			font-size:23px;
			font-weight:600;
			margin:15px 30px 15px;
			display:flex;
			justify-content:space-between; 
			line-height:35px;
			border-bottom:2px solid black;
		}
		#counsel_form #counsel_inputbox {
			height:160px;
			padding:10px 0 20px;
			text-align:center;
		}
		#counsel_form #counsel_input {
			width:320px;
			height:160px;
			margin:auto;
			padding:10px;
			border-radius:15px;
			box-sizing:border-box;
			background-color:white;
			box-shadow:2px 2px 3px 2px lightgrey;
		}
		#counsel_form #content {
			outline:none;
			border:none;
			width:300px;
			height:110px;
			resize:none;
			font-size:15px;
		}
		#counsel_form #counsel_submit {
			margin-top:15px;
			width:80px;
			height:36px;
			border:1px solid lightgrey;
			border-radius:5px;
			cursor:pointer;
		}
	</style>
	<script>
		$(function(){
			$("#counsel_form #close").click(function(){
				$("#counsel_form").css("display","none");
			});
			$("#fixed_btn #popup").click(function(){
				$("#counsel_form").css("display","block");
			});
		});
		function counsel_input(){
			var chk=new XMLHttpRequest();
			var content=document.getElementById("content").value;
			chk.onload=function(){
				if(chk.responseText=="0")
					alert("로그인 후 이용해주세요");
				else
					location.reload();
			}
			chk.open("get", "../mypage/counsel_input?content="+content);
			chk.send();
		}
	</script>
	<div id="counsel_form">
		<div id="caption">
			<div>1:1 문의하기</div>
			<div><span class="material-symbols-rounded" id="close">close</span></div>
		</div>
		<div id="counsel_inputbox">
			<div id="counsel_input">
				<textarea id="content"></textarea>
			</div>
			<input type="button" id="counsel_submit" onclick="counsel_input()" value="문의하기">
		</div>
	</div>

  <div id="section">
    <div id="first">
      <div id="up">
        <div id="left"></div>
        <div id="center">
          <a href="../main/main"><img src="../resources/pro/symbol.jpg" id="logo_icon" /></a>
        </div>
        <div id="right">
        <c:if test="${userid==null}">
          <a href="../member/login">
            <span class="material-symbols-rounded" id="user_icon">person</span>
          </a>
        </c:if>
        <c:if test="${userid!=null}">
          <a href="../member/member_view">
            <span class="material-symbols-rounded" id="member_icon">person</span>
          </a>
          <a href="../member/logout">
          	<span class="material-symbols-rounded" id="logout_icon">logout</span>
          </a>
        </c:if>
          <a href="../wish/wish_view">
            <span class="material-symbols-rounded" id="wish_icon">favorite</span>
          </a>
          <a href="../product/cart">
          	<span class="material-symbols-rounded" id="cart_icon">shopping_bag</span>
          </a>
        </div>
      </div>
      <div id="down">
        <ul>
          <li>
            <a href="../product/display_list?pShow=1&pCode=p">NEW RELEASES</a>
            <ul class="menu">
              <li>
                <a href="../product/display_list?pShow=1&pCode=p">New & Featured</a>
              </li>
              <li>
                <a href="../product/display_list?pShow=1&pCode=p02">남성 신상품</a>
              </li>
              <li>
                <a href="../product/display_list?pShow=1&pCode=p03">여성 신상품</a>
              </li>
              <li>
                <a href="../product/display_list?pShow=1&pCode=p04">키즈 신상품</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="../product/display_list?pShow=2&pCode=p">BEST</a>
            <ul class="menu">
              <li>
                <a href="../product/display_list?pShow=2&pCode=p">전체</a>
              </li>
              <li>
                <a href="../product/display_list?pShow=2&pCode=p02">남성 베스트</a>
              </li>
              <li>
                <a href="../product/display_list?pShow=2&pCode=p03">여성 베스트</a>
              </li>
              <li>
                <a href="../product/display_list?pShow=2&pCode=p04">키즈 베스트</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="../product/list?pCode=p">SHOP</a>
            <ul class="menu">
              <li><a href="../product/list?pCode=p">전체</a></li>
              <li><a href="../product/list?pCode=p__01">상의</a></li>
              <li><a href="../product/list?pCode=p__02">하의</a></li>
              <li><a href="../product/list?pCode=p__03">아우터</a></li>
              <li><a href="../product/list?pCode=p__04">셋업</a></li>
              <li><a href="../product/list?pCode=p__05">가방</a></li>
              <li><a href="../product/list?pCode=p__06">모자</a></li>
              <li><a href="../product/list?pCode=p__07">신발</a></li>
              <li><a href="../product/list?pCode=p__08">악세서리</a></li>
            </ul>
          </li>
          <li>
            <a href="../product/dc_list">SEASON</a>
            <ul class="menu">
              <li><a href="../product/dc_list">SALE</a></li>
              <li><a href="#">LOOKBOOK</a></li>
              <li><a href="#">새학기 컬렉션</a></li>
              <li><a href="#">생활용품</a></li>
            </ul>
          </li>
          <li>
            <a href="#">MD COLLECTION</a>
          </li>
        </ul>
      </div>
    </div>

<decorator:body/>

    <div id="eightth">
      <table width="1200" align="center">
        <tr>
          <td width="540">
            <img src="../resources/pro/hilight.png" width="160" height="24"/><p>
            <div style="font-weight:900">주식회사 사누스</div><p>
         	  <div>Co-Owner. HYEONG GYU KIM, SEUNG GEON KIM, HEE JU GO</div>
            <div>Business License No. 544-67-01119 [사업자정보확인]</div>
            <div>Mail Order Business Registration. No. 2023-일산마두B-5432</div>
            <div>Address. 1104 PDC Building Woo-Jung 3F, 474, Goyangdae-ro, Ilsan-gu, Goyang-si, Gyeonggi, Korea</div><p>
            <div>Hilight Brands is a division within Modern Works.</div>
            <div>The Sanus trademark, logo and trade dress are</div>
            <div>used by Modern Works under license from westman Sanus Company.</div><p>
            <div>ⓒ 2023 Hilight Brands.</div>
          </td>
          <td width="130">
            <div>Term of Use</div>
            <div>Privacy Policy</div>
            <div>Order Tracking</div>
            <div>Notice</div>
            <div>Q&A</div>
            <p>
            <div>
            	<img src="../resources/pro/kakao.png" width="30" height="30">
            	<img src="../resources/pro/facebook.png" width="30" height="30">
            	<img src="../resources/pro/insta.png" width="30" height="30">
            </div>
          </td>
          <td width="230">
            <div>CS Center</div>
            <div>Mon - Fri (10:00 - 16:00)</div>
            <div>support@sanus.co.kr</div>
            <div>마케팅제휴 : marketing@sanus.co.kr</div>
          </td>
          <td width="300">
            <div>반품 & 교환</div>
            <div>반품배송지 : 경기 고양시 일산동구 중앙로 1193 마두법조빌딩 9층</div><p>
            <div>계좌 안내</div>
            <div>계좌번호 : 하나은행 168-910228-91007</div>
            <div>예금주 : 주식회사 사너스</div><p>
            <div>매장 안내</div>
            <div>전국 매장정보</div>
            <div>대리점 입점 문의 : welcome@sanus.co.kr (011-919-5778)</div>
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>
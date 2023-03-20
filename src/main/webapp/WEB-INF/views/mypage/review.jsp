<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
   #sections {
   		width:100%;
   		min-height:700px;
   		display:flex;
   		justify-content:flex-start;
   		flex-direction:row;
   }
   #section1 {
   		width:250px;
   		min-height:700px;
   		font-size:14px;
   		border-collapse:collapse;
   }
   #section1 div {
   		text-indent:15px;
   		line-height:30px;
   		box-sizing:border-box;
   }
   #section1 #member {
   		text-indent:10px;
   		height:40px;
   		line-height:40px;
   		font-size:20px;
   		font-weight:900;
   		margin-bottom:50px;
   		border-bottom:1px solid black;
   		cursor:pointer;
   }
   #section1 #product {
   		height:90px;
   		margin-bottom:50px;
   		border-top:1px solid black;
   }
   #section1 #product > div {
   		border-bottom:1px solid black;
   		cursor:pointer;
   }
   #section1 #info {
   		border-top:1px solid black;
   		height:120px;
   		margin-bottom:50px;
   }
   #section1 #info > div {
   		border-bottom:1px solid black;
   		cursor:pointer;
   }
   #section1 #written {
   		border-top:1px solid black;
   		height:60px;
   		margin-bottom:150px;
   }
   #section1 #written > div {
   		border-bottom:1px solid black;
   		cursor:pointer;
   }
   #section1 #account {
   		border-top:1px solid black;
   		border-bottom:1px solid black;
   		height:30px;
   		font-weight:900px;
   		cursor:pointer;
   }
   #section2 {
      width:1000px;
      min-height:700px;
      padding:80px 0 0 400px;
      border-left:1px solid black;
   }
		section {
			width:500px;
			min-height:600px;
			margin:auto;
		}
		section #review {
			width:450px;
			margin:auto;
			box-sizing:border-box;
			border-collapse:collapse;
			border-radius:3px;
			font-size:14px;
			box-sizing:border-box;
		}
		section #review td {
			border-top:1px solid lightgrey;
			border-bottom:1px solid lightgrey;
		}
		section #review td:first-child {
			text-align:right;
			border-right:1px solid lightgrey;
			padding-right:10px;
		}
		section #review tr:first-child td {
			border-right:none;
		}
		section #review #pimg {
			width:100px;
			height:100px;
		}
		section #review #pname {
			width:450px;
			border-right:none;
			display:flex;
			justify-content:space-evenly;
			align-items:center;
		}
		section #review #simg {
			height:50px;
		}
		section #review #simg div {
			display:flex;
			align-items:center;
			padding-left:5px;
		}
		section #review #simg img {
			width:20px;
			height:20px;
			cursor:pointer;
		}
		section #review #hugi {
			vertical-align:top;
			padding-top:3px;
		}
		section #review #content {
			height:150px;
		}
		section #review #content textarea{
			width:390px;
			height:150px;
			resize:none;
			outline:none;
			border:none;
			padding:5px;
		}
		section #sub_btn {
			width:300px;
			margin:auto;
			margin-top:10px;
			text-align:center;
		}
		section #sub_btn input {
			width:100px;
			height:33px;
			border:1px solid grey;
			border-radius:2px;
			font-size:15px;
			font-weight:600;
			background:white;
			cursor:pointer;
		}
		section #ps {
			font-size:12px;
			text-align:right;
			margin-right:20px;
		}
		section #ps2 {
			font-size:12px;
			text-align:right;
			margin-right:20px;
			margin-bottom:30px;
		}
		section #ibox {
			background:white;
			border:1px solid grey;
			color:grey;
			width:35px;
			height:35px;
			display:flex;
			justify-content:center;
			align-items:center;
			font-size:20px;
			opacity:0.5;
			cursor:pointer;
		}
		section #image {
			display:none;
		}
		section #msg {
			padding-left:10px;
		}
		section #imsg {
			width:370px;
			word-break:break-all;
		}
	</style>
	<script>
		var star=0;
		function click_star(n){
			var simg=document.getElementsByClassName("simg");
			for(i=0;i<=n;i++){
				simg[i].src="../resources/pro/star2.png";
			}
			for(i=n+1;i<=4;i++){
				simg[i].src="../resources/pro/star1.png";
			}
			star=n+1;
			var msg="";
			switch(star){
				case 1: msg="매우 나쁨"; break;
				case 2: msg="나쁨"; break;
				case 3: msg="보통"; break;
				case 4: msg="좋음"; break;
				case 5: msg="아주 좋음"; break;
			}
			document.getElementById("msg").innerText=msg;
			document.rform.star.value=star;
		}
		function check(){
			if(document.getElementById("msg").innerText.length==0){
				alert("별점 선택은 필수입니다");
				return false;
			}
			if(document.rform.content.value.length==0){
				alert("후기를 입력해주세요");
				return false;
			}
			else
				return true;
		}
		function itext(){
			var files=document.getElementById("image").files;
			var len=files.length;
			var file=[];
			for(i=0;i<len;i++){
				file.push([files[i].name]);
			}
			document.getElementById("imsg").innerText=file;
			document.rform.images.value=file;
		}
	</script>
</head>
<body>
	<div id="sections">
		<div id="section1">
			<div id="member" onclick="location='../member/member_view'">마이페이지</div>
			<div id="product">
				<div onclick="location='../product/view_recent'">최근 본 상품</div>
				<div onclick="location='../wish/wish_view'">찜한 상품</div>
				<div onclick="location='../product/cart'">장바구니</div>
			</div>
			<div id="info">
				<div onclick="location='../mypage/order_history'">주문/결제내역</div>
				<div onclick="location='../member/juso_list'">배송지정보</div>
				<div onclick="location='../member/member_edit'">회원정보</div>
				<div onclick="location='../member/pwd_edit'">비밀번호변경</div>
			</div>
			<div id="written">
				<div onclick="location='../mypage/review_history'">작성한 후기</div>
				<div onclick="location='../mypage/qna_history'">1:1문의내역</div>
			</div>
			
	  	<div id="account" onclick="location='../member/member_delete'">회원탈퇴</div>
		</div>

		<div id="section2">
			<section>
				<form name="rform" id="rform" method="post" action="review_ok" enctype="multipart/form-data" onsubmit="return check()">
					<input type="hidden" name="star">
					<input type="hidden" name="index" value="${index}">
					<input type="hidden" name="orderId" value="${orderId}">
					<input type="hidden" name="pCode" value="${pvo.pCode}">
					<input type="hidden" name="images">
					<div><h3>구매후기</h3></div>
					<div id="ps">*는 필수항목입니다.</div>
					<table id="review">
						<tr>
							<td colspan="2">
								<div id="pname">
									<img src="../resources/pro/${pvo.pImg1}" id="pimg"> <div>${pvo.pName} <br> option-${pvo.pSize}</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>별 점*</td>
							<td id="simg">
								<div>
									<img src="../resources/pro/star1.png" class="simg" onclick="click_star(0)">
									<img src="../resources/pro/star1.png" class="simg" onclick="click_star(1)">
									<img src="../resources/pro/star1.png" class="simg" onclick="click_star(2)">
									<img src="../resources/pro/star1.png" class="simg" onclick="click_star(3)">
									<img src="../resources/pro/star1.png" class="simg" onclick="click_star(4)">
									<span id="msg"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td id="hugi">후 기*</td>
							<td id="content"><textarea name="content"></textarea></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
								<label for="image" id="ibox">+</label><div id="imsg"></div>
								<input type="file" id="image" name="image" multiple onchange="itext()">
							</td>
						</tr>
					</table>
					<div id="ps2">한 번에 업로드할 수 있는 파일용량은 최대 10MB입니다.</div>
					<div id="sub_btn"><input type="submit" value="작성하기"></div>
				</form>
			</section>
		</div>
	</div>
</body>
</html>
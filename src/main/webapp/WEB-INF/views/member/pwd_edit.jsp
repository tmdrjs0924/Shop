<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      text-align:center;
      padding:50px 0 0 200px;
      border-left:1px solid black;
   }
   section {
      width:1000px;
      text-align:center;
      padding-top:50px;
   }
   section div {
     margin-top:12px;
     margin-left:120px;
   }
   section input[type=password],section input[type=text] {
      width:400px;
      height:48px;
      border-radius:1em;
      border:1px solid #757575;
      margin-left:-130px;
      font-size:15px;
      text-indent: 10px;
   }
   section #subbtn {
      width:190px;
      height:50px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-left:-130px;
      margin-top:30px;
      margin-bottom:100px;
      font-size:15px;
   }
   section #subbtn:hover {
      width:190px;
      height:50px;
      background:#757575;
      border:1px solid #757575; 
      border-radius:3em;
      color:white;
      margin-left:-130px;
      margin-top:30px;
      margin-bottom:100px;
      font-size:15px;
      cursor:pointer;
   }
   section #msg {
      color:red;
      margin-left:10px;
   }
 </style>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" >
 <script>
     $(document).ready(function(){
		 $('#mem').on('submit',function(){
			 var $thisForm=$(this);
			 var npwd=$thisForm.find('input[name=npwd]').val();
			 var npwd2=$thisForm.find('input[name=npwd2]').val();
			 
			 if(npwd !== npwd2) {
				 alert("신규 비밀번호와 신규 비밀번호확인이 일치하지 않습니다");
				 return false;
			 }
		 });
	 });
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
      <form id="mem" method="post" action="pwd_edit_ok">
        <h2> 비밀번호 변경 </h2>
        <div> <input type="password" name="npwd" placeholder="신규 비밀번호" required/> </div>
        <div> <input type="password" name="npwd2" placeholder="신규 비밀번호 확인" required/> </div>
        <div> <input type="submit" value="비밀번호 변경" id="subbtn"> </div>
      </form>
    </section>
		</div>
	</div>
</body>
</html>

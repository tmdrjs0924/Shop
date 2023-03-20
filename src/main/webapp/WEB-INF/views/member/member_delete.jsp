<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
   }
   section table {
     margin:50px 0 50px 200px;
     border-spacing:0px;
   }
   section td {
      font-size:15px;
      height:40px;
      border-bottom:2px solid #eeeeee;
   }
   section table tr:last-child td {
      border-bottom:none;
   }
   section #edit {
      display:inline-block;
      width:200px;
      height:30px;
      font-size:14px;
      margin-top:40px;
      border:1px solid #747474;
      background:#747474;
      color:white;
      padding:4px;
   }
   section #edit:hover {
      display:inline-block;
      width:200px;
      height:30px;
      font-size:14px;
      margin-top:40px;
      border:1px solid black;
      background:black;
      color:white;
      padding:4px;
      cursor:pointer;
   }
 </style>
 <script>
   function removeMember() {
	   if(confirm("탈퇴 신청하시겠습니까?"))
		   return true;
	   else
		   return false;
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
      <form name="mem" method="post" action="memberDelete" onsubmit="return removeMember()">
        <table width="500">
        <h1> 회 원 탈 퇴 </h1>
        <tr>
          <td> 이 름 </td>
          <td> ${mvo.name} </td>
        </tr>
        <tr>
          <td> 아이디 </td>
          <td> ${mvo.userid} </td>
        </tr>
        <tr>
          <td> 주 소 </td>
          <td> ${mvo.juso} ${mvo.juso_etc} </td>
        </tr>
        <tr>
          <td> 휴대폰번호 </td>
          <td> ${mvo.phone} </td>
        </tr>
        <tr>
          <td> 이메일 </td>
          <td> ${mvo.email} </td>
        </tr>
        <tr>
          <td> 포인트 </td>
          <td> <fmt:formatNumber value="${mvo.point}" type="number"/>원 </td>
        </tr>
        <tr>
          <td> 가입일 </td>
          <td> ${mvo.writeday} </td>
        </tr>
        </table>
        <c:if test="${mvo.state==0}">
    	    <input type="submit" id="edit" value="확 인">
			  </c:if>
				<c:if test="${mvo.state==1}">
					<input id="edit" type="button" value="탈퇴신청취소" onclick="location='../member/mem_state_update'">
		 	 	</c:if>
      </form>
   </section>
		</div>
	</div>

</body>
</html>











<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
      width:100%;
      min-height:700px;
      display:flex;
      padding:20px 0;
      flex-direction:column;
      border-left:1px solid black;
      border-right:1px solid black;
   }
   #section2 a {
 	 		color:#A84448;
 	 		text-decoration:underline;
 	 }
   #section2 #productInfo,
   #section2 #memberInfo,
   #section2 #writtenInfo {
   		display:flex;
   		flex-direction:column;
   		justify-content:center;
   		align-items:center; 
   		width:60%;
   		margin:30px 0 30px 210px;
   		padding:12px 30px;
   		box-shadow:2px 2px 5px 2px lightgrey;
   		border-radius:10px;
   }
   #section2 #ptitle,
   #section2 #mtitle,
   #section2 #wtitle {
   		width:100%;
   		font-size:20px;
   		font-weight:900;
   		border-bottom:1px solid black;
   		text-align:right;
   }
   #section2 #ptabs,
   #section2 #mtabs,
   #section2 #wtabs {
   		width:100%;
   }
   #section2 #ptabs div,
   #section2 #mtabs div,
   #section2 #wtabs div {
   		display:flex;
   		justify-content:space-between;
   		font-size:15px;
   		font-weight:900;
   		padding:3px 0;
   }
 </style>
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

		<c:if test="${mvo.rank==0}"><c:set value="일반" var="rank"/></c:if>
		<c:if test="${mvo.rank==1}"><c:set value="실버" var="rank"/></c:if>
		<c:if test="${mvo.rank==2}"><c:set value="골드" var="rank"/></c:if>
		<c:if test="${mvo.rank==3}"><c:set value="다이아" var="rank"/></c:if>
		<div id="section2">
			<div id="memberInfo">
				<div id="mtitle">프로필</div>
				<div id="mtabs">
					<div>
						<div></div>
						<div>회원등급(${rank})</div>
					</div>
					<div>
						<div></div>
						<div>${mvo.name}</div>
					</div>
					<div>
						<div></div>
						<div>${fn:substring(mvo.phone,0,2)}*-${fn:substring(mvo.phone,3,5)}**-${fn:substring(mvo.phone,7,9)}**</div>
					</div>
					<div>
						<div></div>
						<div>${mvo.email}</div>
					</div>
					<div>
						<div>가입일</div>
						<div>${mvo.writeday}</div>
					</div>
				</div>
			</div>
			<div id="productInfo">
				<div id="ptitle">주문/결제정보</div>
				<div id="ptabs">
					<div>
						<div>배송중</div>
						<div>${orderState2count} 건</div>
					</div>
					<div>
						<div>배송완료</div>
						<div>${orderState3count} 건</div>
					</div>
					<div>
						<div>구매</div>
						<div>${orderState10count} 건</div>
					</div>
					<div>
						<div>취소</div>
						<div>${orderState5count} 건</div>
					</div>
					<div>
						<div>반품</div>
						<div>${orderState7count} 건</div>
					</div>
					<div>
						<div>환불</div>
						<div>${orderState9count} 건</div>
					</div>
					<div>
						<div>잔여포인트</div>
						<div><fmt:formatNumber value="${mvo.point}" pattern="#,###"/>p</div>
					</div>
				</div>
			</div>
			<div id="writtenInfo">
				<div id="wtitle">내 활동</div>
				<div id="wtabs">
					<div>
						<div>후기작성</div>
						<div><a href="../mypage/review_history">${rcnt}</a> 건</div>
					</div>
					<div>
						<div>문의횟수</div>
						<div><a href="../mypage/qna_history">${qcnt}</a> 건</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
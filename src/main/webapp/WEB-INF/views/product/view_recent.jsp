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
	      text-align:center;
	      padding:50px 0 0 200px;
	      border-left:1px solid black;
	   }
		section {
			width:1000px;
			min-height:600px;
		}
		section #recent {
			width:800px;
			margin:auto;
			margin-bottom:100px;
		}
		section #recent tr {
			cursor:pointer;
		}
		section #recent tr {
			border-top:2px solid black;
			border-bottom:2px solid black;
		}
		section #recent .pimg {
			width:150px;
			height:150px;
			margin:auto;
		}
		section #recent .img {
			width:200px;
			text-align:center;
		}
		section #recent .name {
			width:430px;
			text-indent:20px;
		}
		section #recent .price {
			width:170px;
			text-align:center;
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

		<div id="section2">
			<section>
				<table id="recent">
					<caption><h2>최근 본 상품</h2></caption>
					<c:forEach items="${plist}" var="pvo">
						<c:if test="${!empty pvo}">
							<tr onclick="location='content?pCode=${pvo.pCode}'">
								<td class="img"><img src="../resources/pro/${pvo.pImg1}" class="pimg"></td>
								<td class="name">${pvo.pName}</td>
								<td class="price">
									<c:if test="${pvo.pPrice==pvo.pPrice-pvo.pPrice*pvo.pDc/100}">
									</c:if>
									<c:if test="${pvo.pPrice!=pvo.pPrice-pvo.pPrice*pvo.pDc/100}">
										<s><fmt:formatNumber value="${pvo.pPrice}" pattern="#,###"/></s><br>
									</c:if>
									<fmt:formatNumber value="${pvo.pPrice-pvo.pPrice*pvo.pDc/100}" pattern="#,###"/>원
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</section>
		</div>
	</div>
</body>
</html>
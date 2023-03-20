<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-latest.js"></script>
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
      padding-left:250px;
      border-left:1px solid black;
   }
		section {
			width:1000px;
			min-height:500px;
			margin:auto;
			margin-top:50px;
			margin-bottom:50px;
			padding:30px 0;
			border-radius:40px;
			background:white;
		}
		section caption {
			text-align:left;
		}
		section caption span {
			font-size:15px;
			line-height:15px;
		}
		section #history,
		section #address,
		section #orderPrice,
		section #pay {
			border-collapse:collapse;
			margin:auto;
			width:1000px;
			margin-bottom:50px;
		}
		section #history th,
		section #address th,
		section #orderPrice th,
		section #pay th {
			border-bottom:2px solid black;
		}
		section #history tr:last-child td,
		section #address tr:last-child td,
		section #orderPrice tr:last-child td,
		section #pay tr:last-child td {
			border-bottom:2px solid black;
		}
		section #address td,
		section #orderPrice td,
		section #pay td {
			border-bottom:1px solid lightgrey;
			font-size:14px;
			height:30px;
		}
		section #address tr td:first-child,
		section #orderPrice tr td:first-child,
		section #pay tr td:first-child {
			border-right:1px solid lightgrey;
			text-indent:3px;
			width:170px;
		}
		section #address tr td:last-child,
		section #orderPrice tr td:last-child,
		section #pay tr td:last-child {
			text-indent:3px;
		}
		section .title {
			height:33px;
			line-height:33px;
		}
		section .detail {
			padding-left:10px;
			color:#2ECC71;
			font-size:13px;
			cursor:pointer;
		}
		section .content{
			font-size:14px;
			border-bottom:1px solid lightgrey;
		}
		section .content .origin {
			font-size:13px;
			color:lightgrey;
		}
		section .content .left{
			width:150px;
			text-align:center;
		}
		section .content .center{
			text-indent:10px;
		}
		section .content .img {
			width:100px;
			height:100px;
		}
		section .content .right div {
			margin:auto;
			width:85px;
			text-align:center;
			padding:5px 7px;
			border:2px solid grey;
			border-radius:5px;
			background:white;
			font-size:13px;
			font-weight:900;
			cursor:pointer;
			opacity:0.8;
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
				<c:forEach items="${olist}" var="ovo">
					<table id="address">
						<c:if test="${ovo.orderState==0}"><c:set value="결제완료" var="state"/></c:if>
						<c:if test="${ovo.orderState==1}"><c:set value="상품준비중" var="state"/></c:if>
						<c:if test="${ovo.orderState==2}"><c:set value="배송중" var="state"/></c:if>
						<c:if test="${ovo.orderState==3}"><c:set value="배송완료" var="state"/></c:if>
						<c:if test="${ovo.orderState==4}"><c:set value="취소대기" var="state"/></c:if>
						<c:if test="${ovo.orderState==5}"><c:set value="취소완료" var="state"/></c:if>
						<c:if test="${ovo.orderState==6}"><c:set value="반품대기" var="state"/></c:if>
						<c:if test="${ovo.orderState==7}"><c:set value="반품완료" var="state"/></c:if>
						<c:if test="${ovo.orderState==8}"><c:set value="환불대기" var="state"/></c:if>
						<c:if test="${ovo.orderState==9}"><c:set value="환불완료" var="state"/></c:if>
						<c:if test="${ovo.orderState==10}"><c:set value="구매확정" var="state"/></c:if>
						<caption><h2>주문 상세정보 <span>(${ovo.orderNumber} - ${state})</span></h2></caption>
						<tr class="title">
							<th colspan="2">배송지 정보</th>
						</tr>
						<tr>
							<td>받는사람</td>
							<td>${ovo.orderName}</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>${ovo.orderPhone}</td>
						</tr>
						<tr>
							<td>받는주소</td>
							<td>${ovo.orderJuso}, ${ovo.orderJuso_etc}</td>
						</tr>
						<tr>
							<td>배송 시 요청사항</td>
							<td>
								<c:if test="${ovo.orderMessage==1}"><c:set value="직접 받고 부재시 문 앞" var="msg"/></c:if>
								<c:if test="${ovo.orderMessage==2}"><c:set value="경비실에 맡겨 주세요" var="msg"/></c:if>
								<c:if test="${ovo.orderMessage==3}"><c:set value="택배함에 맡겨 주세요" var="msg"/></c:if>
								<c:if test="${ovo.orderMessage==4}"><c:set value="${ovo.orderMessage2}" var="msg"/></c:if>
								${msg}
							</td>
						</tr>
					</table>
					
					<table id="history">
						<tr class="title">
							<th colspan="3">상품 정보</th>
						</tr>
						<c:forEach items="${ovo.plist}" var="pvo">
						<tr class="content">
							<td class="left"><img src="../resources/pro/${pvo.pImg1}" class="img"></td>
							<td class="center">
								<div>${pvo.pName}</div>
								<div class="origin">
									<c:if test="${pvo.pPrice==pvo.pPrice-pvo.pPrice*pvo.pDc/100}"></c:if>
									<c:if test="${pvo.pPrice!=pvo.pPrice-pvo.pPrice*pvo.pDc/100}">
										<s><fmt:formatNumber value="${pvo.pPrice}" pattern="#,###"/></s>
									</c:if>
								</div>
								<div><fmt:formatNumber value="${pvo.pPrice-pvo.pPrice*pvo.pDc/100}" pattern="#,###"/>원</div>
								<div>수량:${pvo.amount}개</div>
								<div>option(${pvo.pSize})</div>
							</td>
							<td class="right">
							</td>
						</tr>
						</c:forEach>
					</table>
					
					<table id="orderPrice">
						<tr class="title">
							<th colspan="2">최초 주문금액</th>
						</tr>
						<tr>
							<td>상품금액</td>
							<td><fmt:formatNumber value="${ovo.originPrice}" pattern="#,###"/>원</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td>
								<c:if test="${ovo.orderTotalDelivery==0}">
									무료배송
								</c:if>
								<c:if test="${ovo.orderTotalDelivery!=0}">
									<fmt:formatNumber value="${ovo.orderTotalDelivery}" pattern="#,###"/>원
								</c:if>
							</td>
						</tr>
						<tr>
							<td>할인금액</td>
							<td><fmt:formatNumber value="${ovo.originDc+ovo.orderTotalCoupon+ovo.orderTotalPoint}" pattern="#,###"/>원</td>
						</tr>
						<tr>
							<td>ㄴ상품할인</td>
							<td><fmt:formatNumber value="${ovo.originDc}" pattern="#,###"/>원</td>
						</tr>
						<tr>
							<td>ㄴ쿠폰할인</td>
							<td><fmt:formatNumber value="${ovo.orderTotalCoupon}" pattern="#,###"/>원</td>
						</tr>
						<tr>
							<td>ㄴ적립금할인</td>
							<td><fmt:formatNumber value="${ovo.orderTotalPoint}" pattern="#,###"/>원</td>
						</tr>
					</table>
					
					<table id="pay">
						<tr class="title">
							<th colspan="2">결제 정보</th>
						</tr>
						<tr>
							<td>결제금액</td>
							<td><fmt:formatNumber value="${ovo.orderTotalPayment}" pattern="#,###"/>원</td>
						</tr>
						<tr>
							<td>결제수단</td>
							<td>
								<c:if test="${ovo.orderPayType==0}">신용카드결제</c:if>
								<c:if test="${ovo.orderPayType==1}">휴대폰결제</c:if>
								<c:if test="${ovo.orderPayType==2}">무통장입금</c:if>
							</td>
						</tr>
						<c:if test="${ovo.orderPayType==0}">
						<c:if test="${ovo.orderPaySelection==1}"><c:set value="국민" var="OPS"/></c:if>
						<c:if test="${ovo.orderPaySelection==2}"><c:set value="신한" var="OPS"/></c:if>
						<c:if test="${ovo.orderPaySelection==3}"><c:set value="우리" var="OPS"/></c:if>
						<c:if test="${ovo.orderPaySelection==4}"><c:set value="하나" var="OPS"/></c:if>
						<c:if test="${ovo.orderPaySelection==5}"><c:set value="현대" var="OPS"/></c:if>
						<c:if test="${ovo.orderPaySelection==6}"><c:set value="삼성" var="OPS"/></c:if>
						<c:if test="${ovo.orderPaySelection==7}"><c:set value="롯데" var="OPS"/></c:if>
						<c:if test="${ovo.orderPaySelection==8}"><c:set value="BC" var="OPS"/></c:if>
						<tr>
							<td>카드사</td>
							<td>${OPS}</td>
						</tr>
						<c:if test="${ovo.orderPayInstallment==1}"><c:set value="일시불" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==2}"><c:set value="2개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==3}"><c:set value="3개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==4}"><c:set value="4개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==5}"><c:set value="5개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==6}"><c:set value="6개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==7}"><c:set value="7개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==8}"><c:set value="8개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==9}"><c:set value="9개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==10}"><c:set value="10개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==11}"><c:set value="11개월" var="OPI"/></c:if>
						<c:if test="${ovo.orderPayInstallment==12}"><c:set value="12개월" var="OPI"/></c:if>
						<tr>
							<td>할부개월</td>
							<td>${OPI}</td>
						</tr>
						</c:if>
						<c:if test="${ovo.orderPayType==1}">
						<c:if test="${ovo.orderPaySelection2==1}"><c:set value="SKT" var="OPS2"/></c:if>
						<c:if test="${ovo.orderPaySelection2==2}"><c:set value="KT" var="OPS2"/></c:if>
						<c:if test="${ovo.orderPaySelection2==3}"><c:set value="LGT" var="OPS2"/></c:if>
						<c:if test="${ovo.orderPaySelection2==4}"><c:set value="알뜰폰" var="OPS2"/></c:if>
						<tr>
							<td>통신사</td>
							<td>${OPS2}</td>
						</tr>
						<tr>
							<td>결제 휴대폰번호</td>
							<td>${ovo.orderPayInstallment2}</td>
						</tr>
						</c:if>
						<c:if test="${ovo.orderPayType==2}">
						<c:if test="${ovo.orderPaySelection3==1}"><c:set value="국민" var="OPS3"/></c:if>
						<c:if test="${ovo.orderPaySelection3==2}"><c:set value="신한" var="OPS3"/></c:if>
						<c:if test="${ovo.orderPaySelection3==3}"><c:set value="우리" var="OPS3"/></c:if>
						<c:if test="${ovo.orderPaySelection3==4}"><c:set value="하나" var="OPS3"/></c:if>
						<c:if test="${ovo.orderPaySelection3==5}"><c:set value="카카오" var="OPS3"/></c:if>
						<c:if test="${ovo.orderPaySelection3==6}"><c:set value="토스" var="OPS3"/></c:if>
						<tr>
							<td>입금은행</td>
							<td>${OPS3}</td>
						</tr>
						<tr>
							<td>예금주</td>
							<td>${ovo.orderPayInstallment3}</td>
						</tr>
						</c:if>
					</table>
				</c:forEach>
			</section>
		</div>
	</div>
</body>
</html>
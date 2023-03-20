<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<style>
body {
	margin: 0;
	box-sizing: border-box;
	font-size: 14px;
	background: #eeeeee;
}

#orderList {
	max-width: 1400px;
	margin: auto;
	
}

.orderHeader {
	display: flex;
	justify-content: space-between;
	padding: 10px 0;
}

.orderList {
	display: flex;
}

.orderList__left {
	flex-grow: 10;
	align-content: center;
}

.orderList__right {
	flex-grow: 2;
	background-color: #eeeeee;
	margin-left: 10px;
}

h2 {
	text-align: center;
}

.ordetList__number, .ordetList__address, .orderList__product {
	display: flex;
	padding: 15px 0;
	margin-bottom: 5px;
	border: 1px solid #008B74;
	
}


.ordetList__address {
	background-color: white;
}

.ordetList__number>div {
	margin: 0 10px;
}

.ordetList__address__title {
	flex-grow: 1;
	align-self: center;
	margin: 0 10px;
}

.ordetList__address__info {
	flex-grow: 11;
	margin: 0 10px;
}

.ordetList__address__info>div {
	padding: 3px;
}

.orderList__product>div>img {
	width: 120px;
	height: 120px;
	border-radius: 50px;
	
}

.orderList__product__img {
	flex-grow: 1;
	align-self: center;
	text-align: center;
}

.orderList__product__name {
	flex-grow: 7;
	align-self: center;
	padding: 3px;
	padding-left: 10px;
	margin: 3px;
	text-align: left;
	width: 40%;
}

.orderList__product__option {
	flex-grow: 1;
	align-self: center;
	padding: 3px;
	margin: 3px;
	text-align: center;
}

.orderList__product__amount {
	flex-grow: 1;
	align-self: center;
	padding: 3px;
	margin: 3px;
	text-align: center;
}

.orderList__product__price {
	flex-grow: 2;
	align-self: center;
	padding: 3px;
	margin: 3px;
	text-align: center;
}

.orderList__payment, .orderList__details {
	padding: 10px;
	border: 1px solid #008B74;
	margin-bottom: 5px;
	background-color: white;
}

.orderList__payment>div, .orderList__details>div {
	padding: 5px;
}

.product {
	background-color: white;
	padding: 10px 0;
	margin-top: 20px;
	margin-bottom: 20px;
}

.productList {
	display: flex;
	justify-content: space-between;
}
.productList__box{
	border: 1px solid white;
	padding: 5px;
	width: 20%;
	margin: 5px;
}

.productList__box:hover{
	border: 1px solid #008B74;
}
.productList__box__title {
	height: 40px;
}
.productList__box__price {
	text-align: right;
}
</style>
</head>
<body>
	<section id="orderList">
		<div class="orderHeader">
			<div>주문/결제</div>
			<div>장바구니 / 주문/결제 / 완료</div>
		</div>
		<h2>주문의 정상적으로 완료되었습니다.</h2>
		<div class="orderList">
			
			<div class="orderList__left">
				<div class="ordetList__number">
					<div>주문번호</div>
					<div>${ovo.orderNumber }</div>
				</div>
				<div class="ordetList__address">
					<div class="ordetList__address__title">배송지정보</div>
					<div class="ordetList__address__info">
						<div>${ovo.orderName }</div>
						<div>
							<c:set var="phoneNumber" value="${ovo.orderPhone }" />
							<c:out
								value="${fn:substring(phoneNumber, 0, 3)}-${fn:substring(phoneNumber, 3, 7)}-${fn:substring(phoneNumber, 7, 11)}" />

						</div>
						<div>(${ovo.orderZip })${ovo.orderJuso } ${ovo.orderJuso_etc }</div>
						<div>
							배송메시지 :
							<c:choose>
								<c:when test="${ovo.orderMessage == '1'}">
				    직접 받고 부재시 문앞
				  </c:when>
								<c:when test="${ovo.orderMessage == '2'}">
				    경비실에 맡겨주세요
				  </c:when>
								<c:when test="${ovo.orderMessage == '3'}">
				    택배함에 맡겨주세요
				  </c:when>
								<c:when test="${ovo.orderMessage == '4'}">
				    ${ovo.orderMessage2}
				  </c:when>
								<c:otherwise>
					등록된 메시지가 없습니다.
				  </c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>

				<c:forEach items="${olist }" var="olist">
					<div class="orderList__product">
						<div class="orderList__product__img">
							<img src="../resources/pro/${olist.pImg1}" />
						</div>
						<div class="orderList__product__name">
							<a href="../product/content?pCode=${olist.orderCode }">${olist.pName }</a>

						</div>
						<div class="orderList__product__option">
							<div>사이즈</div>
							<div>${olist.orderSize }</div>
							
						</div>
						<div class="orderList__product__amount">
							<div>수량</div>
							<div>${olist.orderAmount }</div>
						</div>
						<div class="orderList__product__price">
							<fmt:formatNumber value='${olist.pPrice - (olist.pPrice * olist.pDc / 100) }'
								pattern="#,###" />
							원
						</div>
					</div>
				</c:forEach>

			</div>

			<div class="orderList__right">
				<div class="orderList__payment">
					<div>
						주문금액 :
						<fmt:formatNumber value='${ovo.orderTotalPrice + ovo.orderTotalDelivery}'
							pattern="#,###" />
						원
					</div>
					<div>
						상품금액 :
						<fmt:formatNumber value='${ovo.orderTotalPrice}' pattern="#,###" />
						원
					</div>
					<div>
						배송비 :
						<fmt:formatNumber value='${ovo.orderTotalDelivery }' pattern="#,###" />
						원
					</div>
					<div>
						쿠폰할인 :
						<fmt:formatNumber value='${ovo.orderTotalCoupon }' pattern="#,###" />
						원
					</div>
					<div>
						적립금사용 :
						<fmt:formatNumber value='${ovo.orderTotalPoint }' pattern="#,###" />
						원
					</div>
					<div>
						적립예정 : 
						<fmt:formatNumber value='${ovo.orderMileage }' pattern="#,###" />
						원
					</div>


				</div>
				<div class="orderList__details">
					<div>결제상세</div>
					<div>
						<fmt:formatNumber value='${ovo.orderTotalPayment }' pattern="#,###" />
						원
					</div>
					<div>
				<c:choose>
					<c:when test="${ovo.orderPayType == '0'}">신용카드 </c:when>
					<c:when test="${ovo.orderPayType == '1'}">휴대폰 </c:when>
					<c:when test="${ovo.orderPayType == '2'}">무통장입금 </c:when>
					<c:otherwise>결제수단 선택 오류 </c:otherwise>
				</c:choose>
				</div>
				
				<div>
				<c:choose>
					<c:when test="${ovo.orderPayType == '0'}">
					<!-- 신용카드 선택 -->
						<c:choose>
							<c:when test="${ovo.orderPaySelection == '1'}">
						    국민 (45**-****-****-**12)
						  </c:when>
							<c:when test="${ovo.orderPaySelection == '2'}">
						    신한 (45**-****-****-**12)
						  </c:when>
							<c:when test="${ovo.orderPaySelection == '3'}">
						    우리 (45**-****-****-**12)
						  </c:when>
							<c:when test="${ovo.orderPaySelection == '4'}">
						    하나 (45**-****-****-**12)
						  </c:when>
							<c:when test="${ovo.orderPaySelection == '5'}">
						    현대 (45**-****-****-**12)
						  </c:when>
							<c:when test="${ovo.orderPaySelection == '6'}">
						    삼성 (45**-****-****-**12)
						  </c:when>
							<c:when test="${ovo.orderPaySelection == '7'}">
						    롯데 (45**-****-****-**12)
						  </c:when>
							<c:when test="${ovo.orderPaySelection == '8'}">
						  BC (45**-****-****-**12)
						  </c:when>
							<c:otherwise>
							신용카드선택 오류
						  </c:otherwise>
						</c:choose>
					
					</c:when>
					<c:when test="${ovo.orderPayType == '1'}">
						<!-- 휴대폰 선택 -->
						<c:choose>
							<c:when test="${ovo.orderPaySelection2 == '1'}">
						    SKT
						  </c:when>
							<c:when test="${ovo.orderPaySelection2 == '2'}">
						    KT
						  </c:when>
							<c:when test="${ovo.orderPaySelection2 == '3'}">
						    LGU
						  </c:when>
							<c:otherwise>
							휴대폰선택 오류
						  </c:otherwise>
						</c:choose>
					 </c:when>
					<c:when test="${ovo.orderPayType == '2'}">
						<!-- 무통장입금 선택 -->
						<c:choose>
							<c:when test="${ovo.orderPaySelection3 == '1'}">
						    국민은행
						  </c:when>
							<c:when test="${ovo.orderPaySelection3 == '2'}">
						   신한은행
						  </c:when>
							<c:when test="${ovo.orderPaySelection3 == '3'}">
						    우리은행
						  </c:when>
							<c:when test="${ovo.orderPaySelection3 == '4'}">
						    하나은행
						  </c:when>
							<c:when test="${ovo.orderPaySelection3 == '5'}">
						    카카오뱅크
						  </c:when>
						  <c:when test="${ovo.orderPaySelection3 == '6'}">
						    토스뱅크
						  </c:when>
							<c:otherwise>
							은행선택 오류
						  </c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>결제수단 선택 오류 </c:otherwise>
				</c:choose>
					</div>
					
					<div>
					<c:choose>
					<c:when test="${ovo.orderPayType == '0'}">
					<!-- 신용카드 선택 -->
						<c:choose>
							<c:when test="${ovo.orderPayInstallment == '1'}">
						    일시불
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '2'}">
						    2개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '3'}">
						    3개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '4'}">
						    4개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '5'}">
						    5개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '6'}">
						    6개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '7'}">
						    7개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '8'}">
						  8개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '9'}">
						  9개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '10'}">
						  10개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '11'}">
						  11개월
						  </c:when>
							<c:when test="${ovo.orderPayInstallment == '12'}">
						  12개월
						  </c:when>
							<c:otherwise>
							신용카드선택 오류
						  </c:otherwise>
						</c:choose>
					
					</c:when>
					<c:when test="${ovo.orderPayType == '1'}">
						<!-- 휴대폰 선택 -->
						핸드폰번호 : ${ovo.orderPayInstallment2 }
					 </c:when>
					<c:when test="${ovo.orderPayType == '2'}">
						<!-- 무통장입금 선택 -->
						예금주 : ${ovo.orderPayInstallment3 }
					</c:when>
					<c:otherwise>결제수단 선택 오류 </c:otherwise>
				</c:choose>
					</div>
					<div>주문일시 : ${ovo.orderDate }</div>
				</div>
			</div>
		</div>
		<h4>Best 상품</h4>
		<div class="product">
			<div class="productList">
			<c:forEach items="${plist }" var="plist" begin="1" end="6">
				<div class="productList__box">
					<div>
						<a href="../product/content?pCode=${plist.pCode }">
							<img src="../resources/pro/${plist.pImg1 }" width="200" height="200">
						</a>
					</div>
					<div class="productList__box__title">${plist.pName }</div>
					<div class="productList__box__price" >
						<fmt:formatNumber value='${plist.pPrice - (plist.pPrice * plist.pDc / 100) }'
								pattern="#,###" />원
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</section>
</body>
</html>

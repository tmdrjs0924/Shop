<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	padding: 0;
	box-sizing: border-box;
	background-color: #eeeeee;
	font-size: 14px;
}

.btn {
	background-color: #000000;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	width: 350px;
}

.btn-sm {
	border: 1px solid black;
	color: black;
	padding: 2px 2px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	width: 55px;
}


#order {
	max-width: 1400px;
	margin: auto;
}

.order__top {
	display: flex;
	justify-content: space-between;
	padding: 20px;
}

.order__product {
	padding: 10px;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	background-color: white;
}

.order__product>table {
	width: 100%;
}

.order__product td {
	text-align: center;
}

.order__product__img>img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}

.order__product__price {
	text-decoration: line-through;
}

.order__product__dcprice {
	font-weight: bold;
}

.order__left {
	flex-grow: 10;
	padding: 10px 0;
	
}

.order__right {
	flex-grow: 2;
	padding: 10px 0;
	padding-left: 5px;
}

.order__detail {
	display: flex;
	justify-content: space-between;
	padding-top: 50px;
}

.order__delivery, .order__enuri, .order__credit, .order__point,
	.order__privacy {
	border: 1px solid #008B74;
	padding: 10px;
	margin-bottom: 5px;
}

.order__delivery > div,
.order__enuri > div,
.order__credit > div, 
.order__point > div,
.order__privacy > div {
	
	padding: 2px 2px;
	margin: 2px 2px;
	}

.order__info, .order__info2 {
	border: 1px solid #008B74;
	padding: 10px;
	margin-bottom: 5px;
}

.order__credit, .order__point, .order__privacy {
	background-color: white;
}

.order__privacy {
	padding-top: 10px;
}

.order__agreement {
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
}

.order__submit {
	text-align: center;
	padding: 10px;
}

.order__credit__2 {
display: none;
}

.order__credit__3 {
display: none;
}

.inputBox {
	border: none;
	outline: none;
	background-color: transparent;
} 


</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//우편번호 찾기 
	function juso_search() {
	  new daum.Postcode({
	      oncomplete: function(data) {
	        if (data.userSelectedType === 'R') {
	            addr = data.roadAddress;
	        } else {
	            addr = data.jibunAddress;
	        }
	      
	        document.orderForm.orderZip.value = data.zonecode;
	        document.orderForm.orderJuso.value = addr;
	
	        document.orderForm.orderJuso_etc.focus();
	    }
	  }).open();
	}

	function changeAddress1() {
		const defaultName = document.querySelector('#defaultName');
		const defaultPhone = document.querySelector('#defaultPhone');
		const defaultZip = document.querySelector('#defaultZip');
		const defaultJuso = document.querySelector('#defaultJuso');
		const defaultJuso_etc = document.querySelector('#defaultJuso_etc');
		
		const orderName = document.querySelector('input[name="orderName"]');
		const orderPhone = document.querySelector('input[name="orderPhone"]');
		const orderZip = document.querySelector('input[name="orderZip"]');
		const orderJuso = document.querySelector('input[name="orderJuso"]');
		const orderJuso_etc = document.querySelector('input[name="orderJuso_etc"]');
		const jusoSearch = document.querySelector('#jusoSearch');
		
		defaultName.style.display = 'inline-block';
		defaultPhone.style.display = 'inline-block';
		defaultZip.style.display = 'inline-block';
		defaultJuso.style.display = 'inline-block';
		defaultJuso_etc.style.display = 'inline-block';
		
		
		orderName.style.display = 'none';
		orderPhone.style.display = 'none';
		orderZip.style.display = 'none';
		orderJuso.style.display = 'none';
		orderJuso_etc.style.display = 'none';
		jusoSearch.style.display = 'none';
	}
	
	function changeAddress2() {
		const defaultName = document.querySelector('#defaultName');
		const defaultPhone = document.querySelector('#defaultPhone');
		const defaultZip = document.querySelector('#defaultZip');
		const defaultJuso = document.querySelector('#defaultJuso');
		const defaultJuso_etc = document.querySelector('#defaultJuso_etc');
		
		const orderName = document.querySelector('input[name="orderName"]');
		const orderPhone = document.querySelector('input[name="orderPhone"]');
		const orderZip = document.querySelector('input[name="orderZip"]');
		const orderJuso = document.querySelector('input[name="orderJuso"]');
		const orderJuso_etc = document.querySelector('input[name="orderJuso_etc"]');
		const jusoSearch = document.querySelector('#jusoSearch');
		
		defaultName.style.display = 'none';
		defaultPhone.style.display = 'none';
		defaultZip.style.display = 'none';
		defaultJuso.style.display = 'none';
		defaultJuso_etc.style.display = 'none';
		
		orderName.style.display = 'inline-block';
		orderPhone.style.display = 'inline-block';
		orderZip.style.display = 'inline-block';
		orderJuso.style.display = 'inline-block';
		orderJuso_etc.style.display = 'inline-block';
		jusoSearch.style.display = 'inline-block';
		
	}

	function orderCredit1() {
		const c1 = document.querySelector(".order__credit__1");
		const c2 = document.querySelector(".order__credit__2");
		const c3 = document.querySelector(".order__credit__3");
		const cc = document.querySelector(".credit");
			    
		c1.style.display = 'block';
		c2.style.display = 'none';
		c3.style.display = 'none';
		cc.innerText = '신용카드';
	}

	function orderCredit2() {
		const c1 = document.querySelector(".order__credit__1");
		const c2 = document.querySelector(".order__credit__2");
		const c3 = document.querySelector(".order__credit__3");
		const cc = document.querySelector(".credit");
		
		c1.style.display = 'none';
		c2.style.display = 'block';
		c3.style.display = 'none';
		cc.innerText = '휴대폰';
	}

	function orderCredit3() {
		const c1 = document.querySelector(".order__credit__1");
		const c2 = document.querySelector(".order__credit__2");
		const c3 = document.querySelector(".order__credit__3");
		const cc = document.querySelector(".credit");
		
		c1.style.display = 'none';
		c2.style.display = 'none';
		c3.style.display = 'block';
		cc.innerText = '무통장입금';
	}


function pointCheck(my) {
	if(my > ${mvo.point }) {
		alert('보유중인 최대 포인트를 초과할수 없습니다.');
		document.querySelector('#usePoint').value = ${mvo.point };
	}
	
	if(my < 0) {
		document.querySelector('#usePoint').value = 0;
	}
	
	if(!my) {
		document.querySelector('#usePoint').value = 0;
	}
	
	//적립금 사용 금액 계산
	document.querySelector('#totalPoint').textContent = (document.querySelector('#usePoint').value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";; 
	document.querySelector("input[name='orderTotalPoint']").value = document.querySelector('#usePoint').value;
	geTotalPayment();
}

function getNumber(num) {
	const number = num.replace(",", "");
	const number2 = number.replace("원","");
	return parseInt(number2);
}


function geTotalPayment(){
	const totalPrice = getNumber(document.querySelector("input[name='orderTotalPrice']").value);
	
	let usePoint;
		if(!usePoint){
			usePoint = 0;
		}
		else {
			usePoint = getNumber(document.querySelector('#usePoint').value);
		} 
		
	const totalPoint = getNumber(document.querySelector("input[name='orderTotalPoint']").value);
	const totalDelivery = getNumber(document.querySelector("input[name='orderTotalDelivery']").value);
	const totalCoupon = getNumber(document.querySelector("input[name='orderTotalCoupon']").value);
	
	//실 결제금액의 값을 계산
	document.querySelector('#totalPayment').textContent = (totalPrice-totalPoint-totalCoupon+totalDelivery).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	document.querySelector("input[name='orderTotalPayment']").value = totalPrice-totalPoint-totalCoupon+totalDelivery;
}


function allIn(my) {
	if (my.checked) {
		document.querySelector('#usePoint').value = ${mvo.point };
	}
	else{
		document.querySelector('#usePoint').value = '0';
	} 
	
	//적립금 사용계산
	document.querySelector('#totalPoint').textContent = (document.querySelector('#usePoint').value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";; 
	document.querySelector("input[name='orderTotalPoint']").value = document.querySelector('#usePoint').value;
	
	//최종결제금액 재계산
	geTotalPayment();
}

function pointCancel(){
	document.querySelector('#usePoint').value = 0;
	
	//적립금 사용계산
	document.querySelector('#totalPoint').textContent = (document.querySelector('#usePoint').value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";; 
	document.querySelector("input[name='orderTotalPoint']").value = document.querySelector('#usePoint').value;
	
	document.querySelector("input[name='pointAllin']").checked=false;
	geTotalPayment();
}

function messageChange() {
	if(document.querySelector('#selectBox').value == '4')
	{
		document.querySelector('#directMessage').style.display='inline-block';
	}
	else 
	{
		document.querySelector('#directMessage').style.display='none';
	}
}

function submitCheck() {
	

	var orderPayType = document.getElementsByName('orderPayType'); 
	
	  for(i = 0; i < orderPayType.length; i++) {
	    if(orderPayType[i].checked)
	      var selectedValue = orderPayType[i].value;
	  }
	  	if(selectedValue == 0 && document.querySelector("select[name='orderPaySelection']").value == 0) {
			alert("카드를 선택해주세요");
			return false;
	  	} else if(selectedValue == 0 && document.querySelector("select[name='orderPayInstallment']").value == 0) {
	  		alert("할부기간을 선택해주세요");
			return false;
	  	} else if(selectedValue == 1 && document.querySelector("select[name='orderPaySelection2']").value == 0) {
	  		alert("통신사를 선택해주세요");
			return false;
	  	} else if(selectedValue == 1 && document.querySelector("input[name='orderPayInstallment2']").value == "" ) {
	  		alert("휴대폰 번호를 입력해주세요");
			return false;
	  	
	  	} else if(selectedValue == 2 && document.querySelector("select[name='orderPaySelection3']").value == 0) {
	  		alert("은행을 선택해주세요");
			return false;
	  	} else if(selectedValue == 2 && document.querySelector("input[name='orderPayInstallment3']").value == "" ) {
	  		alert("예금주를 입력해주세요");
			return false;
	  	}
	}

window.addEventListener("message", function(event) {
  var selectedAddress = event.data;
  console.log(selectedAddress);
  
  $.ajax({
	  url: "changeAddress?id="+selectedAddress,
	  contentType : "application/json; charset:UTF-8",
	  dataType: "json",
	  success: function(data) {
		  document.querySelector("input[name='orderName']").value = data.name;
		  document.querySelector("#defaultName").innerText = data.name;
		  
		  document.querySelector("input[name='orderPhone']").value = data.phone;
		  document.querySelector("#defaultPhone").innerText = data.phone;
		  
		  document.querySelector("input[name='orderZip']").value = data.zip;
		  document.querySelector("#defaultZip").innerText = data.zip;
		  
		  document.querySelector("input[name='orderJuso']").value = data.juso;
		  document.querySelector("#defaultJuso").innerText = data.juso;
		  
		  document.querySelector("input[name='orderJuso_etc']").value = data.juso_etc;
		  document.querySelector("#defaultJuso_etc").innerText = data.juso_etc;
		  
	  }
	  });
  
});

</script>

</head>
<body>

	<section id="order">
		<form method="post" action="../order/orderAction" name="orderForm" onsubmit="return submitCheck()">
			<div class="order__top">
				<div>주문/결제</div>
				<div>장바구니 > 주문/결제 > 완료</div>
			</div>

			<div class="order__product">
				<table>
					<thead>
						<tr>
							<th>상품</th>
							<th>상품이름</th>
							<th>옵션</th>
							<th>배송비</th>
							<th>수량</th>
							<th>할인</th>
							<th>상품금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${olist }" var="olist">
						<input type="hidden" name="orderSize" value="${olist.orderSize }">
						<input type="hidden" name="orderAmount" value="${olist.orderAmount }">
						<input type="hidden" name="orderCode" value="${olist.orderCode }">
						
							<tr>
								<td>
									<div class="order__product__img">
										<img src="../resources/pro/${olist.pImg1 }" />
									</div>
								</td>
								<td><div class="order__product__title">${olist.pName }</div></td>
								<td><div class="order__product__option">
										${olist.orderSize }
									</div>
								</td>
								<td><div class="order__product__delivery">
										<c:if test="${olist.pDelivery==0 }">무료배송</c:if>
										<c:if test="${olist.pDelivery!=0 }">
											<fmt:formatNumber value="${olist.pDelivery }" pattern="#,###" />원
	            		</c:if>
									</div></td>
								<td><div class="order__product__inven">${olist.orderAmount }</div></td>
								<td><div class="order__product__dc">
										<fmt:formatNumber
											value="${olist.pPrice * olist.pDc /100 * olist.orderAmount}"
											pattern="#,###" />
										원
									</div></td>
								<td>
									<div class="order__product__price">
										<fmt:formatNumber value="${olist.pPrice * olist.orderAmount}"
											pattern="#,###" />
										원
									</div>
									<div class="order__product__dcprice">
										<fmt:formatNumber
											value="${(olist.pPrice - (olist.pPrice * olist.pDc /100))*olist.orderAmount }"
											pattern="#,###" />
										원
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


			<div class="order__detail">
				<div class="order__left">
					<div class="order__delivery">
						<h3>배송지 정보</h3>
						<div class="order__left__sub">
							<div>배송지 선택</div>
							<div>
								<div>
									<span><input type="radio" onclick="changeAddress1()" name="orderAddressId" value="0" checked />기본배송지</span>
									<span><input type="radio" onclick="changeAddress2()" name="orderAddressId" value="1" />신규배송지</span>
									<span class="btn-sm">
										<a href="addressList" target="_blank" onclick="window.open(this.href,'targetWindow','width=800,height=800'); return false;">
											주소목록
										</a>
									</span>
								</div>
								
							</div>
						</div>
						<div class="order__left__name">
							받는사람 : <input type="text" name="orderName" value="${jvo.name }" style="display:none;">
							<span id="defaultName">
								${jvo.name }
							</span> 
						</div>
						<div class="order__left__phone">
							전화번호 : <input type="text" name="orderPhone" value="${jvo.phone }" style="display:none;">
							<span id="defaultPhone">
								<c:set var="phoneNumber" value="${jvo.phone }" />
			  					<c:out value="${fn:substring(phoneNumber, 0, 3)}-${fn:substring(phoneNumber, 3, 7)}-${fn:substring(phoneNumber, 7, 11)}" />
			  				</span>
						</div>
						<div>주소 : 
							<input size="4" type="text" name="orderZip" value="${jvo.zip }" style="display:none;" readonly>
							<span class="btn-sm" id="jusoSearch" onclick="juso_search()" style="display: none;">검색</span> 
							<input type="text" name="orderJuso" value="${jvo.juso }" style="display:none;" readonly> 
							<input type="text" name="orderJuso_etc" value="${jvo.juso_etc }" style="display:none;">
							<span id="defaultZip">(${jvo.zip })</span>
							<span id="defaultJuso"> ${jvo.juso }</span>
							<span id="defaultJuso_etc"> ${jvo.juso_etc }</span>
						</div>
						<div>
							<span> <select name="orderMessage" id="selectBox" onchange="messageChange()">
									<option value="1">직접 받고 부재시 문 앞</option>
									<option value="2">경비실에 맡겨 주세요</option>
									<option value="3">택배함에 맡겨 주세요</option>
									<option id="direct" value="4">직접입력</option>
							</select>
							<input type="text" id="directMessage" name="orderMessage2" style="display:none">
							</span> 
						</div>
						<div>도서산간 지역의 경우 추후 수령시 추가 배송비가 과금될 수 있습니다.</div>
					</div>
					<div class="order__enuri">
						<h3>할인 및 포인트</h3>
						<div>쿠폰 할인</div>
						<div>
							<span class="btn-sm">쿠폰사용</span>
						</div>
						<div>적립금 사용</div>
						<div>
							보유 : 
							<input class="inputBox" type="text" class="possessionPoints" name="possessionPoints" value="<fmt:formatNumber value='${mvo.point }' pattern='#,###' />" disabled />
						</div>
						<div>
							사용 : <input type="number" name="usePoint" id="usePoint" min='0' max='${mvo.point }' onchange='pointCheck(this.value)'>
							<span class="btn-sm" onclick="pointCancel()">취소</span>
							<input name="pointAllin" type="checkbox" onclick='allIn(this)'/>전액 사용
						</div>
					</div>
					<div class="order__credit">
						<h3>결제수단</h3>
						<div>
							<span><input type="radio" name="orderPayType" value="0" onclick='orderCredit1()'checked />신용카드</span>
							<span><input type="radio" name="orderPayType" value="1" onclick='orderCredit2()'/>휴대폰</span>
							<span><input type="radio" name="orderPayType" value="2" onclick='orderCredit3()' />무통장입금</span>
						</div>

						<div class="order__credit__1">
							<div>
								카드선택 <select name="orderPaySelection" >
									<option value="0">선택하세요</option>
									<option value="1">국민카드</option>
									<option value="2">신한카드</option>
									<option value="3">우리카드</option>
									<option value="4">하나카드</option>
									<option value="5">현대카드</option>
									<option value="6">삼성카드</option>
									<option value="7">롯데카드</option>
									<option value="8">BC카드</option>
								</select>
							</div>
							<div>
								할부기간 <select name="orderPayInstallment">
									<option value="0">선택하세요</option>
									<option value="1">일시불</option>
									<option value="2">2개월</option>
									<option value="3">3개월</option>
									<option value="4">4개월</option>
									<option value="5">5개월</option>
									<option value="6">6개월</option>
									<option value="7">7개월</option>
									<option value="8">8개월</option>
									<option value="9">9개월</option>
									<option value="10">10개월</option>
									<option value="11">11개월</option>
									<option value="12">12개월</option>
								</select>
							</div>
						</div>

						<div class="order__credit__2" >
							<div>
								통신사선택 <select name="orderPaySelection2">
									<option value="0">선택하세요</option>
									<option value="1">SKT</option>
									<option value="2">KT</option>
									<option value="3">LGU</option>
									<option value="4">알뜰폰</option>
								</select>
							</div>
							<div>
								 <input type="text" name="orderPayInstallment2" placeholder="휴대폰 번호">
							</div>
						</div>
						
						<div class="order__credit__3" >
							<div>
								은행선택 <select name="orderPaySelection3">
									<option value="0">선택하세요</option>
									<option value="1">국민</option>
									<option value="2">신한</option>
									<option value="3">우리</option>
									<option value="4">하나</option>
									<option value="5">카카오뱅크</option>
									<option value="6">토스뱅크</option>
								</select>
							</div>
							<div>
								<input type="text" name="orderPayInstallment3" placeholder="예금주">
							</div>
						</div>						


					</div> <!-- order__credit 끝 -->

					<div class="order__point">
						<h3>적립금 혜택</h3>
						<div>
							<c:set var="totalPoint"/>
							<c:forEach items="${olist }" var="result" varStatus="status">
							<c:set var="totalPoint" value="${totalPoint + ((result.pPrice - (result.pPrice * result.pDc /100))*result.orderAmount) *result.pMile/100 }"/>	
							</c:forEach>
							구매적립 : <fmt:formatNumber value="${totalPoint }" pattern="#,###" />
							<input type="hidden" name="orderMileage" value="<fmt:formatNumber value='${totalPoint}' pattern="####"/>">
 						</div>
					</div>
					<div class="order__privacy">
						<div>개인정보 제공 동의 상세보기</div>
					</div>
				</div>

				<div class="order__right">
					<div class="order__info">
						<h3>주문자 정보</h3>
						<div>${mvo.name }</div>
						<div>
						<c:set var="phoneNumber" value="${mvo.phone }" />
			  				<c:out value="${fn:substring(phoneNumber, 0, 3)}-${fn:substring(phoneNumber, 3, 7)}-${fn:substring(phoneNumber, 7, 11)}" />
							<span class="btn-sm">수정</span>
						</div>
						<div>${mvo.email }<span class="btn-sm">수정</span>
						</div>
						<div>주문자 정보로 결제관련 정보가 제공됩니다.</div>
					</div>
					<div class="order__info2">
						<h3>결제상세</h3>
						<div>
							<span>상품금액 : </span>
							<span id="totalPrice"><fmt:formatNumber type="number" value='${total_price }' pattern="#,###" />원</span>
							<input type="hidden" name="orderTotalPrice" value="${total_price}">
						</div>
						<div>
							<span>상품수량 : </span> 
							<span id="totalAmount"><fmt:formatNumber type="number" value='${total_amount2 }' pattern="#,###" />개</span>
							<input type="hidden" name="orderTotalAmount" value="${total_amount2}">
						</div>
						<div>
							<span>배송비 : </span>
							<span id="totalDelivery"><fmt:formatNumber type="number" value='${total_delivery }' pattern="#,###" />원</span>
							<input type="hidden" name="orderTotalDelivery" value="${total_delivery}">
						</div>
						<div>
							<span>쿠폰할인: </span>
							<span id="totalCoupon"><fmt:formatNumber type="number" value='0' pattern="#,###" />원</span>
							<input type="hidden" name="orderTotalCoupon" value="0">
						</div>
						<div>
							<span>적립금사용 :</span>
							<span id="totalPoint"><fmt:formatNumber value='0' pattern="#,###" />원</span>
							<input type="hidden" name="orderTotalPoint" value="0">
						</div>
						<div>
							<span class="credit">신용카드</span>
							<span id="totalPayment"><fmt:formatNumber type="number" value='${total_price + total_delivery }' pattern="#,###" />원</span> 
							 
							<input type="hidden" name="orderTotalPayment" value="${total_price + total_delivery }">
						</div>
					</div>
				</div>
			</div>
			<div class="order__agreement">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</div>
			<div class="order__submit">
				<input type="hidden" name="orderNumber" value="test">
				<input type="hidden" name="orderUserid" value="${userid }">
				<button class="btn" type="submit">결제하기</button>
			</div>
		</form>
	</section>
</body>
</html>

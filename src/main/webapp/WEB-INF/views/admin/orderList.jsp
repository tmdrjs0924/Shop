<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	color: black;
}

.page-link {
  color: black; 
  background-color: white;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: white;
 font-weight:bold;
 background-color: black;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: white;
  background-color: grey; 
  border-color: #ccc;
}

.searchBox {
	justify-content: center;
}

.form-select-sm {
	width: 100px;
	display: inline-block;
}

.form-control-sm {
	width: 300px;
	display: inline-block;
}

.btn-sm {
	display: inline-block;
}
</style>
<script>
$(document).ready(function () {
	let searchForm = $('#searchForm');
	let moveForm = $('#moveForm');
	
		/* 상품 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			
			e.preventDefault();
			
			/* 검색 키워드 유효성 검사
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오");
				return false;
			} */
			
			searchForm.find("input[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});
		
		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e){
			
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
			
		});
	});

</script>
</head>
<body>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">주문 관리</h1>
	</div>
	
	
	<!-- 주문조회 내역 -->
	<div class="container-fluid">
		<div class="row">검색결과 : ${orderTotal}건</div>
		<div class="row">
			<table class="table text-center align-middle table-striped table-hover">
				<thead>
				<tr>
					<th>주문일</th>
					<th>주문번호</th>
					<th>주문자</th>
					<th>상품명</th>
					<th>옵션</th>
					<th>수량</th>
					<th>총상품금액</th>
					<th>총실제결제금액</th>
					<th>결제수단</th>
					<th>현재상태</th>
					<th>상태변경</th>
				</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${olist }" var="olist">
				<tr>
					<td>${olist.orderDate }</td>
					<td>${olist.orderNumber }</td>
					<td>${olist.orderUserid }</td>
					<td>
						<c:forEach items="${olist.pName2 }" var="pname">
							${pname }<br>
						</c:forEach>
					</td>
					<td>
						<c:forEach items="${olist.orderSize }" var="osize">
							${osize }<br>
						</c:forEach>
					</td>
					<td>
						<c:forEach items="${olist.orderAmount }" var="oamount">
							${oamount }<br>
						</c:forEach>
					</td>
					<td class="text-end">
						<fmt:formatNumber value="${olist.orderTotalPrice }" pattern="#,###" />원
					</td>
					<td class="text-end">
						<fmt:formatNumber value="${olist.orderTotalPayment }" pattern="#,###" />원
					</td>
					<td>
						<c:choose>
							<c:when test="${olist.orderPayType == '0'}">신용카드</c:when>
							<c:when test="${olist.orderPayType == '1'}">휴대폰</c:when>
							<c:when test="${olist.orderPayType == '2'}">무통장입금</c:when>
							<c:otherwise>결제수단 오류</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${olist.orderState == '0'}">결제완료</c:when>
							<c:when test="${olist.orderState == '1'}">상품준비중</c:when>
							<c:when test="${olist.orderState == '2'}">배송중</c:when>
							<c:when test="${olist.orderState == '3'}">배송완료</c:when>
							<c:when test="${olist.orderState == '4'}">취소신청중</c:when>
							<c:when test="${olist.orderState == '5'}">취소완료</c:when>
							<c:when test="${olist.orderState == '6'}">반품신청중</c:when>
							<c:when test="${olist.orderState == '7'}">반품완료</c:when>
							<c:when test="${olist.orderState == '8'}">환불신청중</c:when>
							<c:when test="${olist.orderState == '9'}">환불완료</c:when>
							<c:when test="${olist.orderState == '10'}">구매확정</c:when>
							<c:otherwise>결제수단 오류</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${olist.orderState == '0'}">
								<button class="btn btn-sm btn-outline-primary m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=1'">주문확인</button><br>
								<button class="btn btn-sm btn-outline-danger m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=4'">주문취소</button>
							</c:when>
							<c:when test="${olist.orderState == '1'}">
								<button class="btn btn-sm btn-outline-primary m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=2'">상품발송</button><br>
								<button class="btn btn-sm btn-outline-danger m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=4'">주문취소</button>
							</c:when>
							<c:when test="${olist.orderState == '2'}">
								<button class="btn btn-sm btn-outline-primary m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=3'">배송완료</button>
							</c:when>
							<c:when test="${olist.orderState == '3'}">
								
							</c:when>
							<c:when test="${olist.orderState == '4'}">
								<button class="btn btn-sm btn-outline-primary m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=5'">취소완료</button><br>
								<button class="btn btn-sm btn-outline-danger m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=1'">취소거부</button><br>
								<button class="btn btn-sm btn-outline-dark m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=9'">환불완료</button>
							</c:when>
							<c:when test="${olist.orderState == '5'}">
								<button class="btn btn-sm btn-outline-dark m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=9'">환불완료</button>
							</c:when>
							<c:when test="${olist.orderState == '6'}">
								<button class="btn btn-sm btn-outline-primary m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=7'">반품완료</button><br>
								<button class="btn btn-sm btn-outline-danger m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=3'">반품거부</button><br>
								<button class="btn btn-sm btn-outline-dark m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=9'">환불완료</button>
							</c:when>
							<c:when test="${olist.orderState == '7'}">
								<button class="btn btn-sm btn-outline-dark m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=9'">환불완료</button>
							</c:when>
							<c:when test="${olist.orderState == '8'}">
								<button class="btn btn-sm btn-outline-dark m-1" onclick="location.href='orderModify?orderNumber=${olist.orderNumber}&orderState=9'">환불완료</button>
							</c:when>
							<c:when test="${olist.orderState == '9'}">
							</c:when>
							<c:when test="${olist.orderState == '10'}"></c:when>
							<c:otherwise>오류</c:otherwise>
						</c:choose>
					</td>
				</tr>	
				</c:forEach>
				</tbody>
			</table>
		</div>
		
			<!-- 주문  검색 -->
	<div class="d-flex searchBox">
		<form method="get" action="../admin/orderList" name="searchForm">
			<select class="form-select form-select-sm" name="type">
			    <option value="orderNumber" selected>주문번호</option>
			    <option value="orderUserid">주문자ID</option>
			</select>
	
		  	<input type="text" class="form-control form-control-sm" name="keyword" placeholder="검색어를 입력하세요">
		  	<button class='btn search_btn btn-sm btn-dark'>검 색</button>
  		</form>
	</div>
		
		<!-- 페이지 이름 인터페이스 영역 -->
		<div class="pageMaker_wrap">
			<ul class="pagination pagination-sm justify-content-center pageMaker">
			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev }">
				<li class="page-item pageMaker_btn prev">
					<a class="page-link" href="${pageMaker.pageStart -1}">이전</a>
				</li>
			</c:if>
                			
			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
				<li class="page-item pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
					<a class="page-link" href="${num}">${num}</a>
				</li>	
			</c:forEach>
                		
			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="page-item pageMaker_btn next">
					<a class="page-link" href="${pageMaker.pageEnd + 1 }">다음</a>
				</li>
			</c:if>
			</ul>
		</div>
		<form id="moveForm" action="orderList" method="get" >
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
		</form>
		
	
		
	</div>
</main>
</body>
</html>
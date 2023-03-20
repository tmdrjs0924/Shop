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
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 	
 	<div class="d-flex pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">주문 관리</h1>
	</div>
	
	<h5 class="pt">실시간 매출현황</h5>
	
	<div class="container-fluid">
		<table class="table text-center align-middle">
			<thead>
			<tr>
				<th>구분</th>
				<th>오늘</th>
				<th>어제</th>
				<th>1주일</th>
				<th>이번 달</th>
				<th>바로가기</th>
			</tr>
			</thead>
				
			<tbody>
			<tr>
				<td>총 주문 금액(건수)</td>
				<td>
					<fmt:formatNumber value="${todayOrderPrice}" pattern="#,###" />원
					(${todayOrderAmount}건)
				</td>
				<td>
					<fmt:formatNumber value="${yesterdayOrderPrice}" pattern="#,###" />원
					(${yesterdayOrderAmount}건)
				</td>
				<td>
					<fmt:formatNumber value="${weekOrderPrice}" pattern="#,###" />원 
					(${weekOrderAmount}건)
				</td>
				<td>
					<fmt:formatNumber value="${monthOrderPrice}" pattern="#,###" />원 
					(${monthOrderAmount}건)
				</td>
				<td>
					<a class="btn btn-sm btn-outline-dark m-1" href="orderList">주문조회</a>
				</td>
			</tr>
			
			<tr>
				<td>총 실 결제 금액(건수)</td>
				<td>
					<fmt:formatNumber value="${todayOrderPrice2}" pattern="#,###" />원
					(${todayOrderAmount2}건)
				</td>
				<td>
					<fmt:formatNumber value="${yesterdayOrderPrice2}" pattern="#,###" />원
					(${yesterdayOrderAmount2}건)
				</td>
				<td>
					<fmt:formatNumber value="${weekOrderPrice2}" pattern="#,###" />원 
					(${weekOrderAmount2}건)
				</td>
				<td>
					<fmt:formatNumber value="${monthOrderPrice2}" pattern="#,###" />원
					(${monthOrderAmount2}건)
				</td>
				
				<td>
					<a class="btn btn-sm btn-outline-dark m-1" href="">결제조회</a>
				</td>
			</tr>
			
			<tr>
				<td>총 환불 금액(건수)</td>
				<td>
					<fmt:formatNumber value="${todayOrderPrice-todayOrderPrice2}" pattern="#,###" />원
					(${todayOrderAmount-todayOrderAmount2}건)
				</td>
				<td>
					<fmt:formatNumber value="${yesterdayOrderPrice-yesterdayOrderPrice2}" pattern="#,###" />원
					(${yesterdayOrderAmount-yesterdayOrderAmount2}건)
				</td>
				<td>
					<fmt:formatNumber value="${weekOrderPrice-weekOrderPrice2}" pattern="#,###" />원 
					(${weekOrderAmount-weekOrderAmount2}건)
				</td>
				<td>
					<fmt:formatNumber value="${monthOrderPrice-monthOrderPrice2}" pattern="#,###" />원 
					(${monthOrderAmount-monthOrderAmount2}건)
				</td>
				<td>
					<a class="btn btn-sm btn-outline-dark m-1" href="">환불조회</a>
				</td>
			</tr>	
			</tbody>
		</table>
	</div>
		
	<h5>주문 현황</h5>
	<div class="container-fluid">
		<table class="table text-center">
			<thead>
				<tr>
				<th>결제완료</th>
				<th>상품준비중</th>
				<th>배송중</th>
				<th>배송완료</th>
				<th>취소신청/취소완료</th>
				<th>반품신청/반품완료</th>
				<th>환불전/환불완료</th>
				<th>구매확정</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
				<td>${orderAmount0 }건</td>
				<td>${orderAmount1 }건</td>
				<td>${orderAmount2 }건</td>
				<td>${orderAmount3 }건</td>
				<td>${orderAmount4 }건 / ${orderAmount5 }건 </td>
				<td>${orderAmount6 }건 / ${orderAmount7 }건 </td>
				<td>${orderAmount8 }건 / ${orderAmount9 }건 </td>
				<td>${orderAmount10 }건  </td>
				</tr>
			
			</tbody>	
		</table>
	</div>
		
</main>
</body>
</html>
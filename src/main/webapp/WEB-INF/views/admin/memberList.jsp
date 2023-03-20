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
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
		<h1 class="h2">회원 관리</h1>
	</div>
	<div>전체 ${pageMaker.total}명 </div>
	
	<div class="container-fluid">
		<table class="table text-center table-striped table-hover">
			<thead>
			<tr>
				<th>회원아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>최근90일 주문금액</th>
				<th>적립금</th>
				<th>회원상태</th>
				<th>회원변경</th>
				<th>회원가입일</th>
			</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${mlist }" var="mlist">
			<tr onclick="location.href='memberDetail?id=${mlist.id}'">
				<td>${mlist.userid }</td>
				<td>${mlist.name }</td>
				<td>${mlist.phone }</td>
				<td>${mlist.email }</td>
				<td class="text-end pe-5">
					<fmt:formatNumber value="${mlist.totalPrice }" pattern="#,###" />원
				</td>
				<td>
					<fmt:formatNumber value="${mlist.point }" pattern="#,###" />
				</td>
				<td>
					<c:if test="${mlist.state==0 }">
						<c:choose>
    						<c:when test="${mlist.rank == 0}">
    							일반회원
		    				</c:when>
    						<c:when test="${mlist.rank == 1}">
    							실버회원
		    				</c:when>
    						<c:when test="${mlist.rank == 2}">
    							골드회원
		    				</c:when>
    						<c:when test="${mlist.rank == 3}">
    							다이아회원
		    				</c:when>
		  				</c:choose>
					</c:if>
					<c:if test="${mlist.state==1 }">
						탈퇴신청중
					</c:if>
					<c:if test="${mlist.state==2 }">
						탈퇴회원
					</c:if>
				</td>
				<td>
					<c:if test="${mlist.state==0 }">
						<a href="memberDelete?id=${mlist.id }">강제탈퇴</a>
					</c:if>
					<c:if test="${mlist.state==1 }">
						<a href="memberDelete?id=${mlist.id }">탈퇴승인</a>
					</c:if>
				</td>
				<td>${mlist.writeday }</td>
			</tr>
			</c:forEach>
			</tbody>			
		
		</table>
		
		<div class="row search_wrap col-auto text-center">
		<form id="searchForm" action="memberList" method="get">
			<div class="search_input">
				아이디
				<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
				<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
				<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
				 <button class='btn search_btn btn-dark btn-sm'>검 색</button>
			</div>	                				
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
                	
		<form id="moveForm" action="productList" method="get" >
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
		
	</div>
</main>
</body>
</html>
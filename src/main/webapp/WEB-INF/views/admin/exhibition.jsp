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

.list-group-item.active {
 z-index: 2;
 color: white;
 font-weight:bold;
 background-color: black;
 border-color: #ccc;
}

.list-group-item:hover {
 z-index: 1;
 color: white;
 background-color: grey;
 border-color: #ccc;
}

.menu1 {
	width: 5%;
}
.menu3{
	width: 15%;
}
.menu2,
.menu5,
.menu6 {
	width: 10%;
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
	
	   function maincheck(my)
	   {
		   var csub=document.getElementsByClassName("csub");
		   
		   var len=csub.length; // 상품의 갯수
		   
		   if(my.checked) // true, false
		   {
			   // 체크가 되었다면 => 상품의 체크박스에 전부 체크
			   for(i=0;i<len;i++)
			   {
				   csub[i].checked=true;
			   } 	   
			   // 전체선택 체크박스도 체크
			   document.getElementById("up").checked=true;
		   }	
		   else
		   {
			   // 체크가 안되었다면 => 상품의 체크박스에 전부 해제
			   for(i=0;i<len;i++)
			   {
				   csub[i].checked=false;
			   } 	   
			   // 전체선택 체크박스도 체크
			   document.getElementById("up").checked=false;
		   }	   
	   }
	   
	   function subcheck()
	   {
		   var csub=document.getElementsByClassName("csub");
		   var len=csub.length; // 총상품의 갯수
		   
		   // 상품의 체크박스가 몇개 체크되었나를 계산
		   var n=0;
		   for(i=0;i<len;i++)
		   {
			   if(csub[i].checked)
				   n++; // 체크가 된 상품의 갯수
		   }

	       if(len==n)
	       {
	    	   document.getElementById("up").checked=true;
	       }	
	       else
	       {
	    	   document.getElementById("up").checked=false;
	       }	   
	   }
	   //진열함
	   function productOn()
	   {
		   var id="";
		   var csub=document.getElementsByClassName("csub");
		   var len=csub.length; 
	  
	       for(i=0;i<len;i++)
	       {
			    if(csub[i].checked)
			       id=id+csub[i].value+",";
		   }	   
		   
		   if(id!="")   
		      location="changeShow?chk=1&pShow=1&id="+id;
		   
	   }
	   
	   //진열안함
	   function productOff()
	   {
		   var id="";
		   var csub=document.getElementsByClassName("csub");
		   var len=csub.length; 
	  
	       for(i=0;i<len;i++)
	       {
			    if(csub[i].checked)
			       id=id+csub[i].value+",";
		   }	   
		   
		   if(id!="")   
			   location="changeShow?chk=1&pShow=0&id="+id;
		   
	   }
	   
	   
	 </script>
</head>
<body>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">진열 관리</h1>
	</div>
		
	<div class="container-fluid">
		<div class="pb-3">
			<ul class="list-group list-group-horizontal pb-10">
			  <li class="list-group-item active" onclick="location.href='exhibition'">
			  	New
			  </li>
			  <li class="list-group-item" onclick="location.href='exhibition2'">
			  	Best
			  </li>
			</ul>
		</div>	
	
		<div class="d-flex justify-content-between pb-2">
			<div class="col-auto">
				<span class="btn btn-sm btn-outline-dark" onclick="productOn()">진열함</span>
				<span class="btn btn-sm btn-outline-dark" onclick="productOff()">진열안함</span>
			</div>
			
			<!-- 검색 영역 -->
			<div class="row search_wrap col-auto">
			<form id="searchForm" action="exhibition" method="get">
				<div class="search_input">
					<input type="text" name="keyword" placeholder="상품명을 입력하세요" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
					<input type="hidden" name="type" value="G">
					 <button class='btn search_btn btn-dark btn-sm'>검 색</button>
				</div>	                				
			</form>
			</div>	
			
		</div>
		
	
		
		<table class="table">
			<thead>
			<tr class="text-center">
				<th class="menu1">
					<input type="Checkbox" onclick="maincheck(this)" id="up">
				</th>
				<th class="menu2">진열상태</th>
				<th class="menu3">상품코드</th>
				<th class="menu4">상품명</th>
				<th class="menu5">판매가</th>
				<th class="menu6">할인가</th>
			</thead>
			
			<tbody>
			<c:forEach items="${newList }" var="pvo">
			<tr class="align-middle text-center">
				<td>
					<input type="checkbox" class="csub" onclick="subcheck()" value="${pvo.id }">
				</td>
				<td>
					<c:if test="${pvo.pShow == 1}">신상품</c:if>
					<c:if test="${pvo.pShow != 1}">일반상품</c:if>					
				</td>
				<td>${pvo.pCode }</td>
				<td class="text-start w-50">
					<img src="../resources/pro/${pvo.pImg1 }" width="50" height="50">
					<a href="productDetail?id=${pvo.id }"> ${pvo.pName }</a>
				</td>
				
				<td>
				<fmt:formatNumber value="${pvo.pPrice }" type="number"/>
					
				</td>
				<td>
				<fmt:formatNumber value="${Math.ceil ((pvo.pPrice - (pvo.pDc * pvo.pPrice /100))/100) *100}" type="number"/>
				
					
				</td>
			</tr>			
			</c:forEach>
			</tbody>
		</table>
		
		
		
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
                	
		<form id="moveForm" action="exhibition" method="get" >
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
		
		</div>
		
</main>
</body>
</html>
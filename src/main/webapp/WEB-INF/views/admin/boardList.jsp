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
.boardAnswer{
	display: none;
}

.answer {
	cursor: pointer;
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
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>
$(function(){
	
	//답변 입력창 보이기
	test=$(".answer");
	
	$(".answer").click(function(){
	n=test.index(this);
	$(".boardAnswer").eq(n).toggle();
	});

	/* 페이지 이동 버튼 */
	let moveForm = $('#moveForm');
	$(".pageMaker_btn a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.submit();
	});
});

	//체크박스 관련
	function allCheck(my) {
		var selectCheck=document.getElementsByClassName("selectCheck");
		var len=selectCheck.length; 
		
		if(my.checked) {
			for(i=0;i<len;i++) {
				selectCheck[i].checked=true;
			} 	   
			document.getElementById("allCheck").checked=true;
		   }	
		else {
			for(i=0;i<len;i++) {
				selectCheck[i].checked=false;
			} 	   
			document.getElementById("allCheck").checked=false;
		   }	   
	   }
	   
		function selectCheck() {
			var selectCheck=document.getElementsByClassName("selectCheck");
			var len=selectCheck.length;
			
			var n=0;
			for(i=0;i<len;i++) {
				if(selectCheck[i].checked)
				n++; 
			}

			if(len==n) {
				document.getElementById("allCheck").checked=true;
			} 
			else {
				document.getElementById("allCheck").checked=false;
			}	   
		}
		
		function checkDelete() {
			var id="";
			var selectCheck=document.getElementsByClassName("selectCheck");
			var len=selectCheck.length;
			
			alert(len);
				
		       for(i=0;i<len;i++) {
					if(selectCheck[i].checked)
						id = id+selectCheck[i].value+",";
				}
				if(id!="")   
					location="boardDelete?id="+id;
		}		
</script>
</head>

<body>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 	
 	<div class="d-flex pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">게시판 관리</h1>
	</div>
	
	<ul class="list-group list-group-horizontal">
  		<li class="list-group-item active" onclick="location.href='boardList'">
 			상품 문의
  		</li>
  		<li class="list-group-item" onclick="location.href='counselList'">
  			1:1 문의
  		</li>
	</ul>

	<div class="container-fluid pt-4">
		<span class="btn btn-sm btn-outline-dark" onclick="checkDelete()">삭제</span>
		
		<table class="table text-center align-middle table-hover">
			<thead>
			<tr>
				<th>
					<input type="checkbox" onclick="allCheck(this)" id="allCheck">
				</th>
				<th>분류</th>
				<th class="w-25">관련상품</th>
				<th class="w-25">문의내용</th>
				<th>답변상태</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
			</thead>
				
			<tbody>
			<c:forEach items="${blist }" var="blist" varStatus="i">
			<tr>
				<td>
					<input type="checkbox" class="selectCheck" onclick="selectCheck()" value="${blist.id }">
				</td>
				<td>
					<c:if test="${blist.sort==0 }">
						사이즈					
					</c:if>
					<c:if test="${blist.sort==1 }">
						배송
					</c:if>
					<c:if test="${blist.sort==2 }">
						재입고					
					</c:if>
					<c:if test="${blist.sort==3 }">
						상세문의					
					</c:if>
				</td>
				<td class="text-start">${blist.pName}</td>
				<td class="text-start">${blist.title }</td>
				<td class="answer">
					<c:if test="${blist.state==0 }">
						미답변
					</c:if>
					<c:if test="${blist.state==1 }">
						답변완료
					</c:if>
				</td>
				<td>${blist.userid }</td>
				<td>${blist.writeday }</td>
				<td><a class="btn btn-sm btn-outline-dark" href="../admin/boardDelete?id=${blist.id }">삭제</a></td>
			</tr>
			
			<tr class="boardAnswer">
				<td colspan="8">
					<form method="post" action="../admin/boardAction">
					<div class="row justify-content-between">
						<div class="form-floating col-5">
	  						<input type="text" class="form-control" value="${blist.content }" disabled="disabled">
	  						<label>문의내용</label>
						</div>
						
						<c:if test="${blist.state==0 }">
							<div class="form-floating col">
		  						<input type="text" class="form-control"  name="answer">
		  						<label >답변내용</label>
							</div>
							
							<div class="col-1 d-flex align-items-center" >
								<input type="hidden" name="id" value="${blist.id }">
								<button type="submit" class="btn btm-sm btn-outline-dark">작성</button>
							</div>
						</c:if>
					
						<c:if test="${blist.state==1 }">
							<div class="form-floating col">
		  						<input type="text" class="form-control" value="${blist.answer }" name="answer" disabled="disabled">
		  						<label >답변내용</label>
							</div>
						</c:if>
					</div>
					</form>
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
                	
		<form id="moveForm" action="boardList" method="get" >
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</div>
</main>
</body>
</html>
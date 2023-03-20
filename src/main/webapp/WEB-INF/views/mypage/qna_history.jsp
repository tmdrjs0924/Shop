<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      padding:50px 0 0 230px;
      border-left:1px solid black;
   }
   #qna_table {
   		width:1000px;
   		font-size:14px;
   		font-weight:900;
   }
   #qna_table caption {
   		 text-align:left;
   }
   #qna_table th {
   		padding-top:20px;
   		border-bottom:2px solid black;
   }
   #qna_table td {
   		padding:20px 0;
   		border-bottom:1px solid lightgrey;
   }
   #qna_table .state {
   		width:180px;
   		text-align:center;
   }
   #qna_table .content {
   		width:450px;
   		padding-left:40px;
   }
   #qna_table .writeday {
   		width:250px;
   		text-align:center; 
   }
   #qna_table .arrow {
   		text-align:right;
   }
   #qna_table .ans_content {
   		padding-left:45px;
   }
   #qna_table .answer {
   		display:none;
   }
   #qna_table .question {
   		cursor:pointer;
   }
   #section2 #paging {
			margin:auto;
			margin:50px 0;
			font-size:16px;
			font-weight:700;
			color:#D5D5D5;
			text-align:center;
			display:flex;
			justify-content:center;
			align-items:center;
			position:relative;
			bottom:0px;
			padding-left:180px;
		}
		#section2 #paging a {
			padding:10px 12px;
		}
 </style>
 <script>
 		function toggle(n){
 			var answer=document.getElementsByClassName("answer");
 			if(answer[n].style.display=="none")
 				answer[n].style.display="table-row";
 			else
 				answer[n].style.display="none";
 		}
 </script>
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
			<table id="qna_table">
				<caption><h2>문의내역</h2></caption>
				<tr>
					<th>답변상태</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${qlist}" var="qvo" varStatus="sts">
				<tr class="question" onclick="toggle(${sts.index})">
					<td class="state">
						<c:if test="${qvo.state==0}"><span style="color:lightgrey">답변예정</span></c:if>
						<c:if test="${qvo.state==1}"><span>답변완료</span></c:if>
					</td>
					<td class="content">${qvo.content}</td>
					<td class="writeday">${qvo.writeday}</td>
				</tr>
				<tr class="answer">
				<c:if test="${!empty qvo.answer}">
					<td class="arrow"><span class="material-symbols-rounded">subdirectory_arrow_right</span></td>
					<td class="ans_content"><div style="color:maroon;margin-bottom:5px;">관리자답변</div>${qvo.answer}</td>
					<td></td>
				</c:if>
				<c:if test="${empty qvo.answer}">
				</c:if>
				</tr>
				</c:forEach>
			</table>
			
			<div id="paging">
				<c:if test="${pstart==1}">
					<a>
						<span class="material-symbols-rounded">arrow_back</span>
					</a>
				</c:if>
				<c:if test="${pstart!=1}">
					<a href="qna_history?page=${pstart-1}&rnum=${rnum}&pCode=${pCode}">
						<span class="material-symbols-rounded">arrow_back</span>
					</a>
				</c:if>
				<c:forEach begin="${pstart}" end="${pend}" var="i">
					<c:if test="${page==i}">
						<a href="qna_history?page=${i}&rnum=${rnum}&pCode=${pCode}" style="color:#000000;">${i}</a>
					</c:if>
					<c:if test="${page!=i}">
						<a href="qna_history?page=${i}&rnum=${rnum}&pCode=${pCode}" style="color:#CCCCCC;">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pend!=total}">
					<a href="qna_history?page=${pend+1}&rnum=${rnum}&pCode=${pCode}">
						<span class="material-symbols-rounded">arrow_forward</span>
					</a>
				</c:if>
				<c:if test="${pend==total}">
					<a>
						<span class="material-symbols-rounded">arrow_forward</span>
					</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
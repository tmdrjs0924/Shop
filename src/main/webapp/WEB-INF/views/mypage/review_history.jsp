<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      padding:50px 0 0 210px;
      border-left:1px solid black;
   }
   #review_table {
   		width:1000px;
   		margin:auto;
   		font-size:14px;
   		font-weight:900;
   }
   #review_table caption {
   		 text-align:left;
   }
   #review_table th {
   		padding-top:20px;
   		border-bottom:2px solid black;
   }
   #review_table td {
   		padding:20px 0;
   		border-bottom:1px solid lightgrey;
   }
   #review_table .img_box {
   		width:180px;
   		text-align:center; 
   }
   #review_table .content {
   		width:620px;
   		padding-left:40px;
   }
   #review_table .content div:first-child {
   		color:lightgrey;
   }
   #review_table .content div:nth-child(2) {
   		margin:12px 0;
   }
   #review_table .writeday {
   		width:200px;
   		text-align:center; 
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
			padding-left:210px;
		}
		#section2 #paging a {
			padding:10px 12px;
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
			<table id="review_table">
				<caption><h2>나의 후기</h2></caption>
				<tr>
					<th>별점</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${rlist}" var="rvo">
				<tr>
					<td class="img_box">
						<c:forEach begin="1" end="${rvo.star}">
							<img src="../resources/pro/star2.png" width="15" height="15">
						</c:forEach>
					</td>
					<td class="content">
						<div>[${rvo.pName}]</div>
						<div>${rvo.content}</div>
						<div>
							<c:forEach items="${rvo.images}" var="image">
								<img src="../resources/upload/${image}" width="40" height="40">
							</c:forEach>
						</div>
					</td>
					<td class="writeday">${rvo.writeday}</td>
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
					<a href="review_history?page=${pstart-1}&rnum=${rnum}&pCode=${pCode}">
						<span class="material-symbols-rounded">arrow_back</span>
					</a>
				</c:if>
				<c:forEach begin="${pstart}" end="${pend}" var="i">
					<c:if test="${page==i}">
						<a href="review_history?page=${i}&rnum=${rnum}&pCode=${pCode}" style="color:#000000;">${i}</a>
					</c:if>
					<c:if test="${page!=i}">
						<a href="review_history?page=${i}&rnum=${rnum}&pCode=${pCode}" style="color:#CCCCCC;">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pend!=total}">
					<a href="review_history?page=${pend+1}&rnum=${rnum}&pCode=${pCode}">
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
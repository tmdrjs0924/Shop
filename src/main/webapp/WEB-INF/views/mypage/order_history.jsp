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
      padding:50px 0 0 200px;
      border-left:1px solid black;
   }
		section {
			width:1000px;
			min-height:500px;
			margin:auto;
			padding:30px 0;
			border-radius:40px;
			background:white;
		}
		section #caption {
			text-align:left;
		}
		section #history {
			border-collapse:collapse;
			margin:auto;
			width:1000px;
		}
		section #history th {
			border-top:2px solid black;
			border-bottom:2px solid black;
		}
		section #history tr:last-child td {
			border-bottom:2px solid black;
		}
		section .title {
			height:33px;
			line-height:33px;
		}
		section .title .left {
			text-align:left;
			text-indent:5px;
		}
		section .title .right {
			width:150px;
			text-align:center;
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
		section .content .left{
			width:150px;
			text-align:center;
			cursor:pointer;
		}
		section .content .center{
			text-indent:10px;
			cursor:pointer;
		}
		section .content .img {
			width:130px;
			height:130px;
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
		section .btn {
			text-align:right;
			margin-bottom:100px;
		}
		section .btn span {
			margin:auto;
			line-height:50px;
			padding:5px 15px;
			border:2px solid black;
			border-radius:5px;
			background:white;
			font-size:13px;
			font-weight:900;
			cursor:pointer;
			opacity:0.8;
		}
	</style>
	<script>
		$(function(){
			// 스크롤 위치를 세션 스토리지에 저장
			window.addEventListener('scroll', function() {
			  sessionStorage.setItem('scrollPosition', window.scrollY);
			});
			// 세션 스토리지에 저장된 스크롤 위치를 불러옴
			var scrollPosition = sessionStorage.getItem('scrollPosition');
			// 스크롤 위치를 조정
			if (scrollPosition !== null) {
			  window.scrollTo(0, scrollPosition);
			}
		});
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
			<section>
				<div id="caption"><h2>주문/결제내역</h2></div>
				<c:forEach items="${olist}" var="ovo">
					<table id="history">
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
						<tr class="title">
							<th colspan="2" class="left">
								주문번호(${ovo.orderNumber}) - ${state}
								<span class="detail" onclick="location='order_detail?orderNumber=${ovo.orderNumber}'">주문상세 ></span>
							</th>
							<th class="right">${ovo.orderDate} 결제</th>
						</tr>
						
						<c:forEach items="${ovo.plist}" var="pvo" varStatus="sts">
						<tr class="content">
							<td class="left">
								<img src="../resources/pro/${pvo.pImg1}" class="img" onclick="location='../product/content?pCode=${pvo.pCode}'">
							</td>
							<td class="center">
								<div onclick="location='../product/content?pCode=${pvo.pCode}'">${pvo.pName}</div>
								<div><fmt:formatNumber value="${pvo.pPrice-pvo.pPrice*pvo.pDc/100}" pattern="#,###"/>원</div>
							</td>
							<td class="right">
								<c:if test="${ovo.orderState==10 && pvo.rchk==0}">
									<div onclick="location='review?pCode=${pvo.pCode}&pImg1=${pvo.pImg1}&pName=${pvo.pName}&pSize=${pvo.pSize}&index=${sts.index}&id=${ovo.id}'">구매후기</div>
								</c:if>
								<c:if test="${rchk!=0}"></c:if>
							</td>
						</tr>
						</c:forEach>
						
					</table>
					<div class="btn">
						<c:if test="${ovo.orderState<=1}">
							<span onclick="location='state_change?id=${ovo.id}&orderState=4'">취소신청</span>
						</c:if>
						<c:if test="${ovo.orderState==3}">
							<span onclick="location='state_change?id=${ovo.id}&orderState=6'">반품신청</span>
						</c:if>
						<c:if test="${ovo.orderState==3}">
							<span onclick="location='state_change?id=${ovo.id}&orderState=10'">구매확정</span>
						</c:if>
					</div>
				</c:forEach>
			</section>
		</div>
	</div>
</body>
</html>
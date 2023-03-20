<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/main/main.css" />
<script src="../resources/js/main/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
		   border-left:1px solid black;
		}
		section {
			width:1000px;
			padding:30px 0 50px 100px;
			min-height:500px;
		}
		section table {
			width:900px;
			margin:auto;
		}
		section table .checkbox {
			width:30px;
			text-align:center;
		}
		section table .all {
			font-size:13px;
			font-weight:600;
			width:200px;
		}
		section table .delete_btn {
			border:1px solid lightgrey;
			border-radius:2px;
			color:grey;
			font-weight:400;
			font-size: 12px;
			line-height:45px;
			padding:5px;
			cursor:pointer;
			margin-left:10px;
		}
		section table .coupon {
			width:250px;
		}
		section table #coupon_btn {
			border:1px solid #2ECC71;
			border-radius:2px;
			color:#2ECC71;
			font-weight:900;
			font-size: 14px;
			padding:5px 10px;
			float:right;
			cursor:pointer;
		}
		section input[type=checkbox] {
			accent-color:black;
		}
		section .first_tr td {
			border-bottom:2px solid black;
			height:50px;
		}
		section .second_tr td {
			border-bottom:1px solid lightgrey;
		}
		section table .name {
			font-weight:700;
			font-size: 15px;
		}
		section table caption {
			text-align:left;
		}
		section table .delete_icon {
			height:18px;
			margin-left:20px;
			opacity:0.3;
			border:1px solid grey;
			cursor:pointer;
		}
		section table .price {
			font-size:12px;
			color:grey;
		}
		section table .dcprice {
			font-size:14px;
			color:black;
			font-weight:600;
		}
		section table .date {
			font-size:14px;
			font-weight:600;
			color:#2ECC71;
		}
		section table .text {
			font-size:13px;
			font-weight:600;
		}
		section table .size {
			font-size:15px;
			font-weight:600;
		}
		section table .change_size {
			border:1px solid lightgrey;
			border-radius:2px;
			color:grey;
			font-weight:400;
			font-size: 12px;
			line-height:45px;
			padding:5px;
			cursor:pointer;
		}
		section table .order_btn1 {
			border:1px solid #2ECC71;
			border-radius:5px;
			color:#2ECC71;
			font-weight:600;
			font-size: 14px;
			line-height:45px;
			padding:5px 10px;
			cursor:pointer;
		}
		section table .order {
			width:150px;
			text-align:center;
		}
		section table .delivery	{
			font-size:13px;
			font-weight:600;
			color:grey;
		}
		section table .amount {
			width:18px;
			height:20px;
			outline:none;
		}
		section table #order_left {
		display:flex;
		justify-content:center;
		align-items:center;
		width:1400px;
		height:150px;
		}
		section table #order_right {
			width:300px;
			margin-left:50px;
		}
		section input[type=submit] {
			font-size:20px;
			background:#2ECC71;
			color:white;
			border-radius:10px;
			width:250px;
			height:50px;
			border:0px;
			cursor:pointer;
		}
		section input[type=submit]:disabled {
			font-size:20px;
			background:silver;
			color:white;
			border-radius:10px;
			width:250px;
			height:50px;
			border:0px;
			cursor:default;
		}
		section table .left_text {
			width:140px;
			font-size:17px;
			font-weight:600;
			text-align:center;
			padding:10px;
		}
		section table .right_text {
			width:200px;
			font-size:19px;
			font-weight:600;
			text-align:center;
			padding:10px;
		}
		section table #plus,
		section table #minus,
		section table #equal {
			width:40px;
			height:40px;
			opacity:0.2;
		}
		section table #total_price,
		section table #total_delivery {
			font-size:18px;
			font-weight:600;
			text-align:center; 
			padding:10px;
		}
		section table #total_dc {
			font-size:18px;
			font-weight:600;
			text-align:center; 
			padding:10px;
			color:red;
		}
		section table #total_pay {
			font-size:19px;
			font-weight:600;
			text-align:center; 
			padding:10px;
			color:#2ECC71;
		}
	</style>
	<script>
		//세자릿수마다 콤마
		function comma(num) {
			return Intl.NumberFormat().format(num);
		}
		
		//화면출력 시 장바구니에 있는 모든 상품의 상품가격,배송비,할인가격을 배열로 가져옴
		var Allprice=[${price}];
		var Alldelivery=[${delivery}];
		var Alldc=[${dc}];
		//수량버튼
		$(function(){
			var test=$(".amount");
			$(".amount").spinner({
				min:1,
				max:99,
				spin:function(event,ui){
					var n=test.index(this);
					var uv=ui.value;
					var id=document.getElementsByClassName("id")[n].value;
					//ajax를 통해 버튼 클릭 시 변경한 수량으로 업데이트
					var chk=new XMLHttpRequest();
					chk.onload=function(){
						var some=document.getElementsByClassName("some_select");
						var amount=document.getElementsByClassName("amount");
						var pCode=document.getElementsByClassName("pCode");
						var osize=document.getElementsByClassName("osize");
						var total_price=0;
						var total_delivery=0;
						var total_dc=0;
						var total_pay=0;
						var total_code="";
						var total_amount="";
						var total_osize="";
						var total_amount2=0;
						
						//수량이 변경될 때마다 총 가격들의 값들도 변경
						for(i=0;i<some.length;i++){
							if(some[i].checked){
								total_price=total_price+parseInt(Allprice[i])*amount[i].value;
								total_delivery=total_delivery+parseInt(Alldelivery[i]);
								total_dc=total_dc+parseInt(Alldc[i])*amount[i].value;
								total_amount=total_amount+amount[i].value+",";
								total_amount2=total_amount2+parseInt(amount[i].value);
							}
						}
						document.getElementById("total_price").innerText=comma(total_price)+"원";
						document.getElementById("total_delivery").innerText=comma(total_delivery)+"원";
						document.getElementById("total_dc").innerText=comma(total_dc)+"원";
						document.getElementById("total_pay").innerText=comma(total_price+total_delivery-total_dc)+"원";
						document.getElementById("total_amount").value=total_amount;
						
						//히든데이터 추가
						document.cform.total_price.value=total_price+total_delivery-total_dc;
						document.cform.total_delivery.value=total_delivery;
						document.cform.total_amount2.value=total_amount2;
					}
					chk.open("get","update_amount?amount="+uv+"&id="+id);
					chk.send();
				}
			});
		});
		
		//전체선택 시 => 일부선택 모두 체크
		function all_select(my){
			var some=document.getElementsByClassName("some_select");
			var amount=document.getElementsByClassName("amount");
			var osize=document.getElementsByClassName("osize");
			var id=document.getElementsByClassName("id");
			var pCode=document.getElementsByClassName("pCode");
			var total_price=0;
			var total_delivery=0;
			var total_dc=0;
			var total_pay=0;
			var total_id="";
			var total_code="";
			var total_amount="";
			var total_amount2=0;
			var total_osize="";
			if(my.checked){
				for(i=0;i<some.length;i++){
					some[i].checked=true;
					//배열로 가져온 상품가격,배송비,할인가격의 총 합 계산+id/pcode
					total_price=total_price+parseInt(Allprice[i])*amount[i].value;
					total_delivery=total_delivery+parseInt(Alldelivery[i]);
					total_dc=total_dc+parseInt(Alldc[i])*amount[i].value;
					total_id=total_id+id[i].value+",";
					total_code=total_code+pCode[i].value+",";
					total_amount=total_amount+amount[i].value+",";
					total_amount2=total_amount2+parseInt(amount[i].value);
					total_osize=total_osize+osize[i].value+",";
				}
			}
			else{
				for(i=0;i<some.length;i++){
					some[i].checked=false;
				}
			}
			//총 합을 화면에 출력
			document.getElementById("total_price").innerText=comma(total_price)+"원";
			document.getElementById("total_delivery").innerText=comma(total_delivery)+"원";
			document.getElementById("total_dc").innerText=comma(total_dc)+"원";
			document.getElementById("total_pay").innerText=comma(total_price+total_delivery-total_dc)+"원";
			document.getElementById("total_id").value=total_id;
			document.getElementById("total_code").value=total_code;
			document.getElementById("total_amount").value=total_amount;
			document.getElementById("total_size").value=total_osize;
			
			//히든데이터 추가
			document.cform.total_price.value=total_price+total_delivery-total_dc;
			document.cform.total_delivery.value=total_delivery;
			document.cform.total_amount2.value=total_amount2;
			
			//상품을 하나라도 선택하면 주문하기 버튼 활성화
			var n=0;
			for(i=0;i<some.length;i++){
				if(some[i].checked){
					n++;
				}
			}
			if(n==0){
				document.cform.submit_btn.disabled=true;
			}
			else{
				document.cform.submit_btn.disabled=false;
			}
		}
		
		//일부선택 모두 체크 시 => 전체선택 체크
		function some_select(){
			var some=document.getElementsByClassName("some_select")
			var all=document.getElementsByClassName("all_select");
			var amount=document.getElementsByClassName("amount");
			var osize=document.getElementsByClassName("osize");
			var id=document.getElementsByClassName("id");
			var pCode=document.getElementsByClassName("pCode");
			var n=0;
			//선택할 때마다 n값증가 선택갯수 증가
			for(i=0;i<some.length;i++){
				if(some[i].checked)
					n++;
			}
			//상품을 하나라도 선택하면 주문하기 버튼 활성화
			if(n==0){
				document.cform.submit_btn.disabled=true;
			}
			else{
				document.cform.submit_btn.disabled=false;
			}
			
			//선택갯수 최대 => 전체선택 체크박스 활성화
			if(some.length==n)
				all[0].checked=true;
			else
				all[0].checked=false;
			var total_price=0;
			var total_delivery=0;
			var total_dc=0;
			var total_pay=0;
			var total_id="";
			var total_code="";
			var total_amount="";
			var total_amount2=0;
			var total_osize="";
			for(i=0;i<some.length;i++){
				if(some[i].checked){
					total_price=total_price+parseInt(Allprice[i])*amount[i].value;
					total_delivery=total_delivery+parseInt(Alldelivery[i]);
					total_dc=total_dc+parseInt(Alldc[i])*amount[i].value;
					total_id=total_id+id[i].value+",";
					total_code=total_code+pCode[i].value+",";
					total_amount=total_amount+amount[i].value+",";
					total_amount2=total_amount2+parseInt(amount[i].value);
					total_osize=total_osize+osize[i].value+",";
				}
			}
			document.getElementById("total_price").innerText=comma(total_price)+"원";
			document.getElementById("total_delivery").innerText=comma(total_delivery)+"원";
			document.getElementById("total_dc").innerText=comma(total_dc)+"원";
			document.getElementById("total_pay").innerText=comma(total_price+total_delivery-total_dc)+"원";
			document.getElementById("total_id").value=total_id;
			document.getElementById("total_code").value=total_code;
			document.getElementById("total_amount").value=total_amount;
			document.getElementById("total_size").value=total_osize;
			
			//히든데이터 추가
			document.cform.total_price.value=total_price+total_delivery-total_dc;
			document.cform.total_delivery.value=total_delivery;
			document.cform.total_amount2.value=total_amount2;
			
		}
		//선택삭제
		function delete_cart(){
			var chk=new XMLHttpRequest();
			var id=document.getElementById("total_id").value;
			chk.onload=function(){
				location.reload();
			}
			chk.open("get",	"delete_cart?id="+id);
			chk.send();
		}
		
		//단품주문하기
		function order(n){
			var size=document.cform.total_size.value=document.getElementsByClassName("osize")[n].value;
			var amount=document.cform.total_amount.value=document.getElementsByClassName("amount")[n].value;
			var code=document.cform.total_code.value=document.getElementsByClassName("pCode")[n].value;
			if(size.length==0){
				alert("사이즈를 선택하세요");
				false;
			}
			else
				location="../order/order?total_code="+code+"&total_amount="+amount+"&total_size="+size;
		}
		//onsubmit check()
		function check(){
			var some=document.getElementsByClassName("some_select");
			var size=document.getElementsByClassName("osize");
			for(i=0;i<some.length;i++){
				if(size[i].value.length==0){
					alert("사이즈를 선택하세요");
					return false;
				}
			}
		}
		function sizechg_popup(id,index){
			var popX=(window.screen.width/2)-(600/2);
			var popY=(window.screen.height/2)-400;
			window.open('change_size?id='+id+'&index='+index,'','width=600,height=400,left='+popX+',top='+popY);
		}
		
		function selectOrder(my) {
			var selectCheck=document.getElementsByClassName("some_select");
			selectCheck[my].checked = true;
			some_select();
			document.cform.submit();
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
			<section>
				<form name="cform" method="post" action="../order/order" onsubmit="return check()">
					<input type="hidden" id="total_id">
					<input type="hidden" name="total_code" id="total_code">
					<input type="hidden" name="total_amount" id="total_amount">
					<input type="hidden" name="total_size" id="total_size">
					<input type="hidden" name="total_delivery">
					<input type="hidden" name="total_price">
					<input type="hidden" name="total_amount2">
					<table>
						<caption><h2>장바구니</h2></caption>
						<tr class="first_tr">
							<td class="checkbox"><input type="checkbox" class="all_select" onclick="all_select(this)"></td>
							<td colspan="4" class="all">전체선택 <span class="delete_btn" onclick="delete_cart()">선택삭제</span></td>
							<td><span id="coupon_btn">쿠폰받기</span></td>
						</tr>
						
						<c:if test="${empty clist}">
						<tr>
							<td colspan="6" style="font-size:18px;font-weight:900;text-align:center;border-bottom:1px solid lightgrey;padding:40px 0;height:300px">
								장바구니가 비었습니다. 원하시는 상품을 담아주세요.
							</td>
						</tr>	
						</c:if>
						<c:if test="${!empty clist}">
						<c:forEach items="${clist}" var="cvo" varStatus="sts">
						<input type="hidden" class="id" value="${cvo.id}">
						<input type="hidden" class="pCode" value="${cvo.pCode}">
						<input type="hidden" class="osize" value="${cvo.size}">
		
						<tr class="second_tr">
							<td class="checkbox"><input type="checkbox" class="some_select" onclick="some_select()"></td>
							<td align="center" style="cursor:pointer;width:150px;" onclick="location='content?pCode=${cvo.pCode}'"><img src="../resources/pro/${cvo.pImg1}" width="150" height="150"></td>
							<td width="420">
								<div class="name">
									${cvo.pName}
									<ion-icon name="close-outline" class="delete_icon" onclick="location='delete_cart?id=${cvo.id}'"></ion-icon>
								</div>
								<div>
									<span class="price"><s><fmt:formatNumber value="${cvo.pPrice}" type="number"/></s></span>
									<span class="dcprice"><fmt:formatNumber value="${cvo.pPrice-(cvo.pPrice*cvo.pDc/100)}" type="number" pattern="#,###"/>원</span>
								</div>
								<div><span class="date">${cvo.mm}.${cvo.dd}.(${cvo.day})</span> <span class="text">도착예정</span></div>
							</td>
							<td width="150">
								<div class="size">option: size(${cvo.size})</div>
								<div>
									<c:if test="${cvo.size=='OneSize'}">
									</c:if>
									<c:if test="${cvo.size!='OneSize'}">
										<span class="change_size" onclick="sizechg_popup(${cvo.id},${sts.index})">주문수정</span>
									</c:if>
								</div>
							</td>
							<td width="100" align="center">
								<input type="text" id="spinner" class="amount" name="amount" value="${cvo.amount}" readonly/>
							</td>
							<td class="order">
								<div><span class="order_btn1" onclick="selectOrder(${sts.index})">주문하기</span></div>
								<div class="delivery">
									<c:if test="${cvo.pDelivery==0}">
										무료배송
									</c:if>
									<c:if test="${cvo.pDelivery!=0}">
										배송비 <fmt:formatNumber value="${cvo.pDelivery}" type="number" pattern="#,###"/>원
									</c:if>
								</div>	
							</td>
						</tr>
			
						</c:forEach>
						</c:if>
			
						<tr>
							<td colspan="6">
								<div id="order_left">
									<div>
										<div class="left_text">선택상품금액</div>
										<div id="total_price">0원</div>
									</div>
									<div>
										<ion-icon name="add-outline" id="plus"></ion-icon>
									</div>
									<div>
										<div class="left_text">총 배송비</div>
										<div id="total_delivery">0원</div>
									</div>
									<div>
										<ion-icon name="remove-outline" id="minus"></ion-icon>
									</div>
									<div>
										<div class="left_text">할인예상금액</div>
										<div id="total_dc">0원</div>
									</div>
									<div>
										<ion-icon name="reorder-two-outline" id="equal"></ion-icon>
									</div>
									<div>
										<div class="right_text">총 주문금액</div>
										<div id="total_pay">0원</div>
									</div>
									<div id="order_right"><input type="submit" name="submit_btn" value="선택주문하기" disabled></div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</section>			
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		section {
			width:570px;
			margin:auto;
		}
		section table{
			width:570px;
			border-collapse:collapse;
			box-sizing:border-box;
		}
		section table td {
			padding:10px 0;
		}
		section tr:first-child td {
			border-top: 2px solid black;
		}
		section tr:last-child td {
			border-top: 2px solid black;
		}
		section tr:first-child td:first-child {
			border-right: 1px solid lightgrey;
		}
		section img {
			width:200px;
			height:200px;
		}
		section #name {
			font-size:20px;
			font-weight:600;
			padding-left:10px;
		}
		section #select {
			font-size:14px;
			font-weight:600;
			text-indent:10px;
		}
		section #select2 {
			font-size:14px;
			font-weight:600;
			padding-left:10px;
		}
		section #delivery {
			font-size:14px;
			font-weight:600;
			text-indent:10px;
		}
		section #delivery2 {
			font-size:14px;
			color:grey;
			font-weight:600;
			text-indent:10px;
		}
		section #btn {
			display:inline-block;
			background:black;
			color:white;
			width:160px;
			height:40px;
			border-radius:3px;
			font-size:16px;
			font-weight:700px;
			opacity:0.7;
			margin:15px 10px;
			cursor:pointer;
		}
	</style>
	<script>
		$(function(){
			document.getElementById("pSizeList").value="${cvo.size}";
			$("#pSizeList").selectmenu({width:150});
			$("#pSizeList").selectmenu({
				change:function(){
					document.cform.size.value=document.getElementById("pSizeList").value;
				}
			});
		});
		
		function change_size_ok(id){
			var size=document.cform.size.value;
			var chk=new XMLHttpRequest();
			chk.onload=function(){
				var osize=opener.document.getElementsByClassName("osize");
				var some=opener.document.getElementsByClassName("some_select");
				opener.document.getElementsByClassName("size")[${index}].innerText="option: size("+size+")";
				opener.document.getElementsByClassName("osize")[${index}].value=size;
				var total_size="";
				for(i=0;i<osize.length;i++){
					if(some[i].checked){
						total_size=total_size+osize[i].value+",";
					}
				}
				opener.document.getElementById("total_size").value=total_size;
				close();
			}
			chk.open("get", "change_size_ok?id="+id+"&size="+size);
			chk.send();
		}
	</script>
</head>
<body>
	<section>
		<form name="cform" method="post">
		<input type="hidden" name="size">
			<table>
				<caption><h3>주문수정</h3></caption>
				<tr>
					<td width="200" rowspan="5"><img src="../resources/pro/${cvo.pImg1}"></td>
					<td colspan="3"><span id="name">${cvo.pName}</span></td>
				</tr>
				<tr>
					<td id="select">옵션선택: </td> 
					<td colspan="3" id="select2">
						<select id="pSizeList">
							<c:forEach items="${cvo.pSizeList}" var="size">
							<option value="${size}">size(${size})</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr id="delivery">
					<td width="100">배송방법</td>
					<td colspan="2">택배</td>
				</tr>
				<tr id="delivery">
					<td>배송비결제</td>
					<td colspan="2">
						<c:if test="${cvo.pDelivery==0}">
							무료배송
						</c:if>
						<c:if test="${cvo.pDelivery!=0}">
							<fmt:formatNumber value="${cvo.pDelivery}" pattern="#,###"/>원 / 주문 시 결제
						</c:if>
						 
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3" id="delivery2">제주, 도서지역 3,000원 추가</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="button" value="확 인" onclick="change_size_ok(${cvo.id})" id="btn">
						<input type="button" value="취 소" onclick="window.close()" id="btn">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>
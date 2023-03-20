<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
	<style>
		section {
			width:550px;
			margin:auto;
			margin-left:30px;
		}
		#bwt {
			font-family: 'Noto Sans KR', sans-serif;
			font-size:15px;
			width:520px;
		}
		#bwt #left {
			width:100px;
			vertical-align:top;
		}
		#bwt #right {
			width:420px;
		}
		#bwt caption {
			text-align:left;
		}
		#bwt input[type=radio], #bwt input[type=checkbox] {
			accent-color:black;
		}
		#bwt #title {
			width:300px;
			height:26px;
			outline:none;
			border:1px solid grey;
			opacity:0.7;
			border-radius:2px;
			text-indent:3px;
		}
		#bwt #bimil {
			padding-left:15px;
		}
		#bwt #content {
			width:400px;
			height:250px;
			outline:none;
			border:1px solid grey;
			opacity:0.7;
			border-radius:2px;
			padding:5px;
		}
		#bwt ul {
			padding-left:5px;
			margin:0px;
		}
		#bwt ul li {
			list-style:"- ";
			font-size:14px;
			color:grey;
		}
		#bwt th {
			text-align:left;
			font-size:15px;
		}
		#bwt #btn {
			width:150px;
			height:33px;
			border:none;
			background:black;
			color:white;
			opacity:0.8;
			font-size:14px;
			margin-top:20px;
			border-radius:3px;
			cursor:pointer;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	function check(){
		var uform=document.uform;
		if(uform.sort.value==""){
			alert("문의유형을 선택하세요");
			return false;
		}
		if(uform.title.value.trim()==""){
			alert("제목을 입력하세요");
			return false;
		}
		if(uform.content.value.trim()==""){
			alert("내용을 입력하세요");
			return false;
		}
		else
			return true;
	}
	function qna_update_ok(){
		if(check()){
			var chk=new XMLHttpRequest();
			var id=document.uform.id.value;
			var sort=document.uform.sort.value;
			var title=document.uform.title.value;
			var content=document.uform.content.value;
			var bimil=document.uform.bimil;
			if(bimil.checked)
				bimil=1;
			else
				bimil=0;
			chk.onload=function(){
				opener.location.reload();
				close();
			}
			chk.open("get", "qna_update_ok?id="+id+"&sort="+sort+"&title="+title+"&content="+content+"&bimil="+bimil);
			chk.send();
		}
	}
	</script>
	<script>
		window.onload=function(){
			document.uform.sort[${bvo.sort}].checked=true;
			if(${bvo.bimil}==1)
			document.uform.bimil.checked=true;
		}
	</script>
</head>
<body>
	<section>
		<form name="uform" id="uform">
			<input type="hidden" name="id" value="${bvo.id}">
			<table id="bwt">
				<caption><h2>상품문의</h2></caption>
				<tr style="font-size:15px;">
					<td><img src="../resources/pro/${pvo.pImg1}" width="100" height="100"></td>
					<td>
						<div>${pvo.pName}</div>
						<c:if test="${pvo.pPrice==pvo.pPrice-pvo.pPrice*pDc/100}"></c:if>
						<c:if test="${pvo.pPrice!=pvo.pPrice-pvo.pPrice*pDc/100}">
							<div><s><fmt:formatNumber value="${pvo.pPrice}" pattern="#,###"/></s></div>
						</c:if>
						<div><fmt:formatNumber value="${pvo.pPrice-pvo.pPrice*pDc/100}" pattern="#,###"/>원</div>
					</td>
				</tr>
				<tr>
					<td id="left">문의유형</td>
					<td id="right">
						<input type="radio" name="sort" value="0">사이즈
						<input type="radio" name="sort" value="1">배송
						<input type="radio" name="sort" value="2">재입고
						<input type="radio" name="sort" value="3">상품상세문의
						<ul>
							<li>
								클레임(교환/환불/취소)관련 문의는 마이페이지 > 1:1 문의에서 문의 바랍니다.<p>
							</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td id="left">제목</td>
					<td>
						<input type="text" name="title" id="title" placeholder="15자 이내 입력" maxlength="15" value="${bvo.title}">
						<span id="bimil"><input type="checkbox" name="bimil" value="1"> 비밀글 </span>
						<p>
					</td>
				</tr>
				<tr>
					<td id="left">내용</td>
					<td><textarea name="content" id="content" placeholder="내용 입력">${bvo.content}</textarea></td>
				</tr>
				<tr>
					<th colspan="2">상품문의 안내</th>
				</tr>
				<tr>
					<td colspan="2">
						<ul>
							<li>상품문의는 재입고, 사이즈, 배송 등 상품에 대하여 브랜드 담당자에게 문의하는 게시판입니다.</li>
							<li>욕설, 비방, 거래 글, 분쟁 유발, 명예훼손, 허위사실 유포, 타 쇼핑몰 언급,광고성 등의 부적절한 게시글은 금지합니다.</li>
							<li>주문번호, 연락처, 계좌번호 등의 개인 정보 관련 내용은 공개되지 않도록 비밀글로 문의해 주시기 바랍니다.</li>
							<li>공개 글로 인한 개인 정보 노출 피해는 무신사 스토어가 책임지지 않습니다.</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정하기" onclick="qna_update_ok()" class="submit" id="btn">
						<input type="button" value="취소" onclick="window.close()" id="btn">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
</body>
</html>
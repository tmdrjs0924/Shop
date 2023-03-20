<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function getCate2(cate1Code) {
		var chk = new XMLHttpRequest();
		chk.onload=function() {
			//alert(decodeURI(chk.responseText));
			document.product.cate2.innerHTML=decodeURI(chk.responseText);
		}
		chk.open("get","getcate2?cate1Code="+cate1Code)
		chk.send();
	}
	
	function getCate3(imsi) {
		var cate1Code = document.product.cate1.value;
		var cate2Code = cate1Code+imsi;
		
		//var imsi2 = document.product.cate3.value;
		//var cate3Code = cate2Code+imsi;
		var chk = new XMLHttpRequest();
		chk.onload=function() {
			//alert(decodeURI(chk.responseText));
			document.product.cate3.innerHTML=decodeURI(chk.responseText);
		}
		chk.open("get","getcate3?cate2Code="+cate2Code)
		chk.send();
	}
	
	function getPcode() {
		var c1 = document.product.cate1.value;
		var c2 = document.product.cate2.value;
		var c3 = document.product.cate3.value;
		var imsi = c1+c2+c3;
		var chk = new XMLHttpRequest();
		chk.onload=function()
		   {
			   //alert(chk.responseText);
			  var num=chk.responseText;
			  
			  if(num.length==1)
				  num="00"+num;
			  else if(num.length==2)
			             num="0"+num;
			  
			  document.product.pCode.value="p"+imsi+num;
		   }
		   chk.open("get","getpcode?imsi="+imsi);
		   chk.send();
	}
	
	
</script>
</head>
<body>
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">상품 관리</h1>
	</div>
	<h4 class="pt">상품 등록</h4>
          
	<div class="container">
	<form method="post" name="product" action="productInsertAction" enctype="multipart/form-data">
		<div class="row">
			<div class="col-2">판매상태</div>
			<div class="col">
				<input type="radio" class="form-check-input" value="0" name="pState" checked>판매함
				<input type="radio" class="form-check-input" value="1" name="pState">판매안함
			</div>
		</div>
		
		<div class="row">
			<div class="col-2 align-self-center">카테고리</div>
			
			<div class="col-2">
				<select class="form-select" name="cate1" onchange="getCate2(this.value)">
					<option>대분류</option>
					<c:forEach items="${cate1 }" var="c1">
                		<option value="${c1.cate1Id}"> ${c1.cate1Name} (${c1.cate1Id}) </option>
                	</c:forEach>
                </select>
			</div>
			
			<div class="col-2">
				<select class="form-select" name="cate2" onchange="getCate3(this.value)"></select>
			</div>
			
			<div class="col-2">
				<select class="form-select" name="cate3" onchange="getPcode()"></select>
			</div>
			<div class="col-2">
				<input class="form-control" type="text" name="pCode">
			</div>
		</div>
				
		<div class="row">
			<div class="col-2">상품명</div>
			<div class="col">
				<input class="form-control" type="text" name="pName">
			</div>
		</div>
		<div class="row">
			<div class="col-2">가격</div>
			<div class="col">
				<input class="form-control" type="text" name="pPrice">
			</div>
		</div>
		<div class="row">
			<div class="col-2">할인율</div>
			<div class="col">
				<input class="form-control" type="text" name="pDc">
			</div>
		</div>
		<div class="row">
			<div class="col-2">적립률</div>
			<div class="col">
				<input class="form-control" type="text" name="pMile">
			</div>
		</div>
		<div class="row">
			<div class="col-2">수량</div>
			<div class="col">
				<input class="form-control" type="text" name="pInven">
			</div>
		</div>
		
		<div class="row">
			<div class="col-2">사이즈</div>
			<div class="col">
				<input class="form-control" type="text" name="pSize" placeholder="콤마(,)를 이용하여 구분하세요. 예) S,M,L,XL">
			</div>
		</div>
		
		<div class="row">
			<div class="col-2">대표이미지</div>
			<div class="col">
				<input class="form-control" type="file" name="pImg1">
			</div>
		</div>
		<div class="row">
			<div class="col-2">추가이미지</div>
			<div class="col">
				<input class="form-control" type="file" name="pImg2">
			</div>
		</div>
		<div class="row">
			<div class="col-2">상세설명</div>
			<div class="col">
				<input class="form-control" type="file" name="pImg3">
			</div>
		</div>
		<div class="row text-center">
			<div class="col">
				<input class="btn btn-primary" type="submit" value="상품등록">
			</div>
		</div>
	</form>
	</div>
</main>
</body>
</html>
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
.container{
	max-width: 600px;
	margin: auto;
}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//우편번호 찾기 
function juso_search()
{
  new daum.Postcode({
      oncomplete: function(data) {
        if (data.userSelectedType === 'R') {
            addr = data.roadAddress;
        } else {
            addr = data.jibunAddress;
        }
      
        document.memberUpdate.zip.value = data.zonecode;
        document.memberUpdate.juso.value = addr;

        document.memberUpdate.juso_etc.focus();
    }
  }).open();
}


</script>
</head>
<body>
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 	
 	<div class="d-flex pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">회원 상세정보</h1>
	</div>
	
	<div class="container">
	<form method="post" action="memberUpdate" name="memberUpdate">
		<input type="hidden" name="id" value="${mvo.id }">
		<div class="form-floating mb-2">
  			<input type="text" class="form-control" id="userid" name="userid" value="${mvo.userid }" disabled="disabled">
  			<label for="userid">아이디</label>
		</div>
		<div class="form-floating mb-2">
  			<input type="text" class="form-control" id="name" name="name" value="${mvo.name }">
  			<label for="name">이름</label>
		</div>
		<div class="form-floating mb-2">
  			<input type="tel" class="form-control" id="phone" name="phone" value="${mvo.phone }">
  			<label for="phone">전화번호</label>
		</div>
		<div class="form-floating mb-2">
  			<input type="email" class="form-control" id="email" name="email" value="${mvo.email }">
  			<label for="email">이메일</label>
		</div>
		<div class="row mb-2">
			<div class="col-auto">
				<div class="form-floating">
					<input type="text" class="form-control" id="zip" name="zip" value="${mvo.zip }" readonly>
		  			<label for="zip">우편번호</label>
				</div>
			</div>
			<div class="col-auto align-self-center">
	  			<span class="btn btn-dark" onclick="juso_search()">검색</span>
  			</div>
		</div>
		<div class="form-floating mb-2">
  			<input type="text" class="form-control" id="juso" name="juso" value="${mvo.juso }" readonly>
  			<label for="juso">주소</label>
		</div>
		<div class="form-floating mb-2">
  			<input type="text" class="form-control" id="juso_etc" name="juso_etc" value="${mvo.juso_etc }">
  			<label for="juso_etc">상세주소</label>
		</div>
		<div class="form-floating mb-2">
  			<input type="text" class="form-control" id="point" name="point" value="${mvo.point }">
  			<label for="point">포인트</label>
		</div>
		
		<div class="mb-2">
  			<select class="form-select" name ="rank" id="rank">
  				<c:choose>
    				<c:when test="${mvo.rank == 0}">
      					<option value="0" selected>일반회원</option>
      					<option value="1" >실버회원</option>
      					<option value="2" >골드회원</option>
      					<option value="3" >다이아회원</option>
    				</c:when>
    				<c:when test="${mvo.rank == 1}">
      					<option value="0" >일반회원</option>
      					<option value="1" selected >실버회원</option>
      					<option value="2" >골드회원</option>
      					<option value="3" >다이아회원</option>
    				</c:when>
    				<c:when test="${mvo.rank == 2}">
      					<option value="0" >일반회원</option>
      					<option value="1" >실버회원</option>
      					<option value="2" selected >골드회원</option>
      					<option value="3" >다이아회원</option>
    				</c:when>
    				<c:when test="${mvo.rank == 3}">
      					<option value="0" >일반회원</option>
      					<option value="1" >실버회원</option>
      					<option value="2" >골드회원</option>
      					<option value="3" selected>다이아회원</option>
    				</c:when>
  				</c:choose>
				</select>
		</div>
		
		<div class="text-center">
			<input class="btn btn-dark" type="submit" value="수정">
		</div>
	</form>	
	</div>
</main>
</body>
</html>
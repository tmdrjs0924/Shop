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
		document.category.cate1Code.value=cate1Code;
		var chk = new XMLHttpRequest();
		chk.onload=function() {
			//alert(decodeURI(chk.responseText));
			document.category.cate2.innerHTML=decodeURI(chk.responseText);
		}
		chk.open("get","getcate2?cate1Code="+cate1Code)
		chk.send();
	}
	
	function getCate3(imsi) {
		var cate1Code = document.category.cate1.value;
		var cate2Code = cate1Code+imsi;
		document.category.cate2Code.value=cate2Code;
		
		var chk = new XMLHttpRequest();
		chk.onload=function() {
			//alert(decodeURI(chk.responseText));
			document.category.cate3.innerHTML=decodeURI(chk.responseText);
		}
		chk.open("get","getcate3?cate2Code="+cate2Code)
		chk.send();
	}
</script>
</head>
<body>
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">카테고리 관리</h1>
          </div>

          <h4 class="pt">카테고리 등록</h4>
          <div class="container">
            <form method="post" name="category" id="categoryInsert">
            <input type="hidden" name="cate1Code">
            <input type="hidden" name="cate2Code">
              <div class="row">
                <div class="col-2 align-self-center">대분류</div>
                <div class="col-2">
                	<select class="form-select" name="cate1" onchange="getCate2(this.value)">
                		<option>대분류</option>
                		<c:forEach items="${cate1 }" var="c1">
                			<option value="${c1.cate1Id}"> ${c1.cate1Name} (${c1.cate1Id}) </option>
                		</c:forEach>
                	</select>
                </div>
                <div class="col-2"><input class="form-control" type="text" name="cate1Id" placeholder="대분류 아이디" /></div>
                <div class="col-2"><input class="form-control" type="text" name="cate1Name" placeholder="대분류 이름" /></div>
                <div class="col-2"><input id="category1Submit" class="btn btn-outline-primary" type="button" value="대분류 등록" /></div>
              </div>
              <div class="row">
                <div class="col-2 align-self-center">중분류</div>
                <div class="col-2">
                  <select class="form-select" name="cate2" onchange="getCate3(this.value)">
                  </select>
                </div>
                
                <div class="col-2"><input class="form-control" type="text" name="cate2Id" placeholder="중분류아이디" /></div>
                <div class="col-2"><input class="form-control" type="text" name="cate2Name" placeholder="중분류 이름" /></div>
                <div class="col-2"><input id="category2Submit" class="btn btn-outline-primary" type="button" value="중분류 등록" /></div>
              </div>
              <div class="row">
                <div class="col-2 align-self-center">소분류</div>
                <div class="col-2">
                  <select class="form-select" name="cate3">
                  </select>
                </div>
                <div class="col-2"><input class="form-control" type="text" name="cate3Id" placeholder="소분류 아이디" /></div>
                <div class="col-2"><input class="form-control" type="text" name="cate3Name" placeholder="소분류 이름" /></div>
                <div class="col-2"><input id="category3Submit" class="btn btn-outline-primary" type="button" value="소분류 등록" /></div>
              </div>
            </form>
          </div>
        </main>
   <script>
   $(function(){
	   //대분류 등록
	   $('#category1Submit').click(function() {
		   $('#categoryInsert').attr('action','../admin/cate1_insert');
		   $('#categoryInsert').submit();
	   });
	   //중분류 등록
	   $('#category2Submit').click(function() {
		   $('#categoryInsert').attr('action','../admin/cate2_insert');
		   $('#categoryInsert').submit();
	   });
	   //소분류 등록
	   $('#category3Submit').click(function() {
		   $('#categoryInsert').attr('action','../admin/cate3_insert');
		   $('#categoryInsert').submit();
	   });
   });
   </script>
</body>
</html>
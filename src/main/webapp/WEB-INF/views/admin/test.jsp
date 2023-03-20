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
	main {
	margin-left: 300px;
	width: 1400px;
	}
	main div {
		border: 1px solid black;
		padding: 5px;
	}
	
	main span {
		border: 1px solid grey;
		padding: 3px;
	}
</style>
</head>
<body>
	<main>
	<div>
 	<c:forEach items="${olist }" var="olist">
 		<div>${olist.orderNumber }</div>
 		<div>
 			<c:forEach items="${olist.plist }" var="plist">
 				<div>
 					<span>${plist.pImg1 }</span>
 					<span>상품이름${plist.pName }</span>
 					<span>사이즈${plist.pSize }</span> 
 					<span>${plist.amount }개</span>
 				</div>
	 		</c:forEach>
	 		
 		</div>
 	</c:forEach>
 	</div>
 	</main>
</body>
</html>
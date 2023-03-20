<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      body {
        margin: 0px;
        box-sizing: border-box;
      }
      
      a{
      	text-decoration: none;
      	color: black;
      }
      
      #shipping {
      max-width: 1400px;
      margin: auto;
      }
      
      .shipping__list{
      	margin-bottom: 5px;
      }
      
      .shipping__top,
      .shipping__title,
      .shipping__list {
        display: flex;
        justify-content: space-between;
      }

      .shipping__top {
        background-color: salmon;
        color: white;
        padding: 10px;
        margin-bottom: 50px;
      }

      .shipping__title {
        width: 90%;
        padding: 20px;
        margin: auto;
        border-top: 1px solid black;
        font-weight: bold;
        text-align: center;
      }

      .shipping__list {
        width: 90%;
        margin: auto;
        border-top: 1px solid lightgray;
        border-bottom: 1px solid lightgray;
        background-color: rgb(244, 244, 244);
        padding: 10px;
        font-size: 14px;
        align-items: center;
        text-align: center;
      }

      .shipping__title__name,
      .shipping__list__name {
        width: 20%;
      }
      .shipping__title__address,
      .shipping__list__address {
        width: 50%;
      }
      .shipping__title__phone,
      .shipping__list__phone {
        width: 25%;
      }
      .shipping__title__select,
      .shipping__list__select {
        width: 5%;
      }

      .shipping__list__address {
        text-align: left;
        padding-left: 2px;
      }

      .shipping__page {
        padding: 20px;
        text-align: center;
      }

      .shipping__bottom {
        margin: auto;
        text-align: center;
        border: 1px solid lightgray;
        width: 50px;
        padding: 5px;
      }

      .btn {
        border: 1px solid salmon;
        padding-top: 3px;
        padding-bottom: 3px;
        width: 80px;
        margin: auto;
        margin-top: 1px;
      }
      
      .btn2 {
        border: 1px solid salmon;
        width: 50px;
        margin: auto;
        cursor: pointer;
        padding: 2px;
      }
    </style>
    
    <script>
    	function selectAddress(my) {
    		window.opener.postMessage(my);
    		window.close();
    	}
    
    </script>
  </head>
  <body>
    <section id="shipping">
      <div class="shipping__top">
        <div>SANUS</div>
        <div>배송지 목록</div>
        <div>X</div>
      </div>

      <div class="shipping__title">
        <div class="shipping__title__name">배송지</div>
        <div class="shipping__title__address">주소</div>
        <div class="shipping__title__phone">연락처</div>
        <div class="shipping__title__select">선택</div>
      </div>

	<c:forEach items="${jlist }" var="jlist">
	      <div class="shipping__list">
	        <div class="shipping__list__name">
	          <div>${jlist.name }</div>
	          <c:if test="${jlist.state == 1 }">
		          <div class="btn">
	    	      		기본배송지
		          </div>
          	</c:if>
	        </div>
	        <div class="shipping__list__address">
	          <div>(${jlist.zip })</div>
	          <div>${jlist.juso }</div>
	          <div>${jlist.juso_etc }</div>
	        </div>
	        <div class="shipping__list__phone">
		        <c:set var="phoneNumber" value="${jlist.phone }" />
		        <c:out value="${fn:substring(phoneNumber, 0, 3)}-${fn:substring(phoneNumber, 3, 7)}-${fn:substring(phoneNumber, 7, 11)}" />
	        </div>
	        <div class="shipping__list__select btn2" onclick="selectAddress(${jlist.id })">
	        	선택
	        </div>
	      </div>
	      <div style="height:5px;"></div>
      </c:forEach>
      
      
      <div class="shipping__page">이전 1 다음</div>
      <div class="shipping__bottom">닫기</div>
    </section>
  </body>
</html>

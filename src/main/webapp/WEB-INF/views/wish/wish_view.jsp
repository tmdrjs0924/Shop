<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>  
    
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
      text-align:center;
      padding:50px 0 0 200px;
      border-left:1px solid black;
   }
    section {
      width:1000px;
      margin:auto;
      min-height:522px;
    }
    section table {
      border-spacing:0px;
    }
    section table td {
      height:80px;
      font-size:14px;
      border-bottom:1px solid #E4E4E4;
    }
    section table tr:first-child td {
      border-bottom:2px solid black;
    }
    section table tr:last-child td {
      border-bottom:2px solid black;
    }
    section #last {
      border-bottom:2px solid black;
    }
    section #cadd,#wdel {
      width:100px;
      height:26px;
      line-height:26px;
      border:1px solid black;
      border-radius:1em;
      text-align:center;
      background:black;
      color:white;
      cursor:pointer;
    }
    section #sdel {
      display:inline-block;
      width:90px;
      height:30px;
      border:1px solid #F6F5F5;
      border-radius:1em;
      text-align:center;
      padding-top:4px;
      background:#F6F5F5;
      color:black;
    }
    section #sdel:hover {
      background:#E5E5E5;
      cursor:pointer;
    }
    section #title:hover {
      color:#7D7D7D;
      cursor:pointer;
    }
  </style>
  <script>
    function maincheck(my)
    {
    	var csub=document.getElementsByClassName("csub");
    	var len=csub.length;
    	
    	if(my.checked)
        {
    		for(i=0;i<len;i++)
    	    {
    			csub[i].checked=true;
    	    }
    		document.getElementById("up").checked=true;
        }
    	else
    	{
    		for(i=0;i<len;i++)
    		{
    			csub[i].checked=false;
    		}
    		document.getElementById("up").checked=false;
    	}
    }
    
    function subcheck()
    {
    	var csub=document.getElementsByClassName("csub");
    	var len=csub.length;
    	
    	var n=0;
    	for(i=0;i<len;i++)
    	{
    		if(csub[i].checked)
    			n++;
    	}
    	
    	if(len==n)
    	{
    		document.getElementById("up").checked=true;
    	}
    	else
    	{
    		document.getElementById("up").checked=false;
    	}
    }
    
    function wish_del()
    {
    	var id="";
    	var csub=document.getElementsByClassName("csub");
    	var len=csub.length;
    	
    	for(i=0;i<len;i++)
    	{
    		if(csub[i].checked)
    			id=id+csub[i].value+",";
    	}
    	
    	if(id!="")
    		location="wish_del?id="+id;
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
		    <table width="900" align="center">
		      <tr>
		        <td colspan="6" align="left">
		          <div style="font-size:25px;"><b> 찜한 상품 </b></div> <p>
		          <input type="checkbox" onclick="maincheck(this)" id="up">전체선택
		          <span id="sdel" onclick="wish_del()"> 선택삭제 </span>
		        </td>
		      </tr>
		      <c:forEach items="${wlist}" var="wvo">
		      <tr >
		        <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${wvo.id}">
		        <td> <img src="../resources/pro/${wvo.pImg1}" width="100" height="100"></td>
		        <td id="title" onclick="location='../product/content?pCode=${wvo.pCode}'"> ${wvo.pName} </td>
		        <td style="padding-right:90px;"> <fmt:formatNumber value="${wvo.pPrice}" type="number"/>원 </td>
		        <td>
		          <div id="cadd" onclick="location='add_cart?pCode=${wvo.pCode}'"> 장바구니 이동 </div>
		          <div id="wdel" style="margin-top:5px;" onclick="location='wish_del?id=${wvo.id}'"> 삭제 </div>
		        </td>
		      </tr>
		      </c:forEach>
		    </table>
		  </section>
		</div>
	</div>
</body>
</html>
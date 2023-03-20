 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      text-align:center;
   }
   section div {
      margin-bottom:100px;
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
      border-bottom:2px solid #747474;
    }
    section table tr:last-child td {
      border-bottom:2px solid #747474;
      
    }
   section th {
      font-size:14px;
      height:30px;
      border-top:2px solid #747474;
   }
   section #edit {
      display:inline-block;
      width:200px;
      height:30px;
      font-size:14px;
      margin-top:30px;
      border:1px solid #747474;
      background:#747474;
      color:white;
      padding:4px;
   }
   section #edit:hover {
      display:inline-block;
      width:200px;
      height:30px;
      font-size:14px;
      margin-top:30px;
      border:1px solid black;
      background:black;
      color:white;
      padding:4px;
      cursor:pointer;
   }
      section #delbtn {
      width:190px;
      height:50px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-left:10px;
      margin-top:0px;
      margin-bottom:100px;
      font-size:15px;
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
    section #jdel {
      display:inline-block;
      width:100px;
      height:100px;
      border-left:1px dashed #747474;
      text-align:center;
      margin-top:-30px;
      padding-top:40px;
      padding-left:30px;
      margin-left:-60px;
      color:black;
      cursor:pointer;
    }
    section #jdel:hover {
      display:inline-block;
      width:100px;
      height:100px;
      border-left:1px dashed #747474;
      text-align:center;
      margin-top:-30px;
      padding-top:40px;
      padding-left:30px;
      margin-left:-60px;
      color:#747474;
      cursor:pointer;
    }
    section #jgb {
      display:inline-block;
      width:100px;
      height:100px;
      border-left:1px dashed #747474;
      text-align:center;
      padding:32px 10px 0 20px;
      margin-left:-60px;
      color:black;
      cursor:pointer;
    }
    section #jgb:hover {
      display:inline-block;
      width:100px;
      height:100px;
      border-left:1px dashed #747474;
      text-align:center;
      padding:32px 10px 0 20px;
      margin-left:-60px;
      color:#747474;
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
   
   function juso_del() {
	   
	   var id="";
   	   var csub=document.getElementsByClassName("csub");
   	   var len=csub.length;
   	
   	   for(i=0;i<len;i++)
   	   {
   		   if(csub[i].checked)
   			   id=id+csub[i].value+",";
   	   }
   	
   	   if(id!="")
		      location="juso_delete?id="+id;
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
       <caption><h2> 배송지 목록 </h2></caption>
       <tr>
         <td colspan="10" align="left">
           <input type="checkbox" onclick="maincheck(this)" id="up"> 전체선택
           <span id="sdel" onclick="juso_del()"> 선택삭제 </span>
         </td>
       </tr>
       <tr>
         <th> 선택 </th>
         <th> 아이디 </th>
         <th> 이름 </th>
         <th> 우편번호 </th>
         <th> 주소 </th>
         <th> 전화번호 </th>
       </tr>
      <c:forEach items="${jlist}" var="jvo">
       <tr align="center">
         <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${jvo.id}"> </td>
         <td> ${jvo.userid} </td>
         <td> ${jvo.name} </td>
         <td> ${jvo.zip} </td>
         <td> ${jvo.juso} ${jvo.juso_etc} </td>
         <td> ${jvo.phone} </td>
         <c:if test="${jvo.state==0}">
         <td width="170">
             <span id="jgb" onclick="location='juso_gibon?id=${jvo.id}'"> 기본배송지 변경 </span>
         </td>
         <td> <span id="jdel" onclick="location='juso_delete?id=${jvo.id}'"> 삭제 </span> </td>
         </c:if>
         <c:if test="${jvo.state==1}">
         <td width="170">
             <span id="jgb">기본배송지</span>
         </td>
         <td> <span id="jdel" onclick="location='juso_delete?id=${jvo.id}'"> 삭제 </span> </td>
         </c:if>
       </tr>
      </c:forEach>
     </table>
     
     <table width="900" align="center" style="margin-top:50px;">
       <caption style="font-size:25px;"> <h3> 기 본 배 송 지 </h3></caption>
       <tr align="center">
         <th> 아이디 </th>
         <th> 이름 </th>
         <th> 우편번호 </th>
         <th> 주소 </th>
         <th> 전화번호 </th>
         <th> </th>
         <th> </th>
       </tr>
       
     <c:forEach items="${jlist}" var="jvo">
       <c:if test="${jvo.state==1}">
       <tr align="center">
         <td> ${jvo.userid} </td>
         <td> ${jvo.name} </td>
         <td> ${jvo.zip} </td>
         <td> ${jvo.juso} ${jvo.juso_etc} </td>
         <td> ${jvo.phone} </td>
         <td> </td>
         <td> </td>
       </tr>
       </c:if>
     </c:forEach>
     </table>
     
 
     <div align="center">
       <span id="edit" onclick="location='juso_edit'"> 배송지목록 등록 </span>
     </div>
   </section>
		</div>
	</div>

</body>
</html>








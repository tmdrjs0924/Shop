<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
      rel="stylesheet"/>
  <style>
    section {
      width:1000px;
      height:700px;
      margin:auto;
      padding-top:100px;
      text-align:center;
    }
    section div {
     margin-top:12px;
   }
   section input[type=text] {
      width:300px;
      height:48px;
      border-radius:1em;
      border:1px solid #757575;
      font-size:15px;
      text-indent: 10px;
   }
   section input[type=password] {
      width:300px;
      height:48px;
      border-radius:1em;
      border:1px solid #757575;
      font-size:15px;
      text-indent: 10px;
   }
   section input[type=submit] {
      width:300px;
      height:48px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-top:5px;
   }
   section input[type=submit]:hover {
      width:300px;
      height:48px;
      background:#757575;
      border:1px solid #757575; 
      border-radius:3em;
      color:white;
      margin-top:5px;
      cursor:pointer;
   }
   section input[type=button] {
      width:300px;
      height:48px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-top:5px;
   }
   section #ss {
   		color:blue;
   }
   section #ss:hover {
     	color:red;
      cursor:pointer;
   }
   #uform ,#pform {
      display:none;
   }
   section input::placeholder {
      text-indent: 10px;
      color:#757575;
      font-size:15px;
   }
   section #join a {
      color:blue;
   }
   section #join a:hover {
      color:red;
   }
 </style>
 <script>
   <c:if test="${chk == 2}">
     alert("회원가입이 성공적으로 완료되었습니다");
   </c:if>
   <c:if test="${chk == 9}">
     alert("로그인 후 이용해주세요");
     opener.location.href="../member/login";
     window.close();
   </c:if>
   
   function view_uform()
   {
      document.getElementById("sview").innerText="";	
	   document.getElementById("uform").style.display="block";
	   document.getElementById("pform").style.display="none";
   }
   function view_pform()
   {
      document.getElementById("sview").innerText="";	
	   document.getElementById("pform").style.display="block";
	   document.getElementById("uform").style.display="none";
   }
   
   function userid_search()
   {
	   
      var chk=new XMLHttpRequest();
	   var name=document.uform.name.value;
	   var email=document.uform.email.value;
	   
	   chk.onload=function()
	   {
		   var userid=chk.responseText.trim();
		   if(userid=="1")
			 document.getElementById("sview").innerText="이름 혹은 이메일이 잘못 되었습니다 다시 확인해주세요";
		   else
	       {		   
			 document.getElementById("sview").innerText="당신의 아이디 : "+userid;
			 document.getElementById("uform").style.display="none"; 
	       }
	   }
	   
	   chk.open("get","userid_search?name="+name+"&email="+email);
	   chk.send();
   }
   
   function pwd_search()
   {
          	
      var chk=new XMLHttpRequest();
      var userid=document.pform.userid.value;
      var name=document.pform.name.value;
	   var email=document.pform.email.value;
	   
	   chk.onload=function()
	   {
		   var pwd=chk.responseText.trim();
		   if(pwd=="1")
		   {
			  document.getElementById("sview").innerText="입력 정보가 불일치 합니다";
		   }	
		   else
		   {
			  document.getElementById("sview").innerText="당신의 비밀번호 : "+pwd;
			  document.getElementById("pform").style.display="none";
		   }	   
	   }
	   
	   chk.open("get","pwd_search?userid="+userid+"&name="+name+"&email="+email);
	   chk.send();
   }
 </script>
</head>
<body> <!-- login.jsp -->
  <section>
     <form method="post" action="login_ok">
      
       <h2> 로그인 </h2>
       <div> <input type="text" name="userid" placeholder="아이디" value="ksg"> </div>
       <div> <input type="password" name="pwd" placeholder="비밀번호" value="123"> </div>
       <div> <input type="submit" value="로그인"> </div>
       
      <c:if test="${chk == 1}">
       <div id="msg" style="font-size:12px;color:red;">아이디 또는 비밀번호가 틀렸습니다.</div>
      </c:if>
     </form>
     <!-- 아이디,비밀번호 찾기 링크 -->
     <div align="center">
       <span id="ss" onclick="view_uform()"> 아이디 찾기 </span>
       &nbsp;│&nbsp;
       <span id="ss" onclick="location='pwd_find'"> 비밀번호 찾기 </span>
     </div>
     <p>
     <div id="join"> 로그인할 아이디가 없으신가요? <a href="../member/join"> 회원가입 </a></div>
     <!-- 아이디 , 비밀번호 출력 -->
     <div id="sview" align="center" style="font-size:15px; color:red;"></div>
     
     <p>
    <!-- 아이디 조회폼 -->
    <form name="uform" id="uform">
     <input type="text" name="name" placeholder="이 름"> <p>
     <input type="text" name="email" placeholder="이메일"> <p>
     <input type="button" onclick="userid_search()" value="아이디찾기">
    </form>
  </section>
</body>
</html>
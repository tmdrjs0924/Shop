<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   section {
      width:1000px;
      margin:auto;
      padding-top:50px;
      text-align:center;
   }
   section form {
   	text-align:center;
   }
   section div {
     margin-top:8px;
     padding-top:15px;
   }
   section img {
   }
   section input[type=text] {
      width:400px;
      height:48px;
      border-radius:1em;
      border:1px solid #757575;
      font-size:15px;
      text-indent: 10px;
   }
   section input[type=password] {
      width:400px;
      height:48px;
      border-radius:1em;
      border:1px solid #757575;
      font-size:15px;
      text-indent: 10px;
   }
   section input::placeholder {
      text-indent: 10px;
      color:#757575;
      font-size:15px;
   }
   section #mail_input {
   		width:250px;
   }
   section #zip,#mail_check_input_box_false {
      width:250px;
      height:48px;
   }
   section #mail_check_input_box_false {
      background-color:#eeeeee;
   }
   #mail_check_input_box_true{
    background-color:white;
   }
   section #zipbtn,.mail_check_button,.mail_check_button2 {
      width:150px;
      height:50px;
      vertical-align:bottom;
      border-radius:1em;
      border:1px solid #757575; 
      background:white;
      color:#757575;
      font-size:15px;
   }
   section #zipbtn:hover,.mail_check_button:hover,.mail_check_button2:hover {
      width:150px;
      height:50px;
      vertical-align:bottom;
      border-radius:1em;
      border:1px solid black; 
      background:black;
      color:white;
      font-size:15px;
      cursor:pointer;
   }
   section .subbtn {
      width:120px;
      height:50px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-top:0px;
      margin-bottom:100px;
   }
   section .subbtn:hover {
      width:120px;
      height:50px;
      background:#757575;
      border:1px solid #757575; 
      border-radius:3em;
      color:white;
      margin-top:0px;
      margin-bottom:100px;
      cursor:pointer;
   }
   section input[type=checkbox] {
      margin-left:40px;
      margin-top:20px;
   }
   section #ck {
      margin-left:10px;
   }
   section #ck a {
      text-decoration:none;
      color:black;
   }
   #umsg {
      position: absolute;
      margin-left:-55px;
   }
   #pmsg {
      top:585px;
      margin:auto;
   }
 </style>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" >
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
         
           document.mem.zip.value = data.zonecode;
           document.mem.juso.value = addr;

           document.mem.juso_etc.focus();
       }
     }).open();
   }
   
   $(function(){
		
		/* 인증번호 이메일 전송 */
		$('.mail_check_button').click(function () {
		    var email = $('.mail_input').val(); // 입력한 이메일
		    var cehckBox = $('.mail_check_input_box'); // 인증번호 입력란
		    var boxWrap = $('.join__mail2'); // 인증번호 입력란 박스
		    var warnMsg = $('.join__mail__chk'); // 이메일 입력 경고글
		    
		    /* 이메일 형식 유효성 검사 */
	        if (mailFormCheck(email)) {
	          warnMsg.html('이메일이 전송 되었습니다. 이메일을 확인해주세요.');
	          //warnMsg.css('display', 'inline-block');
	        } else {
	          warnMsg.html('올바르지 못한 이메일 형식입니다.');
	          //warnMsg.css('display', 'inline-block');
	          return false;
	        }
		
		    $.ajax({
		      type: 'GET',
		      url: 'mailCheck?email=' + email,
		      success: function (data) {
		        cehckBox.attr('disabled', false);
		        code = data;
		     	 }
	    	});//ajax끝
	    
		}); //인증 이메일 끝

	  /* 인증번호 비교 */
	  		var echk=0;
		$('.mail_check_button2').click(function () {
		    var inputCode = $('.mail_check_input_box').val(); // 입력코드
		    var checkResult = $('.join__mail__chk'); // 비교 결과
		    if (inputCode == code) {
				checkResult.html('인증번호가 일치합니다.');
				echk = 1;
			} else {
				checkResult.html('인증번호를 다시 확인해주세요.');
	    	}
		});	//인증번호 비교 끝
		
	});	//끝

	/* 입력 이메일 형식 유효성 검사 */
	function mailFormCheck(email) {
	  var form =
	    /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	  return form.test(email);
	}
   
   var uchk=0;  // userid의 중복여부에 따라 값을 변화
   function userid_check(userid)
   {
	   if(userid.length < 3)
	   {
		   alert("아이디의 길이는 3자 이상입니다");
	   }
	   else
	   {	   
	      var chk=new XMLHttpRequest();
	      
	      chk.onload=function()
	      {
	    	  //alert(chk.responseText.trim());
	    	  if(chk.responseText=="0")
	    	  {
	    		  document.getElementById("umsg").innerText="사용가능한 아이디";
	    		  document.getElementById("umsg").style.color="blue";
	    		  uchk=1;
	    	  }	  
	    	  else
	    	  {
	    		  document.getElementById("umsg").innerText="사용 불가능한 아이디";
	    		  document.getElementById("umsg").style.color="red";
	    		  uchk=0;
	    	  }	  
	      }
	      
	      chk.open("get","userid_check?userid="+userid);
	      chk.send();
	   }
   }
   
   var pchk=0;
   function pwd_check()
   {
	   var pwd=document.mem.pwd.value;
	   var pwd2=document.mem.pwd2.value;
	   
	   if(pwd2.length != 0)
	   {	   
	     if(pwd==pwd2)
 	     {
 		    document.getElementById("pmsg").innerText="비밀번호 일치합니다";
 		    document.getElementById("pmsg").style.color="blue";
 		    pchk=1;
 	     }	  
 	     else
 	     {
 		    document.getElementById("pmsg").innerText="비밀번호가 불일치 합니다";
 		    document.getElementById("pmsg").style.color="red";
 		    pchk=0;
 	     }
	   }
   }
   
   var echk=0;
   var chbox=0;
   function form_check() {
	   
	    var echk=document.mem.email_chk.value;
	    var chbox=document.mem.chbox.checked;
	    var inputCode=$('.mail_check_input_box').val();
	    var checkResult = $('.join__mail__chk');
	    
	    if(uchk==0)
		{
			alert("중복조회를 하세요");
			return false;
		}
		
		else if(pchk==0)
		{
			alert("비밀번호가 불일치합니다");
			return false;
		}
		
		else if(echk==0) 
		{
		 	alert("이메일 인증을 하세요");
			return false;
		} 
	    
		else if(inputCode == code) {
			
			checkResult.html('인증번호가 일치합니다.');
			echk = 1;
			return true;
		}
		else if(inputCode != code) {
			
			checkResult.html('인증번호를 다시 확인해주세요.');
			return false;
		}
	    
		else if(!chbox)
	    {
			alert("약관동의해주세요");
			return false;
	    }
		
		else 
		{
			return true;
		}
   }
   
  
 </script>
 
</head>
<body>
   <section>
     <form name="mem" method="post" action="join_ok" onsubmit="return form_check()">
       <span style="font-size:28px;"> 회원가입 </span> <p>
       <div>
         <input type="text" name="userid" placeholder="아이디" onblur="userid_check(this.value)">
         <br>
         <span id="umsg" style="font-size:15px;"> </span>
       </div>
       <div> <input type="text" name="name" placeholder="이름"> </div>
       <div> <input type="password" name="pwd" placeholder="비밀번호" onkeyup="pwd_check()"> </div>
       <div>
         <input type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwd_check()">
         <br>
         <span id="pmsg" style="font-size:15px;line-height:15px;"> </span>
       </div>
       <div>
         <input type="text" name="zip" placeholder="우편번호" id="zip" readonly>
         <input type="button" value="주소검색" onclick="juso_search()" id="zipbtn">
       </div>
       <div> <input type="text" name="juso" placeholder="주소" readonly> </div>
       <div> <input type="text" name="juso_etc" placeholder="상세주소"> </div>
       <div> <input type="text" name="phone" placeholder="전화번호"> </div>
       <div>
       	 <input type="text" name="email" placeholder="이메일" class="mail_input" id="mail_input">
         <input type="button" value="인증번호 발송" class="mail_check_button">
       </div>
       <div>
         <input type="text" name="email_chk" placeholder="인증번호 입력" class="mail_check_input_box" id="mail_check_input_box_false" disabled="disabled">
         <input type="button" value="확인" class="mail_check_button2">
         <div class="join__mail__chk"></div>
       </div>
       <p>
       
       <label>
       <span id="ck">
         <input type="checkbox" name="chbox" id="chbox"> <a><u>개인 정보 처리 방침</u> 및 <u>이용약관</u>에 동의합니다.</a>
       </span>
       </label>
       <p>
       
       <div> <input type="submit" value="계정 만들기" class="subbtn" style="font-size:15px;"> </div>
     </form>
   </section>
</body>
</html>
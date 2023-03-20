<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   section input[type=text] {
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
   section .mail_check_button,.mail_check_button2 {
      width:150px;
      height:50px;
      vertical-align:bottom;
      border-radius:1em;
      border:1px solid #757575; 
      background:white;
      color:#757575;
      font-size:15px;
   }
   section .mail_check_button:hover,.mail_check_button2:hover {
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
      width:250px;
      height:50px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-top:0px;
      margin-bottom:100px;
   }
   section .subbtn:hover {
      width:250px;
      height:50px;
      background:#757575;
      border:1px solid #757575; 
      border-radius:3em;
      color:white;
      margin-top:0px;
      margin-bottom:100px;
      cursor:pointer;
   }
   section .check_button {
      width:250px;
      height:50px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-top:0px;
   }
   section .check_button:hover {
      width:250px;
      height:50px;
      background:#757575;
      border:1px solid #757575; 
      border-radius:3em;
      color:white;
      margin-top:0px;
      cursor:pointer;
   }
 </style>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" >
 <script>
 $(function(){
		
		/* 인증번호 이메일 전송 */
		$('.mail_check_button').click(function () {
		    var email = $('.mail_input').val(); // 입력한 이메일
		    var cehckBox = $('.mail_check_input_box'); // 인증번호 입력란
		    var boxWrap = $('.join__mail2'); // 인증번호 입력란 박스
		    var warnMsg = $('.join__mail__chk'); // 이메일 입력 경고글
		    var chk=new XMLHttpRequest();
		    var userid=document.pfrm.userid.value;
		    var name=document.pfrm.name.value;
		    
		    chk.onload=function()
			   {
				   var pwd=chk.responseText.trim();
				   if(pwd=="1")
				   {
					  alert("입력 정보가 불일치 합니다");
				   }	
				   else if (mailFormCheck(email)) {
				          warnMsg.html('이메일이 전송 되었습니다. 이메일을 확인해주세요.');
				          $.ajax({
						      type: 'GET',
						      url: 'pwd_find_ok?email=' + email,
						      success: function (data) {
						        cehckBox.attr('disabled', false);
						        code = data;
						     	 }
					    	});
				          //warnMsg.css('display', 'inline-block');
				        } else {
				          warnMsg.html('올바르지 못한 이메일 형식입니다.');
				          //warnMsg.css('display', 'inline-block');
				          return false;
				        }
			   }
			   
			   chk.open("get","pwd_search?userid="+userid+"&name="+name+"&email="+email);
			   chk.send();
		});

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
	
	function form_check() {
		
		var echk=0;
	    var echk=document.pfrm.email.value;
	    var ecknum=0;
	    var ecknum=document.pfrm.email_chk.value;
	    var nchk=0;
	    var nchk=document.pfrm.name.value;
	    var ichk=0;
	    var ichk=document.pfrm.userid.value;
	    var inputCode=$('.mail_check_input_box').val();
	    var checkResult = $('.join__mail__chk');
	    
	    if(nchk==0) {
	    	
	    	alert('이름을 입력해주세요');
			return false;
	    }
	    else if(ichk==0) {
	    	
	    	alert('아이디를 입력해주세요');
			return false;
	    }
	    else if(echk==0) {
			   
			alert('메일을 입력해주세요');
			return false;
		}
	    else if(ecknum==0) {
	    	
	    	alert('인증번호 입력해주세요');
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
	    
	}
 </script>
</head>
<body>
	 <section>
     <form class="content" method="post" action="pwd_change" name="pfrm" onsubmit="return form_check()">
       <h2> 비 밀 번 호 찾 기 </h2>
       <div> <input type="text" name="name" placeholder="이름을 입력하세요"> </div>
       <div> <input type="text" name="userid" placeholder="아이디를 입력하세요"> </div>
       <div>
      	 <input type="text" name="email" placeholder="이메일을 입력하세요" class="mail_input" id="mail_input">
        <input type="button" value="인증번호 발송" class="mail_check_button">
      </div>
      <div>
        <input type="text" name="email_chk" placeholder="인증번호 입력" class="mail_check_input_box" id="mail_check_input_box_false" disabled="disabled">
        <input type="button" value="확인" class="mail_check_button2" onclick="pwd_search()">
        <div class="join__mail__chk"></div>
      </div>
      <c:if test="${chk == 1}">
      <div id="msg" style="font-size:12px;color:red;">아이디 혹은 이메일이 틀립니다 다시 확인해주세요</div>
     </c:if>
      <div> <input type="submit" value="비밀번호 변경" class="subbtn" style="font-size:15px;"> </div>
     </form>
    </section>
</body>
</html>

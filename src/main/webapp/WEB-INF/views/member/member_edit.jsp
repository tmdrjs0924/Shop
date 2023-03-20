<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     margin-top:12px;
     margin-left:120px;
   }
   section input[type=text] {
      width:400px;
      height:48px;
      border-radius:1em;
      border:1px solid #757575;
      margin-left:-130px;
      font-size:15px;
      text-indent: 10px;
   }
   section input[type=password] {
      width:400px;
      height:48px;
      border-radius:1em;
      border:1px solid #757575;
      margin-left:-130px;
      font-size:15px;
      text-indent: 10px; 
   }
   section #zip {
      width:250px;
      height:48px;
   }
   section #zipbtn {
      width:150px;
      height:50px;
      vertical-align:bottom;
      border-radius:1em;
      border:1px solid #757575; 
      background:white;
      font-size:15px;
   }
   section #zipbtn:hover {
      cursor:pointer;
      color:#757575;
   }
   section #subbtn {
      width:190px;
      height:50px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-left:-130px;
      margin-top:25px;
      margin-bottom:100px;
      font-size:15px;
   }
   section #subbtn:hover {
      width:190px;
      height:50px;
      background:#757575;
      border:1px solid #757575; 
      border-radius:3em;
      color:white;
      margin-left:-130px;
      margin-top:25px;
      margin-bottom:100px;
      font-size:15px;
      cursor:pointer;
   }
 </style>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
  {
    new daum.Postcode({
        oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.mem.zip.value = data.zonecode; // 우편번호
          document.mem.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.mem.juso_etc.focus();
      }
    }).open();
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
      <form name="mem" method="post" action="member_edit_ok" onsubmit="return form_check()">
        <h2> 회원정보 수정 </h2>
        
        <div>
           <input type="text" name="zip" placeholder="우편번호" id="zip" value="${mvo.zip}"  readonly>
           <input type="button" value="주소검색" onclick="juso_search()" id="zipbtn">
        </div>
        <div> <input type="text" name="juso" placeholder="주소" value="${mvo.juso}"  readonly> </div>
        <div> <input type="text" name="juso_etc" placeholder="상세주소" value="${mvo.juso_etc}"> </div>
        <div> <input type="text" name="phone" placeholder="전화번호" value="${mvo.phone}"> </div>
        <div> <input type="text" name="email" placeholder="이메일" value="${mvo.email}"> </div>
        <div>
        <span> <input type="submit" value="확 인" id="subbtn"> </span>
        </div>
      </form>
   </section>
		</div>
	</div>

</body>
</html>

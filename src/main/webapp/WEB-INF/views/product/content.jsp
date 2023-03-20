<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="../resources/js/product/content.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../resources/css/product/content.css">	
<style>
	body {
		margin: 0;
	}
	select {
		width: 100%; /* 원하는 너비설정 */
		padding: .8em .5em; /* 여백으로 높이 설정 */
		border: 1px solid #999;
		border-radius: 0px; /* iOS 둥근모서리 제거 */
		-webkit-appearance: none; /* 네이티브 외형 감추기 */
		-moz-appearance: none;
		appearance: none;
		text-align: left;
	}
	
	.btn {
		background-color: #000000;
		border: none;
		color: white;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		width: 350px;
	}
	#product {
		display: flex;
		width: 1200px;
		margin: auto;
	}
	
	.product__left {
		width: 600px;
	}
	
	.product__left__imgs {
		width: 600px;
	}
	
	.product__left__imgs .change-photo img {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.product__left__imgs .change-photo:nth-of-type(2) {
		display: none;
	}
	
	.product__left__imgs:hover .change-photo:nth-of-type(1) {
		display: none;
	}
	
	.product__left__imgs:hover .change-photo:nth-of-type(2) {
		display: block;
	}
	
	.product__left__imgs:hover {
		cursor: pointer;
	}
	
	.product__left__review {
		padding: 10px;
		font-size: 18px;
	}
	
	.product__right {
		width: 600px;
		padding-top:50px;
		padding-left: 40px;
		padding-right: 30px;
	}
	
	.product__right__price, .product__right__total, .product__right__etc,
		.product__right__selectProduct {
		display: flex;
		padding: 10px;
	}
	
	.product__right__price, .product__right__total, .product__right__etc,
		.product__right__selectProduct {
		justify-content: space-between;
	}
	
	.product__right__price__1 {
		text-decoration: line-through;
		color: #00C2A8;
		padding-right: 10px;
	}
	
	.product__right__price__2 {
		font-weight: bold;
		font-size: 24px;
	}
	
	.product__right__price__3 {
		color: #00C2A8;
		font-size: 24px;
	}
	
	.product__right__mile {
		color: #00C2A8;
	}
	
	.product__right__price, .product__right__title, .product__right__mile,
		.product__right__bae, .product__right__day, .product__right__option,
		.product__right__buy, .product__right__selectProduct {
		padding: 10px;
	}
	
	.product__right__price>div {
		padding: 5px;
	}
	
	.product__right__buy {
		display: flex;
		text-align: center;
		justify-content: space-between;
	}
	
	.product__right__buy img {
		
	}
	
	.product__right__buy>button {
		width: 50%;
	}
	
	.product__right__etc>div>button {
		width: 60px;
	}
	
	.product__right__total>div {
		align-self: baseline;
	}
	
	.product__right__total__price {
		font-size: 22px;
		font-weight: bold;
	}
	
	.product__right__total__inven {
		padding-left: 20px;
	}
	
	#pInven {
		width: 50px;
	}
	
	.product__right__total__price>input {
		border: none;
		outline: none;
		font-size: 24px;
		font-weight: bold;
		width: 150px;
		text-align: right;
	}
	
	.product__right__selectProduct input {
		border: none;
		outline: none;
		text-align: right;
	}
	
	#description {
		display: flex;
		width: 1200px;
		margin: auto;
	}
	
	.description__img {
		margin: auto;
	}
	
	.description__img>img {
		width: 1200px;
	}
	
	.p_num {
		width: 20px;
		text-align: center;
		height: 15px;
	}
	
	.basket__product > div {
		padding: 5px;
		margin: 5px;
	}
	
	.basket__product__sum {
		width: 95px;
	}
	
	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 10,
	  'GRAD' 0,
	  'opsz' 48
	}
	
	
	#plus,
	#minus {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 400,
	  'GRAD' 0,
	  'opsz' 48
	}
	
	body {
	    box-sizing: border-box;
	}
	
	.basket {
	    width: 100%;
	    border-top: 1px solid #e0e0e0;
	}
	
	.basket__product {
	    cursor: pointer;
	    display: flex;
	    justify-content: space-between;
	    background-color: #f4f4f4;
	    border-bottom: 1px solid #eeeeee;
	    align-items: center;
	}
	
	.basket__totalDel{
	    text-align: right;
	    margin-top: 10px;
	}
	
	.basket__total{
		padding: 10px;
		margin: 10px;
	}
	
	.basket__totalInven {
		text-align: right;
	}
	.basket__totalPrice {
	    text-align: right;
	    font-size: 24px;
	    font-weight: bold;
	}
	
	.bastket__submit{
		display: flex;
	    text-align: center;
	    justify-content: space-between;
	}
	
	.basket__product__chk {
		display: none;
	}
	
	.basket__total {
		display: flex;
		justify-content: space-between;
	}
	
	.bastket__submit__wish,
	.bastket__submit__cart{
		padding-right: 5px;
	}
	.bastket__submit__wish >img,
	.bastket__submit__cart > img{
		border: 1px solid black;
	}
	
	.updown {
		display: flex;
		align-items: center;
	}
	.product__right__name {
		font-size:20px;
		font-weight:900px;
	}
	.review__star {
		width:200px;
		height:30px;
		display:flex;
		align-items:center;
		font-size:13px;
	}
	.review__star img {
		width:20px;
		height:20px;
	}

</style>

<script>
	$(function(){
		// 스크롤 위치를 세션 스토리지에 저장
		window.addEventListener('scroll', function() {
		  sessionStorage.setItem('scrollContent', window.scrollY);
		});
		// 세션 스토리지에 저장된 스크롤 위치를 불러옴
		var scrollContent = sessionStorage.getItem('scrollContent');
		// 스크롤 위치를 조정
		if (scrollContent !== null) {
		  window.scrollTo(0, scrollContent);
		}
	});
	let imsi = 0;
	function redirect(size) {
		if(size == 0) return;
		
		imsi++;
		let selectProduct = document.getElementById("selectProduct");
		selectProduct.innerHTML = selectProduct.innerHTML+ 
			"<div class='basket__product'><div class='basket__product__chk'><input type='checkbox' name='buy' value='260' checked='' onclick='javascript:basket.checkItem();'></div><div class='basket__product__title'>"+
			"<input type='hidden' name='total_code' value='${pvo.pCode}'><input type='hidden' name='total_size' value='"+
			size +
			"'>"+
			size +"</div><div class='basket__product__price'><input type='hidden' name='p_price' id='p_price1' class='p_price' value='"+
			${pvo.pPrice - (pvo.pPrice * pvo.pDc /100) } + "'>" +
			"<fmt:formatNumber value='${pvo.pPrice - (pvo.pPrice * pvo.pDc /100) }' pattern='#,###' />원"  +
			
			"</div><div class='basket__product__inven'><div class='updown'><img src='../resources/img/remove.png' class='down' onclick='javascript:basket.changePNum("+
			imsi + ");'></img><input type='text'"+
			" name='total_amount"+
			"' id='p_num"+
			imsi +"' size='1' maxlength='2' class='p_num' value='1' onkeyup='javascript:basket.changePNum("+
			imsi + ");' readonly><img src='../resources/img/add.png' class='up' onclick='javascript:basket.changePNum("+
			imsi + ");'> </img> </div></div><div class='basket__product__sum'>"+
			"<fmt:formatNumber value='${pvo.pPrice - (pvo.pPrice * pvo.pDc /100) }' pattern='#,###' />원"  +
			
			"</div><div class='basket__product__del'><span href='javascript:void(0)' class='abutton material-symbols-outlined' onclick='javascript:basket.delItem();'>close</span></div></div>";
			
			basket.reCalc();		
			basket.updateUI();
	}
	
	
	function wish(my)
	{
		var ck;
		
		// alert(my.src.indexOf("wish.png"));
		if(my.src.indexOf("wish.png")== -1)
		{
			ck=1;
		} else {
			
			ck=2;
		}
		
		<c:if test="${userid!=null}">
		  <c:set var="chk" value="true"/>
		</c:if>
		<c:if test="${userid==null}">
		  <c:set var="chk" value="false"/>
		</c:if>
		
		if(${chk})
		{
			
			var chk=new XMLHttpRequest();
			chk.onload=function()
			{
				
				// alert(chk.responseText);
				if(chk.responseText=="0")
				{
					if(ck==1)
						my.src="../resources/img/wish.png";
					else
						my.src="../resources/img/wish2.png"
				}
				else
				{
					alert("예상하지 않은 오류");
				}
			}
			chk.open("get","wish_add?pCode=${pvo.pCode}&ck="+ck);
			chk.send();
		}
		else
		{
			location="../member/login";
		}
	}
	
	
	function cartSubmit() {
		const sizeSelect= document.querySelector('#sizeSelect').value;
		if(sizeSelect == "0") {
			alert("옵션을 선택해주세요");
			return false;
		} else {
			
			document.orderform.action='../product/add_cart';
			document.orderform.submit();
		}
	}
	
	function optionCheck() {
		const sizeSelect= document.querySelector('#sizeSelect').value;
		if(sizeSelect == "0") {
			alert("옵션을 선택해주세요");
			return false;
		}
		submit();
			
	}
	
</script>

</head>

<section id="product">
	<div class="product__left">
		<div class="product__left__imgs">
			<div class="change-photo">
				<img src="../resources/pro/${pvo.pImg1 }" />
			</div>
			<div class="change-photo">
				<img src="../resources/pro/${pvo.pImg2 }" />
			</div>
		</div>

	</div>
	
	<div class="product__right">
		<div class="product__right__title">
			<div class="product__right__name">${pvo.pName }</div>
			<div class="review__star">
				<c:if test="${star!=0}">
					<c:forEach begin="1" end="${star}">
						<img src="../resources/pro/star2.png">
					</c:forEach>
				</c:if>
				<c:if test="${rcnt==0}"></c:if>
				<c:if test="${rcnt!=0}">
					(${rcnt})
				</c:if>
			</div>
		</div>
		<div class="product__right__price">
			<div class="product__right__price__3">${pvo.pDc }%</div>
			<div>
				<span class="product__right__price__1"> <fmt:formatNumber
						value="${pvo.pPrice }" pattern="#,###" />
				</span> <span class="product__right__price__2"> <fmt:formatNumber
						value="${pvo.pPrice - (pvo.pPrice * pvo.pDc /100) }"
						pattern="#,###" />원
				</span>
			</div>
		</div>
		<div class="product__right__mile">
			기본적립
			<fmt:formatNumber value="${(pvo.pPrice - (pvo.pPrice*pvo.pDc/100)) * pvo.pMile / 100 }"
				pattern="#,###" />
			원
		</div>
		<div class="product__right__bae">
			<c:if test="${pvo.pDelivery==0}">
        		무료배송
        	</c:if>
			<c:if test="${pvo.pDelivery!=0}">
				<fmt:formatNumber value="${pvo.pDelivery}" pattern="#,###" />원
        	</c:if>


		</div>
		<div class="product__right__day">
			<c:choose>
				<c:when test="${pvo.pYoil==1}">
					<c:set var="yoil" value="일" />
				</c:when>
				<c:when test="${pvo.pYoil==2}">
					<c:set var="yoil" value="월" />
				</c:when>
				<c:when test="${pvo.pYoil==3}">
					<c:set var="yoil" value="화" />
				</c:when>
				<c:when test="${pvo.pYoil==4}">
					<c:set var="yoil" value="수" />
				</c:when>
				<c:when test="${pvo.pYoil==5}">
					<c:set var="yoil" value="목" />
				</c:when>
				<c:when test="${pvo.pYoil==6}">
					<c:set var="yoil" value="금" />
				</c:when>
				<c:when test="${pvo.pYoil==7}">
					<c:set var="yoil" value="토" />
				</c:when>
			</c:choose>

			${pvo.pDay2 } (${yoil}) 도착 예정
		</div>

		<div class="product__right__option">
			<select id="sizeSelect" onchange="redirect(this.value);" required>
				<option align="center" value="0">사이즈 선택</option>
				<c:forEach items="${pvo.pSize2 }" var="pSize">
					<option value="${pSize }">${pSize }</option>
				</c:forEach>
			</select>
		</div>

		<!-- 상품 옵션추가 -->
		<form name="orderform" id="orderform" method="post" class="orderform" action="../order/order"  onsubmit="return optionCheck()">
		<input type='hidden' name='pCode' value='${pvo.pCode}'>
		<input type='hidden' name='total_price' id="total_price">
		<input type="hidden" name='total_delivery' value="${pvo.pDelivery}">
		<input type="hidden" name='total_amount2' id="total_amount2">
		<div class="basket" id="basket">
			<div id="selectProduct"> 

			</div>

			<div class="basket__total">
				<div id="sum_p"></div>
				<div class="basket__totalInven" id="sum_p_num">
				</div>
			
				<div class="basket__totalPrice" id="sum_p_price">
				</div>
			</div>

			<div id="bastket__submit" class="bastket__submit">
				<div>
					<button type="submit" class="btn">주문하기</button>
				</div>
				
			<div id="wbtn" style="clear:both;">
					<span class="bastket__submit__wish">
					<c:if test="${wcnt==0 || wcnt==null}">
					  <img style="cursor:pointer;" src="../resources/img/wish.png" width="50" onclick="wish(this)">
					</c:if>
					<c:if test="${wcnt!=0 && wcnt!=null}">
					  <img style="cursor:pointer;" src="../resources/img/wish2.png" width="55" onclick="wish(this)">
					</c:if>
					</span>
					<span class="bastket__submit__cart">
						<img src="../resources/img/cart.png" onclick='cartSubmit()'>
					</span>
				</div>
			</div>
		</div>	
		</form>

	</div>
</section>

<section id="description">
	<div class="description__img">
		<img src="../resources/pro/${pvo.pImg3 }" />
	</div>
</section>

<style>
	#rboard {
		width:1000px;
		margin:auto;
		margin-top:100px;
		margin-bottom:100px;
	}
	#rboard #rlist {
		width:950px;
		margin:auto;
	}
	#rboard #rlist caption {
		text-align:left;
		text-indent:10px;
	}
	#rboard td {
		border-bottom:1px solid lightgrey;
		box-sizing:border-box;
		padding:20px 0;
	}
	#rboard tr:first-child {
		border-top:2px solid black;
	}
	#rboard tr:last-child {
		border-bottom:2px solid black;
	}
	#rboard .rid {
		width:200px;
		text-align:center;
		font-size:14px;
		font-weight:900;
	}
	#rboard .rname {
		width:550px;
		color:grey;
		font-size:14px;
		font-weight:900;
		opacity:0.8;
	}
	#rboard .rcontent {
		padding:40px 0;
		font-size:14px;
		font-weight:900;
	}
	#rboard .rimg {
		width:80px;
		height:80px;
		border-radius:20px;
	}
	#rboard .rday {
		width:200px;
		text-align:center;
		font-size:14px;
		font-weight:900;
	}
	#rboard #paging2 {
		padding:0px;
	}
	#rboard a {
		text-decoration:none;
		color:#BEBEBE;
		display:table-cell;
		width:35px;
		height:40px;
		margin:0px;
		border-left:1px solid #D5CFC7;
		text-align:center;
		line-height:40px;
	}
	#rboard a:hover {
		background:#ECECEC;
	}
	#rboard .timg {
		width:100px;
		height:100px;
		cursor:pointer;
	}
	#rboard #title_box{
		width:900px;
		display:flex;
		justify-content:flex-start;
		align-items:center;
		cursor:pointer;
	}
	#rboard #viewmore{
		background:rgba(200,200,200,0.1);
		width:100px;
		height:100px;
		font-size:12px;
		font-weight:900;
		display:flex;
		justify-content:center;
		align-items:center;
	}
</style>
<section id="rboard">
	<table id="rlist">
		<caption><h3>상품후기</h3></caption>
			<tr>
				<td colspan="3" align="center">
					<div onclick="view_images()" id="title_box">
							<c:forEach items="${title_img}" var="title" begin="1" end="8">
								<c:if test="${!empty title}">
									<img src="../resources/upload/${title}" class="timg">
								</c:if>
							</c:forEach>
						<div id="viewmore">더 보기</div>
					</div>
				</td>
			</tr>
			<c:forEach items="${rlist}" var="rvo">
			<tr>
				<td><div class="rid">${rvo.userid}</div></td>
				<td>
					<div class="rname">
						<div>[${rvo.pName}]</div>
						<div>
							<c:forEach begin="1" end="${rvo.star}">
								<img src="../resources/pro/star2.png" width="15" height="15">
							</c:forEach>
						</div>
					</div>
					<div class="rcontent">${rvo.content}</div>
					<div>
						<c:forEach items="${rvo.images}" var="image">
							<c:if test="${!empty image}">
								<img src="../resources/upload/${image}" class="rimg">
							</c:if>
						</c:forEach>
					</div>
				</td>
				<td><div class="rday">${rvo.writeday}</div></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="3" align="right" id="paging2">
					<c:choose>
						<c:when test="${page2==1}">
							<a><<</a>
						</c:when>
						<c:otherwise>
							<a href="content?page2=1&rnum2=${rnum2}&pCode=${pvo.pCode}"><<</a>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${pstart2==1}">
							<a><</a>
						</c:when>
						<c:otherwise>
							<a href="content?page2=${pstart2-1}&rnum2=${rnum2}&pCode=${pvo.pCode}"><</a>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="i" begin="${pstart2}" end="${pend2}">
						<c:choose>
							<c:when test="${page2==i}">
								<a href="content?page2=${i}&rnum2=${rnum2}&pCode=${pvo.pCode}" style="color:black;background:#ECECEC;">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="content?page2=${i}&rnum2=${rnum2}&pCode=${pvo.pCode}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pend2==chong2}">
							<a>></a>
						</c:when>
						<c:otherwise>
							<a href="content?page2=${pend2+1}&rnum2=${rnum2}&pCode=${pvo.pCode}">></a>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${page2==chong2}">
							<a>>></a>
						</c:when>
						<c:otherwise>
							<a href="content?page2=${chong2}&rnum2=${rnum2}&pCode=${pvo.pCode}">>></a>
						</c:otherwise>
					</c:choose>
			
				</td>
			</tr>
	</table>
</section>

<style>
	#review_images {
		width:100%;
		height:100%;
		position:fixed;
		top:0px;
		left:0px;
		background:rgba(0,0,0,0.3);
		visibility:hidden;
	}
	#allimages {
		width:650px;
		height:550px;
		top:50%;
		left:50%;
		translate:-50% -50%;
		display:flex;
		align-content:flex-start;
		flex-wrap:wrap;
		overflow:auto;
		position:fixed;
		background:white;
		padding:25px;
		border-radius:10px;
	}
	#allimages::-webkit-scrollbar {
		display:none;
	}
	#close_btn {
		position:fixed;
		top:0px;
		right:0px;
		width:20px;
		height:20px;
		font-size:20px;
		color:grey;
		cursor:pointer;
	}
	#select_img {
		width:650px;
		height:550px;
		top:50%;
		left:50%;
		translate:-50% -50%;
		display:flex;
		align-content:flex-start;
		flex-wrap:wrap;
		overflow:auto;
		position:fixed;
		background:white;
		padding:25px;
		border-radius:10px;
		display:none;
	}
	#select_img img {
		width:600px;
		height:500px;
		border-radius:10px;
		cursor:pointer;
	}
	.rimages {
		width:100px;
		height:100px;
		cursor:pointer;
	}
</style>
<script>
	function zoomin(img){
		select_img=document.getElementById("select_img").innerHTML="<img src='../resources/upload/"+img+"'>";
		select_img=document.getElementById("select_img").style.display="flex";
		document.getElementById("allimages").style.display="none";
	}
	function zoomout(){
		document.getElementById("allimages").style.display="flex";
		document.getElementById("select_img").style.display="none";
	}
	function view_images(){
		document.getElementById("review_images").style.visibility="visible";
	}
	function hide_images(){
		document.getElementById("review_images").style.visibility="hidden";
	}
</script>
<section id="review_images">
	<div id="select_img" onclick="zoomout()"></div>
	<div id="allimages">
		<div id="close_btn" onclick="hide_images()">x</div>
		<c:forEach items="${allimages}" var="image">
			<c:if test="${!empty image}">
				<div><img src="../resources/upload/${image}" class="rimages" onclick="zoomin('${image}')"></div>
			</c:if>
		</c:forEach>
	</div>
</section>

<style>
	#board_list {
		width:1000px;
		margin:auto;
		margin-top:100px;
		margin-bottom:100px;
	}
	#board_list #blt {
		width:950px;
		text-align:center;
		margin:auto;
		border-collapse:collapse;
		border:1px solid #D5CFC7;
		font-family: 'Noto Sans KR', sans-serif;
		font-size:12px;
	}
	#board_list #blt th {
		height:40px;
		border-top:1px solid #D5CFC7;
		border-bottom:1px solid #D5CFC7;
	}
	#board_list #blt td{
		height:40px;
		border-top:1px solid #D5CFC7;
		border-bottom:1px solid #D5CFC7;
	}
	#board_list #bstate,
	#board_list #bwriteday,
	#board_list #bbrand,
	#board_list #bwriteday2 {
		font-weight:bold;
	}
	#board_list #btitle:hover {
		cursor:pointer;
		background:#ECECEC;
	}
	#board_list #hidecontent {
		display:none;
	}
	#board_list #hideanswer {
		display:none;
		background:#ECECEC;
	}
	#board_list #btitle {
		text-align:left;
		text-indent:10px;
	}
	#board_list #bcontent, #banswer {
		text-align:left;
		padding:15px;
	}
	#board_list #bcontent #update {
		float:right;
	}
	#board_list #wbtn {
		width:950px;
		text-align:right;
		font-family:'Noto Sans KR', sans-serif;
		font-weight:bold;
		font-size:12px;
		color:grey;
	}
	#board_list #wbtn input {
		border:1px solid #D5CFC7;
		font-family:'Noto Sans KR', sans-serif;
		font-weight:bold;
		font-size:12px;
		width:65px;
		height:35px;
		background:white;
		margin:8px 0 0 8px;
		cursor:pointer;
	}
	#board_list #ubtn {
		border:1px solid #D5CFC7;
		font-family:'Noto Sans KR', sans-serif;
		font-weight:bold;
		font-size:12px;
		width:40px;
		height:27px;
		background:white;
	}
	#board_list #paging {
		padding:0px;
	}
	#board_list #blt a {
		text-decoration:none;
		color:#BEBEBE;
		display:table-cell;
		width:35px;
		height:40px;
		margin:0px;
		border-left:1px solid #D5CFC7;
		text-align:center;
		line-height:40px;
	}
	#board_list #blt a:hover {
		background:#ECECEC;
	}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		// 스크롤 위치를 세션 스토리지에 저장
		window.addEventListener('scroll', function() {
		  sessionStorage.setItem('scrollPosition', window.scrollY);
		});
		// 세션 스토리지에 저장된 스크롤 위치를 불러옴
		var scrollPosition = sessionStorage.getItem('scrollPosition');

		// 스크롤 위치를 조정
		if (scrollPosition !== null) {
		  window.scrollTo(0, scrollPosition);
		}
	});
	function toggle(n){
		if(document.getElementsByClassName("hidecontent")[n].style.display=="none") {
			document.getElementsByClassName("hidecontent")[n].style.display="table-row";
			document.getElementsByClassName("hideanswer")[n].style.display="table-row";
		}
		else {
			document.getElementsByClassName("hidecontent")[n].style.display="none";
			document.getElementsByClassName("hideanswer")[n].style.display="none";
		}
	}
	function user_check(id,n){
		var chk=new XMLHttpRequest();
		chk.onload=function(){
			if(chk.responseText=="2")
				alert("로그인 후 이용해주세요");
			if(chk.responseText=="0")
				alert("비밀글입니다");
			else
				toggle(n);
		}
		chk.open("get", "user_check2?id="+id);
		chk.send();
	}
	function qnaw_popup(pCode){
		var popX=(window.screen.width/2)-(600/2);
		var popY=(window.screen.height/2)-800;
		window.open('qna_write?pCode='+pCode,'','width=600,height=850,left='+popX+',top='+popY);
	}
	function qnau_popup(id,pCode){
		var popX=(window.screen.width/2)-(600/2);
		var popY=(window.screen.height/2)-800;
		window.open('qna_update?id='+id+"&pCode="+pCode,'','width=600,height=850,left='+popX+',top='+popY);
	}
</script>
<section id="board_list">
	<table id="blt">
		<tr>
			<th width="80">번호</th>
			<th width="80">답변여부</th>
			<th width="80">구분</th>
			<th width="500">내용</th>
			<th width="100">작성자</th>
			<th width="100">등록일자</th>
		</tr>
		
		<c:forEach items="${blist}" var="bvo">

		<tr>
			<td id="bid">${bvo.id}</td>
			<td id="bstate">
				<c:choose>
					<c:when test="${bvo.state==0}">답변예정</c:when>
					<c:when test="${bvo.state==1}">답변완료</c:when>
				</c:choose>
			</td>
			<td id="bsort">
				<c:choose>
					<c:when test="${bvo.sort==0}">사이즈</c:when>
					<c:when test="${bvo.sort==1}">배송</c:when>
					<c:when test="${bvo.sort==2}">재입고</c:when>
					<c:when test="${bvo.sort==3}">상품상세문의</c:when>
				</c:choose>
			</td>
			<c:if test="${bvo.bimil==1}">
				<td id="btitle" onclick="user_check(${bvo.id},'${bvo.order}')">${bvo.title}<span style="color:lightgrey;font-size:10px">[비밀글]</span></td>
			</c:if>
			<c:if test="${bvo.bimil==0}">
				<td id="btitle" onclick="toggle(${bvo.order})">${bvo.title}</td>
			</c:if>
			<td id="buserid">${bvo.userid2}</td>
			<td id="bwriteday">${bvo.writeday}</td>
		</tr>

		<tr id="hidecontent" class="hidecontent">
			<td colspan="6" id="bcontent">${bvo.content}
			<span id="update">
				<c:if test="${bvo.userid==userid}">
					<input type="button" value="수정" onclick="qnau_popup(${bvo.id},'${pvo.pCode}')" id="ubtn">
					<input type="button" value="삭제" onclick="location='qna_delete?id=${bvo.id}'" id="ubtn">
				</c:if>
			</span></td>
		</tr>

		<tr id="hideanswer" class="hideanswer">
		<c:choose>
		<c:when test="${bvo.state==0}">
		</c:when>
		<c:when test="${bvo.state==1}">
			<td id="bbrand">관리자</td>
			<td colspan="4" id="banswer">${bvo.answer}</td>
			<td id="bwriteday2">${bvo.writeday2}</td>
		</c:when>
		</c:choose>
		</tr>

		</c:forEach>
		
		<tr>
			<td colspan="6" align="right">
				${page}/${chong}페이지
			</td>
		</tr>
		<tr>
			<td colspan="6" align="right" id="paging">
				<c:choose>
					<c:when test="${page==1}">
						<a><<</a>
					</c:when>
					<c:otherwise>
						<a href="content?page=1&rnum=${rnum}&pCode=${pvo.pCode}"><<</a>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${pstart==1}">
						<a><</a>
					</c:when>
					<c:otherwise>
						<a href="content?page=${pstart-1}&rnum=${rnum}&pCode=${pvo.pCode}"><</a>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="i" begin="${pstart}" end="${pend}">
					<c:choose>
						<c:when test="${page==i}">
							<a href="content?page=${i}&rnum=${rnum}&pCode=${pvo.pCode}" style="color:black;background:#ECECEC;">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="content?page=${i}&rnum=${rnum}&pCode=${pvo.pCode}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pend==chong}">
						<a>></a>
					</c:when>
					<c:otherwise>
						<a href="content?page=${pend+1}&rnum=${rnum}&pCode=${pvo.pCode}">></a>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${page==chong}">
						<a>>></a>
					</c:when>
					<c:otherwise>
						<a href="content?page=${chong}&rnum=${rnum}&pCode=${pvo.pCode}">>></a>
					</c:otherwise>
				</c:choose>
		
			</td>
		</tr>
	</table>
	
	<div id="wbtn">
		타 쇼핑몰 언급, 거래 글, 분쟁 유발, 허위 사실 유포는 금지됩니다.
		<input type="button" value="작성하기" onclick="qnaw_popup('${pvo.pCode}')">
	</div>
</section>
</body>
</html>
$(function(){
  // 메인이미지 슬라이드쇼
  ss = setInterval(function () {
	$("#second #img_box").animate({
	  marginLeft: "-100%",
	},
	750,
	function () {
		$("#second .slide_img").eq(0).insertAfter($(".slide_img").eq(4));
	    $("#second #img_box").css("margin-left", "0px");
  	});
  }, 4000);
  // 메인 슬라이드 버튼이벤트
  $("#second .slide_prev_btn").mouseover(function () {
    clearInterval(ss);
  });
  $("#second .slide_next_btn").mouseover(function () {
    clearInterval(ss);
  });
  $("#second .slide_prev_btn").mouseout(function () {
    slide();
  });
  $("#second .slide_next_btn").mouseout(function () {
    slide();
  });
  $("#second .slide_prev_btn").click(function () {
    $("#second .slide_img").eq(4).insertBefore($(".slide_img").eq(0));
    $("#second #img_box").css("margin-left", "0px");
  });
  $("#second .slide_next_btn").click(function () {
    $("#second .slide_img").eq(0).insertAfter($(".slide_img").eq(4));
    $("#second #img_box").css("margin-left", "0px");
  });
});

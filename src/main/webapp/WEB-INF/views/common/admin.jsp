<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>관리자 페이지</title>
    <link href="../resources/css/admin/bootstrap.min.css" rel="stylesheet" />
    
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, 0.1);
        border: solid rgba(0, 0, 0, 0.15);
        border-width: 1px 0;
        box-shadow: inset 0 0.5em 1.5em rgba(0, 0, 0, 0.1), inset 0 0.125em 0.5em rgba(0, 0, 0, 0.15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -0.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      .row {
        padding-bottom: 5px;
      }
    </style>
  <link href="../resources/css/admin/dashboard.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <script>
  $(document).ready(function() {
		$("#logout").click(function(){
		    //alert("버튼 작동");
		    $.ajax({
	            type:"POST",
	            url:"../member/logout",
	            success:function(data){
	                //alert("로그아웃 성공");
	                document.location.reload();     
	            }
		 });
		});
	});
  </script>
  </head>
    <decorator:head/>
<body>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">사누스</a>
      <button
        class="navbar-toggler position-absolute d-md-none collapsed"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#sidebarMenu"
        aria-controls="sidebarMenu"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="navbar-nav">
        <div class="nav-item text-nowrap">
          <a class="nav-link px-3" id="logout">로그아웃</a>
        </div>
      </div>
    </header>

    <div class="container-fluid">
      <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
          <div class="position-sticky pt-3 sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="../admin/main">
                  <span data-feather="home" class="align-text-bottom"></span>
              	    홈
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../admin/category">
                  <span data-feather="layers" class="align-text-bottom"></span>
                  카테고리 관리
                </a>
              </li>
				<li class="nav-item">
                <a class="nav-link" href="../admin/productList">
                  <span data-feather="shopping-cart" class="align-text-bottom"></span>
                  상품관리
                </a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="../admin/orderList">
                  <span data-feather="file" class="align-text-bottom"></span>
                  주문관리
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../admin/memberList">
                  <span data-feather="users" class="align-text-bottom"></span>
                  회원관리
                </a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="../admin/boardList">
                  <span data-feather="bar-chart-2" class="align-text-bottom"></span>
                  게시판관리
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../admin/exhibition">
                  <span data-feather="bar-chart-2" class="align-text-bottom"></span>
                  진열관리
                </a>
              </li>
            </ul>
          </div>
        </nav>
    </div>    
</div>        
<decorator:body/>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <script
      src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
      integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
      integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
      crossorigin="anonymous"
    ></script>
    
</body>
</html>
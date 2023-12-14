<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Forgot Password Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="../assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
    <style>
  	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
  </style>
  	<script type="text/javascript">
  	
  	
  	
  		function sendCode() {
  			
  			
  			var formData = {
  				 name:		$('#name').val()
  				,number:	$('#number').val()
  			};
  			
  			$.ajax({
  				 type:	'POST'
  				,url:	''
  			})
  			
  		}
  	
  	
  	
  	</script>
  </head>
  

  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y"">
        <div class="authentication-inner py-4">
          <!-- Forgot Password -->
          <div class="card mx-auto" style="width: 430px;">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="index.html" class="app-brand-link gap-2">
                  <span class="app-brand-logo demo">
                    <img src="assets/img/logo2.png" alt="logo">
                  </span>
                </a>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">비밀번호 찾기</h4>
              <p class="mb-4">입력한 모바일 번호와 ID에 등록된 모바일 번호가 일치할 경우, <br>[SMS 인증번호]가 발송됩니다. 10분 내에 입력바랍니다.</p>
              <form id="formAuthentication" class="mb-3" method="POST">
              	<div class="row">
	                <div class="mb-3 col-md-6">
	                  <label for="name" class="form-label">성명</label>
	                  <input
	                    type="text"
	                    class="form-control"
	                    id="name"
	                    name="name"
	                    placeholder=""
	                    autofocus
	                  />
	                </div>
	                <div class="mb-3 col-md-6">
	                  <label for="number" class="form-label">모바일 번호</label>
	                  <input
	                    type="text"
	                    class="form-control"
	                    id="number"
	                    name="number"
	                    placeholder=""
	                    autofocus
	                  />
	                </div>
                </div>
                <div class="mb-3">
                	<button class="btn btn-primary d-grid w-100" onclick="sendCode()">인증번호 발송</button>
                </div>
                <div class="mb-3">
	                  <label for="number" class="form-label">인증 번호</label>
	                  <div class="input-group">
		                  <input
		                    type="text"
		                    class="form-control"
		                    id="number"
		                    name="number"
		                    placeholder=""
		                    autofocus 
		                  />
	                  		<button type="button" class="btn btn-primary">확인</button>
                  	</div>
                </div>
              </form>
              <div class="text-center">
                <a href="/logIn" class="d-flex align-items-center justify-content-center">
                  <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                 	돌아가기
                </a>
              </div>
            </div>
          </div>
          <!-- /Forgot Password -->
        </div>
      </div>
    </div>

    <!-- / Content -->



    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>

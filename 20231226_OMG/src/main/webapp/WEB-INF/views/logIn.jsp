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

    <title>logIn</title>

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
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<style>
	
	
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		
	</style>
	<script type="text/javascript">
	
	
	
		// 모델에 추가한 메시지 가져오기
	    var message = "${message}";
	    
	    
	    
	    // 메시지가 비어있지 않으면 알림창 띄우기
	    if (message && message.trim() !== "") {
	       alert(message);
	    }
		
		
		
	    // 관리자와 사원 버튼 스위칭
		document.addEventListener("DOMContentLoaded", function () {
		      const managerBtn = document.getElementById("manager-btn");
		      const employeeBtn = document.getElementById("employee-btn");
		      const managerForm = document.getElementById("hr_manager");
		      const employeeForm = document.getElementById("employee");

		      // 초기 로딩 시에 employee 폼을 숨기고 hr_manager 폼을 표시
		      managerForm.classList.add("d-none");
		      employeeForm.classList.remove("d-none");

		      function toggleForms(activeForm, inactiveForm, activeBtn, inactiveBtn) {
		        activeForm.classList.remove("d-none");
		        inactiveForm.classList.add("d-none");

		        activeBtn.classList.add("active");
		        activeBtn.setAttribute("aria-selected", "true");

		        inactiveBtn.classList.remove("active");
		        inactiveBtn.setAttribute("aria-selected", "false");
		      }

		      managerBtn.addEventListener("click", function () {
		        toggleForms(managerForm, employeeForm, managerBtn, employeeBtn);
		      });

		      employeeBtn.addEventListener("click", function () {
		        toggleForms(employeeForm, managerForm, employeeBtn, managerBtn);
		      });
		    });
	    
	    
	    
	    // 쿠키 설정 함수
	    function setCookie(name, value, days) {
	    	
	    	// 현재 날짜에 만료기간을 더한 날짜를 계산
			const expirationDate = new Date();
			expirationDate.setDate(expirationDate.getDate() + days);
			
			// 만료 기간이 있는 경우, expires 에 값을 설정하고, 그렇지 않으면 빈 문자열을 사용
			const expires = days ? '; expires=' + expirationDate.toUTCString() : '';	// ${expirationDate.toUTCString()}'
			
			// 쿠키에 아이디 저장
			document.cookie =  name + '=' + value + expires + '; path=/';	// '${name}=${value}${expires}; path=/';
	    }
	    
	    
	    
	    // 쿠키 가져오기 함수
	    function getCookie(name) {
	    	const cookies = document.cookie.split(';');
	    	for (let i = 0; i < cookies.length; i++) {
	    		const cookie = cookies[i].trim();
	    		if (cookie.startsWith(name + '=')) {
	    			return cookie.substring(name.length + 1);
	    		}
	    	}
	    	return null;
	    }
	    
		
		
		
	    // ID 기억하기 기능
	    $(document).ready(function() {
			
			// Remember Me 체크박스와 아이디 입력 필드를 jQuery 객체로 가져옵니다
			// const: 변수 선언 키워드 중 하나, 1. 상수	2. 블록 범위 내에서만 유효	3. 선언 시 반드시 초기값 할당
			const rememberMeManager		= $("#remember-me-hr_manager");
			const rememberMeEmployee	= $("#remember-me-employee");
			const inputManager			= $("#mem_id-hr_manager");
			const inputEmployee			= $("#mem_id-employee");
			
			
			
			// Remember Me 체크 박스의 상태가 변경될 때 호출되는 함수
			function handleRememberMeChange(checkbox, inputId) {
				console.log("checkbox: " + checkbox);	// 디버깅 메시지 추가
				console.log("InputId: " + inputId);		// 디버깅 메시지 추가
				console.log("Input value before setCookie: " + $("#" + inputId).val());	// 디버깅 메시지 추가
				// alert("checkbox: "+ checkbox[0].id);
				// alert("Input ID: "+ inputId);
				
				// 쿠키 만료 기간을 7일로 설정	-> 왜 쿠키 설정 함수랑 코드 겹치게 쓰지?
				const expirationDays = 7;
				
				
				// Remember Me 체크박스가 체크된 경우
				if (checkbox.prop("checked")) {
					
					// 쿠키에 아이디 저장
					setCookie(inputId, $("#" + inputId).val(), expirationDays);
					
					// 로컬 스토리지에도 아이디 저장
					localStorage.setItem(inputId, $(inputId).val());
					
				} else {
					
					// 쿠키에서 아이디 제거
					setCookie(inputId, '', -1);
					
					// document.cookie = `${inputId}=false; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/`;
					localStorage.removeItem(inputId);
				}
				
				// Remember Me 체크박스가 체크된 경우
				//	해당 요소의 property 속성값을 가져옵니다 
				//if (checkbox.prop("checked")) {																						    	// ECMAScript(이큐마스크립트)는 JS가 어떻게 동작해야 하는지 표준화를 위해 규격을 정의한 문서
					// 																								GMT(그리니치 평균시)는 현재 사용 중인 ECMAScript 표준에서 권장 X
					// 																쿠키 만료 날짜 설정: 현재날짜 + 만료 기간 -> UTC(협정 세계 시)형식의 문자열로 변환 
					// 쿠키에 아이디 저장		1. 해당 쿠키 이름 key		2. 해당 쿠키의 값 value 반환	3. 옵션 설정	3-1. 쿠키 만료 날짜			3-2. 적용 경로 지정 
					//document.cookie = '${inputId}=${inputId ? "true" : "false"}; expires=${expirationDate.toUTCString()}; path=/';
					//																							쿠키 경로 설정	'/': 웹서버 루트 경로 -> 사이트 전체에서 해당 쿠키 사용 
					
					// 로컬 스토리지: 브라우저에 데이터 저장. 세션 간에 데이터 유지, 페이지 새로고침이나 브라우저를 닫아도 데이터 유지. 키-값으로 데이터 저장, JS로 데이터 읽고 씀
					// 로컬 스토리지에도 아이디 저장:	이 키에,		이 값을 			-> 로컬 스토리지에 저장
					//localStorage.setItem(inputId, $(inputId).val());
				//} else {
					// Remember Me 체크박스가 해제된 경우
					// 쿠키에서 아이디 제거					유효하지 않은 날짜(쿠키 만료 날짜를 현재보다 이전의 날짜)로 설정하여 브라우저에서 해당 쿠키 삭제 지시 -> 해당 쿠키 즉시 만료
					//document.cookie = '${inputId}=false; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/';
					//																			쿠키 설정 경로 = 삭제 경로 일치해야 한다
					
					// 로컬 스토리지에서도 아이디 제거
					//localStorage.removeItem(inputId);
					// 									쿠키														로컬 스토리지
					// 데이터 전송: HTTP 요청과 함께 서버로 전송, 서버와 클라이언트 간의 통신에 주로 사용			서버로 자동 전송 X, JS 수동 조작으로 브라우저 내에서 데이터 저장 및 검색
					// 용량:		도메인당 제한(약 4KB). 											도메인당 약 5MB, 대량의 데이터 저장
					// 수명:		만료 기간이 있어 일정 기간 동안만 유효. 설정 안하면 브라우저 세션 동안만 지속			브라우저 닫아도 로컬 스토리지에 저장된 데이터는 계속 유지
					// 보안:		HttpOnly 플래그를 사용하면 JS에서 쿠키에 접근을 방지할 수 있다				쿠키보다 덜 보안적, JS 코드로 쉽게 접근 -> 중요 정보 저장은 피하는 게 좋다	
				//}
			}
			
			
			
			// "Remember Me" 체크박스의 상태가 변경될 때마다 특정 함수를 호출하는 이벤트 리스너를 등록
			rememberMeManager.change(function() {
				//											쿠키 이름. key
				handleRememberMeChange(rememberMeManager, "mem_id-hr_manager");
			});
			
			rememberMeEmployee.change(function() {
				handleRememberMeChange(rememberMeEmployee, "mem_id-employee");
			});
			
			
			
			// Remember Me 체크박스의 상태를 복원하는 함수
			function restoreRememberMeState(checkbox, inputId) {
				
				const cookieValue = getCookie(inputId);
				
				// 정규표현식을 사용하여 쿠키 값에서 Remember Me 상태를 가져옵니다
				//									    			   key 가 ${inputId}와 일치하는 패턴 찾기
				//										RegExp: 정규표현식 생성	정규표현식이란, 문자열 패턴을 정의하고 검색.	이메일, 전화번호 등 특정 문자열 패턴을 찾음.
				//												(?: ... ): 캡처되지 않은 그룹 -> 매치 결과를 따로 저장하지 않을 때 <-> (...): 매치된 부분 기억
				//								  				   ^: 문자열의 시작		 			 
				//								    				 .*;\\s*: 'key' 앞에 있는, ';'이 있는 부분까지의 모든 문자열. 주로 쿠키 문자열에서 특정 쿠키를 찾을 때 사용
				//								    						 ${inputId}\\s*=\\s*:	${inputId}에 해당하는 KEY와 '=' 사이에 있는 공백을 포함한 패턴 찾기
				const match = document.cookie.match(new RegExp(`(?:^|.*;\\s*)${inputId}\\s*=\\s*([^;]*).*$`));
				//								    								   \\s*: 0개 이상의 공백 문자
				//								     									 		([^;]*): 쿠키값'value'에 해당하는 부분 찾기(';'를 제외한 모든 문자열을 포함하는 패턴)
				//																					   .*$: 패턴 뒤에 나오는 모든 문자열을 포함
				
				// 쿠키 값에서 Remember Me 상태를 가져옵니다	replace: 문자열에서 특정 패턴을 찾아, 지정된 문자열(cookieValue 같은)에 저장
				// const cookieValue = document.cookie.replace(
						// new RegExp('(?:(?:^|.*;\\s*)${inputId}\\s*\\=\\s*([^;]*).*$)|^.*$'),
						//															|^.*$: 앞에서의 패턴이 매치되지 않을 때, 그 이외의(OR) 나머지 문자열 전체 찾기
						// "$1"	// 첫번째 캡쳐된 그룹	=	([^;]*)	=	쿠키값
						// );
				
				// 쿠키 값이 비어 있지 않다면 체크박스를 체크하고, 입력란에 값을 복원
				if (cookieValue) {
					checkbox.prop("checked", true);
					$("#" + inputId).val(match[1]);
					// $("#" + inputId).val(cookieValue);
				}
			}
			
			
			
			// 페이지 로드 시 Remember Me 상태를 복원
			restoreRememberMeState(rememberMeManager, "mem_id-hr_manager");
			restoreRememberMeState(rememberMeEmployee, "mem_id-employee");
			
			
			
			// 아이디 입력 필드를 복원하는 함수
			function restoreUserId(input, inputId) {
				
				// 정규표현식을 사용하여 쿠키 값에서 Remember Me 상태를 가져옵니다
				const match = document.cookie.match(new RegExp(`(?:^|.*;\\s*)${inputId}\\s*=\\s*([^;]*).*$`));
				
				// 쿠키 값에서 Remember Me 상태를 가져옵니다
				// const cookieValue = getCookie(inputId);
				
				// const cookieValue = document.cookie.replace(
				// 		new RegExp('(?:(?:^|.*;\\s*)${inputId}\\s*\\=\\s*([^;]*).*$)|^.*$'),
				// 		"$1"
				// );
				
				
				// 쿠키 값이 비어 있지 않다면 입력 필드에 값을 복원
				if (match) {
					input.val(match[1]);
						// input.val(cookieValue);	
				}
			}
			
			// 페이지 로드 시 아이디 입력 필드를 복원
			restoreUserId(inputManager, "mem_id-hr_manager");
			restoreUserId(inputEmployee, "mem_id-employee");
			
		});
		
		
		
	</script>
	
  </head>


  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
      
      	<div class="col-md-4">
      
        <div class="authentication-inner ">
          <!-- Register -->
          <div class="card">
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
              
              
              
			<ul class="nav nav-pills mb-3 nav-fill" role="tablist">
              	<li class="nav-item">
					<button
						 id="manager-btn"
	                     type="button"
	                     class="nav-link"
	                     role="tab"
	                     data-bs-toggle="tab"
	                     aria-controls="hr_manager"
	                     aria-selected="false"
	                     
                   >
                     <i class="tf-icons bx bx-home"></i> 관리자
                   </button>
				</li>
				<li class="nav-item">
                   <button
                   	 id="employee-btn"
                     type="button"
                     class="nav-link active"
                     role="tab"
                     aria-controls="employee"
                     aria-selected="true"
                   >
                     <i class="tf-icons bx bx-user"></i> 사원
                   </button>
                 </li>
			</ul>
              
              
		              <form id="hr_manager" class="mb-3" action="/auth" method="POST">
		                <div class="mb-3">
		                  <label for="email" class="form-label">아이디</label>
		                  <input
		                    type="text"
		                    class="form-control"
		                    id="mem_id-hr_manager"
		                    name="username"
		                    placeholder="관리자 아이디를 입력해주세요"
		                    autofocus
		                  />
		                </div>
		                <div class="mb-3 form-password-toggle">
		                  <div class="d-flex justify-content-between">
		                    <label class="form-label" for="password">비밀번호</label>
		                    <a href="/forgotPassword">
		                      <small>비밀번호를 잊으셨나요?</small>
		                    </a>
		                  </div>
		                  <div class="input-group input-group-merge">
		                    <input
		                      type="password"
		                      id="password-hr_manager"
		                      class="form-control"
		                      name="password"
		                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
		                      aria-describedby="password"
		                    />
		                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
		                  </div>
		                </div>
		                <div class="mb-3">
		                  <div class="form-check">
		                    <input class="form-check-input" type="checkbox" id="remember-me-hr_manager" />
		                    <label class="form-check-label" for="remember-me"> 저장 [ID] </label>
		                  </div>
		                </div>
		                <div class="mb-3">
		                  <button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
		                </div>
		              </form>
		              
		              
		              <form id="employee" class="mb-3" action="/login" method="POST">
		                <div class="mb-3">
		                  <label for="email" class="form-label">아이디</label>
		                  <input
		                    type="text"
		                    class="form-control"
		                    id="mem_id-employee"
		                    name="mem_id"
		                    placeholder="사원 아이디를 입력해주세요"
		                    autofocus
		                  />
		                </div>
		                <div class="mb-3 form-password-toggle">
		                  <div class="d-flex justify-content-between">
		                    <label class="form-label" for="password">비밀번호</label>
		                    <a href="/forgotPassword">
		                      <small>비밀번호를 잊으셨나요?</small>
		                    </a>
		                  </div>
		                  <div class="input-group input-group-merge">
		                    <input
		                      type="password"
		                      id="password-employee"
		                      class="form-control"
		                      name="mem_pw"
		                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
		                      aria-describedby="password"
		                    />
		                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
		                  </div>
		                </div>
		                <div class="mb-3">
		                  <div class="form-check">
		                    <input class="form-check-input" type="checkbox" id="remember-me-employee" />
		                    <label class="form-check-label" for="remember-me"> 저장 [ID] </label>
		                  </div>
		                </div>
		                <div class="mb-3">
		                  <button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
		                </div>
		              </form>

              
              

            </div>
          </div>
          <!-- /Register -->
          </div>
          </div>
          
          
          <div class="col-md-6">
          <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header d-flex justify-content-between align-items-center"><strong>공지사항</strong>
                
                <button type="button" class="btn btn-sm btn-outline-secondary ms-auto">더보기</button>
                </h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>제목</th>
                        <th class="text-end">날짜</th>
                        
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> Angular Project</td>
                        <td class="text-end">2023-12-07</td>
                        
                      </tr>
                      <tr>
                        <td><i class="fab fa-react fa-lg text-info me-3"></i>React Project</td>
                        <td class="text-end">2023-12-07</td>
                        
                        
                      </tr>
                      <tr>
                        <td><i class="fab fa-vuejs fa-lg text-success me-3"></i>VueJs Project</td>
                        <td class="text-end">2023-12-07</td>
                        
                        
                      </tr>
                      <tr>
                        <td>
                          <i class="fab fa-bootstrap fa-lg text-primary me-3"></i>Bootstrap Project
                        </td>
                        <td class="text-end">2023-12-07</td>
                        
                      </tr>
                      <tr>
                        <td>
                          <i class="fab fa-bootstrap fa-lg text-primary me-3"></i>Bootstrap Project
                        </td>
                        <td class="text-end">2023-12-07</td>
                        
                      </tr>
                      <tr>
                        <td>
                          <i class="fab fa-bootstrap fa-lg text-primary me-3"></i>Bootstrap Project
                        </td>
                        <td class="text-end">2023-12-07</td>
                        
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Basic Bootstrap Table -->
          
          </div>
        
      </div>
    </div>

    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    
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

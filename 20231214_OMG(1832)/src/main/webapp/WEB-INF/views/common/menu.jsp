<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
		<!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="/" class="app-brand-link">
              <span class="app-brand-logo demo">
                <img src="../assets/img/logo2.png" alt="logo">
              </span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item active">
              <a href="/" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Home</div>
              </a>
            </li>

            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">제품 관리</span>
            </li>
            <li class="menu-item">
              <a href="/item/list" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">제품 조회</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="/item/create" class="menu-link">
              	<i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">제품 등록</div>
              </a>
            </li>
            <!-- WareHouse -->
            <!--Customer  -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">거래처 관리</span></li>
            <!-- User interface -->
            <li class="menu-item">
              <a href="/customerList" class="menu-link ">
                <i class="menu-icon tf-icons bx bx-box"></i>
                <div data-i18n="User interface">거래처조회</div>
              </a>
            </li>
            
            <!-- Extended components -->
            <li class="menu-item">
              <a href="/customerSales" class="menu-link ">
                <i class="menu-icon tf-icons bx bx-box"></i>
                <div data-i18n="Extended UI">거래처별판매실적조회</div>
              </a>
            </li>
            <!-- Extended components -->
            <li class="menu-item">
              <a href="javascript:void(0)" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-copy"></i>
                <div data-i18n="Extended UI">Extended UI</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="extended-ui-perfect-scrollbar.html" class="menu-link">
                    <div data-i18n="Perfect Scrollbar">Perfect scrollbar</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="extended-ui-text-divider.html" class="menu-link">
                    <div data-i18n="Text Divider">Text Divider</div>
                  </a>
                </li>
              </ul>
            </li>

            <li class="menu-item">
              <a href="icons-boxicons.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-crown"></i>
                <div data-i18n="Boxicons">Boxicons</div>
              </a>
            </li>

            <!-- Sales -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">매입&amp;매출 관리</span></li>
            <!-- Forms -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">매입</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="purWriteForm" class="menu-link">
                    <div data-i18n="Basic Inputs">발주서 작성</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="purList" class="menu-link">
                    <div data-i18n="Input groups">발주서 리스트</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">Form Layouts</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="form-layouts-vertical.html" class="menu-link">
                    <div data-i18n="Vertical Form">Vertical Form</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="form-layouts-horizontal.html" class="menu-link">
                    <div data-i18n="Horizontal Form">Horizontal Form</div>
                  </a>
                </li>
              </ul>
            </li>
            <!-- Tables -->
            <li class="menu-item">
              <a href="tables-basic.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">Tables</div>
              </a>
            </li>
            
            <!-- Purchase -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">재고 관리</span></li>
            <!-- Forms -->
            <li class="menu-item">
               <a href="invRegister" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">기초재고조정/등록</div>
              </a>
            </li>

            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Layouts">입출고관리</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="inboundRegister" class="menu-link">
                    <div data-i18n="Vertical Form">입고등록</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="form-layouts-horizontal.html" class="menu-link">
                    <div data-i18n="Horizontal Form">출고등록</div>
                  </a>
                </li>
              </ul>
            </li>
            
            <!-- Tables -->
            <li class="menu-item">
              <a href="tables-basic.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">재고조회</div>
              </a>
            </li>
            
            <!-- Misc -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">고객 지원</span></li>
				<li class="menu-item">
					<a href="/notice/list" class="menu-link">
						<i class="menu-icon tf-icons bx bx-support"></i>
						공지사항
					</a>
				</li>
				<li class="menu-item">
					<a href="/qna" class="menu-link">
						<i class="menu-icon tf-icons bx bx-support"></i>
						문의
					</a>
				</li>
				<li class="menu-item">
              <a
                href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                target="_blank"
                class="menu-link"
              >
                <i class="menu-icon tf-icons bx bx-support"></i>
                <div data-i18n="Support">Support</div>
              </a>
            </li>
            <li class="menu-item">
              <a
                href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                target="_blank"
                class="menu-link"
              >
                <i class="menu-icon tf-icons bx bx-file"></i>
                <div data-i18n="Documentation">Documentation</div>
              </a>
            </li>
          </ul>
        </aside>
        <!-- / Menu -->
        
        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
          
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    
                      <ul class="navbar-nav flex-row align-items-center ms-auto">
                   <!-- Place this tag where you want the button to render. -->
                   <li class="nav-item lh-1 me-3">
                     <a
                       class="github-button"
                       href="https://github.com/themeselection/sneat-html-admin-template-free"
                       data-icon="octicon-star"
                       data-size="large"
                       data-show-count="true"
                       aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
                       >Star</a
                     >
                   </li>
   
                   <!-- User -->
                   <li class="nav-item navbar-dropdown dropdown-user dropdown">
                     <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                       <div class="avatar avatar-online">
                         <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                       </div>
                     </a>
                     <ul class="dropdown-menu dropdown-menu-end">
                       <li>
                         <a class="dropdown-item" href="#">
                           <div class="d-flex">
                             <div class="flex-shrink-0 me-3">
                               <div class="avatar avatar-online">
                                 <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                               </div>
                             </div>
                             <div class="flex-grow-1">
                               <span class="fw-semibold d-block">${sessionScope.mem_name }</span>
                               <small class="text-muted">Admin</small>
                             </div>
                           </div>
                         </a>
                       </li>
                       <li>
                         <div class="dropdown-divider"></div>
                       </li>
                       <li>
                         <a class="dropdown-item" href="#">
                           <i class="bx bx-user me-2"></i>
                           <span class="align-middle">My Profile</span>
                         </a>
                       </li>
                       <li>
                         <a class="dropdown-item" href="#">
                           <i class="bx bx-cog me-2"></i>
                           <span class="align-middle">Settings</span>
                         </a>
                       </li>
                       <li>
                         <a class="dropdown-item" href="#">
                           <span class="d-flex align-items-center align-middle">
                             <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                             <span class="flex-grow-1 align-middle">로그인 관리</span>
                             <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                           </span>
                         </a>
                       </li>
                       <li>
                         <div class="dropdown-divider"></div>
                       </li>
                       <li>
                         <a class="dropdown-item" href="/logOut">
                           <i class="bx bx-power-off me-2"></i>
                           <span class="align-middle">Log Out</span>
                         </a>
                       </li>
                     </ul>
                   </li>
                   <!--/ User -->
                 </ul>
                 
                  </div>
                </div>
              </nav>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
          
          	<div class="container-xxl flex-grow-1 container-p-y">


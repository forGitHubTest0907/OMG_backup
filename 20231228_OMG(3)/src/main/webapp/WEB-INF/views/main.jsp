<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OMG</title>
</head>

<%@ include file="common/header.jsp" %>
<body>
<%@ include file="common/menu.jsp" %>

            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body">
                          <h5 class="card-title text-primary"><span class="fw-bold">${sessionScope.mem_name }</span>님 환영합니다 🎉</h5>
                          <p class="mb-4">
                          </p>
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <img
                            src="../assets/img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                            data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-lg-4 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="d-flex justify-content-between flex-sm-row flex-column gap-3" style="margin-bottom: 5px;">
                            <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                              <div class="card-title">
                              <div class="d-flex align-items-start">
                              <div class="avatar flex-shrink-0">
                              <img src="../assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
                            </div>
                                <h5 class="text-nowrap mb-0">금월 매입</h5>
                                </div>
                                <span class="badge bg-label-warning rounded-pill">Year 2021</span>
                              </div>
                              <div class="mt-sm-auto">
                                <small class="text-success text-nowrap fw-semibold"
                                  ><i class="bx bx-chevron-up"></i> 68.2%</small
                                >
                                <h3 class="mb-0" id="monthPurchase" ></h3>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
            
                <!-- Total Revenue -->
                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-8">
                        <h5 class="card-header m-0 me-2 pb-3">Total Revenue</h5>
                        <div id="totalRevenueChart" class="px-2"></div>
                      </div>
                      <div class="col-md-4">
                        <div class="card-body">
                          <div class="text-center">
                            <div class="dropdown">
                              <button
                                class="btn btn-sm btn-outline-primary dropdown-toggle"
                                type="button"
                                id="growthReportId"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                2022
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
                                <a class="dropdown-item" href="javascript:void(0);">2021</a>
                                <a class="dropdown-item" href="javascript:void(0);">2020</a>
                                <a class="dropdown-item" href="javascript:void(0);">2019</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div id="growthChart"></div>
                        <div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>

                        <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                          <div class="d-flex">
                            <div class="me-2">
                              <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
                            </div>
                            <div class="d-flex flex-column">
                              <small>2022</small>
                              <h6 class="mb-0">$32.5k</h6>
                            </div>
                          </div>
                          <div class="d-flex">
                            <div class="me-2">
                              <span class="badge bg-label-info p-2"><i class="bx bx-wallet text-info"></i></span>
                            </div>
                            <div class="d-flex flex-column">
                              <small>2021</small>
                              <h6 class="mb-0">$41.2k</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Total Revenue -->
                
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                  <div class="row">
                  
                  <div class="col-12 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="d-flex justify-content-betFween flex-sm-row flex-column gap-3">
                            <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                          
                          
                            <div class="avatar flex-shrink-0">
                              <img
                                src="../assets/img/icons/unicons/wallet-info.png"
                                alt="Credit Card"
                                class="rounded"
                              />
                            </div>
                            
                              <div class="card-title">
                                <h5 class="text-nowrap mb-2">금월 매출</h5>
                                <span class="badge bg-label-warning rounded-pill">Year 2021</span>
                              </div>
                              <div class="mt-sm-auto">
                                <small class="text-success text-nowrap fw-semibold"
                                  ><i class="bx bx-chevron-up"></i> 68.2%</small
                                >
                                <h3 class="mb-0" id="monthSale"></h3>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  
                    <div class="col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="../assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded" />
                            </div>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="cardOpt4"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                                <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                              </div>
                            </div>
                          </div>
                          <span class="d-block mb-1">Payments</span>
                          <h3 class="card-title text-nowrap mb-2">$2,456</h3>
                          <small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i> -14.82%</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="../assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
                            </div>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="cardOpt1"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu" aria-labelledby="cardOpt1">
                                <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                              </div>
                            </div>
                          </div>
                          <span class="fw-semibold d-block mb-1">Transactions</span>
                          <h3 class="card-title mb-2">$14,857</h3>
                          <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.14%</small>
                        </div>
                      </div>
                    </div>
                    <!-- </div>-->
                     
                    </div>
                  </div>
                </div>
              </div>
              <!-- <div class="row"> -->
              <div class="row">
                <!-- Order Statistics -->
                <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Order Statistics</h5>
                        <small class="text-muted">42.82k Total Sales</small>
                      </div>
                      <div class="dropdown">
                        <button
                          class="btn p-0"
                          type="button"
                          id="orederStatistics"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                          <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                          <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                          <a class="dropdown-item" href="javascript:void(0);">Share</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column align-items-center gap-1">
                          <h2 class="mb-2">8,258</h2>
                          <span>Total Orders</span>
                        </div>
                        <div id="orderStatisticsChart"></div>
                      </div>
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary"
                              ><i class="bx bx-mobile-alt"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Electronic</h6>
                              <small class="text-muted">Mobile, Earbuds, TV</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">82.5k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Fashion</h6>
                              <small class="text-muted">T-shirt, Jeans, Shoes</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">23.8k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Decor</h6>
                              <small class="text-muted">Fine Art, Dining</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">849k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-secondary"
                              ><i class="bx bx-football"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Sports</h6>
                              <small class="text-muted">Football, Cricket Kit</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">99</small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Order Statistics -->

                <!-- Expense Overview -->
                <div class="col-md-6 col-lg-4 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header">
                      <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link active"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-tabs-line-card-income"
                            aria-controls="navs-tabs-line-card-income"
                            aria-selected="true"
                          >
                            Income
                          </button>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="nav-link" role="tab">Expenses</button>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="nav-link" role="tab">Profit</button>
                        </li>
                      </ul>
                    </div>
                    <div class="card-body px-0">
                      <div class="tab-content p-0">
                        <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                          <div class="d-flex p-4 pt-3">
                            <div class="avatar flex-shrink-0 me-3">
                              <img src="../assets/img/icons/unicons/wallet.png" alt="User" />
                            </div>
                            <div>
                              <small class="text-muted d-block">Total Balance</small>
                              <div class="d-flex align-items-center">
                                <h6 class="mb-0 me-1">$459.10</h6>
                                <small class="text-success fw-semibold">
                                  <i class="bx bx-chevron-up"></i>
                                  42.9%
                                </small>
                              </div>
                            </div>
                          </div>
                          <div id="incomeChart"></div>
                          <div class="d-flex justify-content-center pt-4 gap-2">
                            <div class="flex-shrink-0">
                              <div id="expensesOfWeek"></div>
                            </div>
                            <div>
                              <p class="mb-n1 mt-1">Expenses This Week</p>
                              <small class="text-muted">$39 less than last week</small>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Expense Overview -->
                                <!-- Transactions --> 
                <div class="col-md-6 col-lg-4 order-2 mb-4"> 
                  <div class="card h-100"> 
                    <div class="card-header d-flex align-items-center justify-content-between"> 
                      <h5 class="card-title m-0 me-2">팀원 목록</h5> 
                    </div> 
                    <div class="table-responsive text-nowrap"> 
	                  <table class="table"> 
	                    <thead class="fixed-header"> 
	                      <tr> 
	                        <th>이름</th> 
	                        <th></th> 
	                        <th>직위</th> 
	                        <th>직책</th> 
	                      </tr> 
	                    </thead> 
	                    <tbody class="table-border-bottom-0" id="teamTableBody"> 
	                    </tbody> 
	                  </table> 
	                </div> 
	              </div> 
                  </div> 
                </div> 
                <!--/ Transactions --> 
            <!-- / Content -->

<%@ include file="common/footer.jsp" %>    
<script type="text/javascript">
	
	$(document).ready(function(){
		var purchase = document.getElementById("monthPurchase");
		var sale = document.getElementById("monthSale");
		var memId = ${sessionScope.mem_id}
		
		//팀원리스트
		$.ajax({
			url:"mainMember",
			data : {memId : memId},
			dataType : "json",
			type : "POST",
			success : function(member){
				updateProfileCard(member);
			},
			//에러 메시지 출력
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
		//이번달 매입
		$.ajax({
			url:"monthTotalPurchase",
			dataType : "Text",
			async : true,
			type : "POST",
			success : function(data){
				if(data){
					var formattedAmount = formatCurrency(parseFloat(data));
					purchase.innerText = formattedAmount;
				}
			},
			error : function(request, status, error){
  			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
		});

		//이번달 매출
		$.ajax({
			url:"monthTotalSale",
			type : 'POST',
			//async - "true" : 비동기화, "false" : "동기화"
			async : true,
			dataType : "text",
			success : function(data){
			if(data){
			// 서버에서 받은 데이터를 숫자로 파싱하고 원화 형식으로 변환하여 업데이트
			var formattedAmount = formatCurrency(parseFloat(data));
			sale.innerText = formattedAmount;
			}
		},
		//에러 메시지 출력
		error:function(request, status, error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		});
		
		//팀원리스트
		$.ajax({
			url:"mainTeamList",
			data : {memId : memId},
			dataType : "json",
			type : "POST",
			success : function(response){
				var teamList = response.teamMember;
				$("#teamTableBody").empty();
				for (var i = 0; i < teamList.length; i++) {
	                   var team = teamList[i];
	                   console.log(team.mem_posi_md);
	                   $("#teamTableBody").append(
	                       "<tr>" +
	                       "<td> <img id='imgView' src='${pageContext.request.contextPath}/upload/sh/" +  team.mem_img + "' style='height: 30px; width: 30px;'></td>" +
	                       "<td>" + team.mem_name + "</td>" +
	                       "<td>" + positionMd(team.mem_posi_md) + "</td>" +
	                       "<td>" + dutyMd(team.mem_duty_md) + "</td>" +
	                       "</tr>"
	                   );
	               }
			},
			//에러 메시지 출력
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	function updateProfileCard(member){
		if(member){
			// 날짜 포맷팅 함수
		    function formatDate(dateString) {
		        // dateString을 Date 객체로 변환
		        var date = new Date(dateString);
		        // 원하는 날짜 형식으로 포맷
		        var formattedDate = date.toLocaleDateString('ko-KR', { year: 'numeric', month: '2-digit', day: '2-digit' });
		        return formattedDate;
		    }
			
			$(".card-body h5 .fw-bold").text(member.mem_name + " " + positionMd(member.mem_posi_md));
			$(".card-body p").text("사원번호: " + member.mem_id + " / 부서: " + deptMd(member.mem_dept_md) + " / 직급: " +  dutyMd(member.mem_duty_md) + " / 입사일:"+ formatDate(member.mem_hiredate));
		}
	}
	
	//숫자를 원화 형식으로 변환하는 함수
	function formatCurrency(amount) {
		return new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(amount);
		};

	function deptMd(memDeptMd){ 
		if(memDeptMd === 100){ 
			return "회계팀"; 
	    } else if (memDeptMd === 101) { 
	        return "인사팀"; 
	    } else if (memDeptMd === 102) { 
	        return "영업1팀"; 
	    } else if (memDeptMd === 103) { 
	        return "영업2팀"; 
	    } else if (memDeptMd === 104) { 
	        return "물류1팀"; 
	    } else if (memDeptMd === 105) { 
	        return "물류2팀"; 
	    } else if (memDeptMd === 106) { 
	        return "CS1팀"; 
	    } else if (memDeptMd === 107) { 
	        return "CS2팀"; 
	    } else if (memDeptMd === 999) { 
	        return "관리자"; 
	    } else { 
	        return ""; // 다른 처리가 필요할 경우 추가 
	    } 
	};	 
		 
	function positionMd(teamPosiMd){ 
		 if (teamPosiMd === 100) { 
		        return "대표이사"; 
		    } else if (teamPosiMd === 101) { 
		        return "상무"; 
		    } else if (teamPosiMd === 102) { 
		        return "차장"; 
		    } else if (teamPosiMd === 103) { 
		        return "과장"; 
		    } else if (teamPosiMd === 104) { 
		        return "팀장"; 
		    } else if (teamPosiMd === 105) { 
		        return "팀원"; 
		    } else { 
		        return ""; 
		    } 
	}; 
	 
	function dutyMd(teamDutyMd){ 
		 if (teamDutyMd === 100) { 
		        return "CEO"; 
		    } else if (teamDutyMd === 101) { 
		        return "CFO"; 
		    } else if (teamDutyMd === 102) { 
		        return "본부장"; 
		    } else if (teamDutyMd === 103) { 
		        return "실장"; 
		    } else if (teamDutyMd === 104) { 
		        return "팀장"; 
		    } else if (teamDutyMd === 105) { 
		        return "팀원"; 
		    } else { 
		        return ""; 
		    } 
	}; 
</script>    
</body>
</html>    
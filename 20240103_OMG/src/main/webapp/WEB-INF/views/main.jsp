<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OMG</title>
</head>
<script type="text/javascript"></script>
<style>
    .table-responsive {
        overflow-y: auto;
    }
</style>
<%@ include file="common/header.jsp" %>
<body>
<%@ include file="common/menu.jsp" %>

            <!-- Content -->
              <div class="row">
              	<!-- Welcome Card -->
                <div class="col-12 col-lg-8 order-0 order-md-0 order-lg-0 mb-4">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body" style="margin-bottom: 35px;">
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
                            style="margin-top: 25px;"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Welcome Card --> 
                <!-- Team List --> 
                <div class="col-12 col-lg-4 order-2 mb-4"> 
                  <div class="card"> 
                    <div class="table-responsive text-nowrap" style="max-height: 189px;"> 
	                  <table class="table"> 
	                    <thead class="fixed-header"> 
	                      <tr> 
	                      	<th></th>
	                        <th>이름</th> 
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
                <!--/Team List -->
               
                <div class="row">
                	<!-- Total Revenue -->
	                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
	                  <div class="card">
	                    <div class="row row-bordered g-0">
	                      	<h5 class="card-header m-0 me-2 pb-3">재고현황</h5>
	                      	<!-- Small table -->
					        <div class="table-responsive text-nowrap" style="max-height: 400px;">
					            <table class="table table-sm">
					               	<thead class="fixed-thead">
					                   	<tr>
						         	       <th>code</th>
						                   <th>name</th>
						                   <th>qty</th>
						                   <th>price</th>
						                   <th>...</th>
					                	</tr>
					                </thead>
					                <tbody class="table-border-bottom-0" id="invenTableBody">
					                </tbody>
					         	</table>
					      	</div>
					        <!--/ Small table -->
	                    </div>
	                  </div>
	                </div>
	                <!--/ Total Revenue -->
	                <!-- Notice --> 
	                <div class="col-md-6 col-lg-4 order-2 mb-4" id="notice"> 
	                   
	                </div>
	                <!--/ Notice -->
                </div>
                
			  
			  <div class="row">
				  <!-- Sales -->
				  <div class="col-12 col-lg-6 mb-4">
				    <div class="card">
				      <div class="card-body">
				        <div class="d-flex justify-content-between flex-sm-row flex-column gap-3" style="margin-bottom: 5px;">
				          <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
				            <div class="avatar flex-shrink-0">
				              <img src="../assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
				            </div>
				            <div class="card-title">
				              <div class="d-flex align-items-start">
				                <h5 class="text-nowrap mb-0">금월 매입</h5>
				              </div>
				              <span class="badge bg-label-warning rounded-pill">Year 2021</span>
				            </div>
				            <div class="mt-sm-auto">
				              <small class="text-success text-nowrap fw-semibold"><i class="bx bx-chevron-up"></i> 68.2%</small>
				            </div>
				          </div>
				          <h3 class="mb-2" id="monthPurchase"></h3>
				        </div>
				      </div>
				    </div>
				  </div>
				  <!--/Sales -->
				  <!-- Purchase -->
				  <div class="col-12 col-lg-6 order-3 order-md-2">
				    <div class="card">
				      <div class="card-body">
				        <div class="d-flex justify-content-between flex-sm-row flex-column align-items-start gap-3">
				          <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
				            <div class="avatar flex-shrink-0">
				              <img src="../assets/img/icons/unicons/wallet-info.png" alt="Credit Card" class="rounded" />
				            </div>
				            <div class="card-title flex-grow-1">
				              <h5 class="text-nowrap mb-2">금월 매출</h5>
				              <span class="badge bg-label-warning rounded-pill">Year 2021</span>
				            </div>
				            <div class="mt-sm-auto">
				              <small class="text-success text-nowrap fw-semibold"><i class="bx bx-chevron-up"></i> 68.2%</small>
				            </div>
				          </div>
				          <h3 class="mb-2" id="monthSale"></h3>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				<!--/Purchase -->
            <!--/ Content -->

<%@ include file="common/footer.jsp" %>    
<script type="text/javascript">
	
	$(document).ready(function(){
		//공지사항 메소드
		showNotice(); 
		
		var purchase = document.getElementById("monthPurchase");
		var sale = document.getElementById("monthSale");
		var memId = ${sessionScope.mem_id}
		
		//개인 정보 출력
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
		
		//재고리스트
		$.ajax({
			url:"mainInventory",
			dataType : "json",
			type : "POST",
			success : function(response){
				var wareList = response.warehouseList;
				$('#invenTableBody').empty();
				for(var i = 0; i < wareList.length; i++){
					var ware = wareList[i];
					$('#invenTableBody').append(
							"<tr>"+
							"<td>" + ware.code + "</td>" +
							"<td>" + ware.name + "</td>" +
							"<td>" + ware.cnt + "</td>" +
							"<td>" + ware.price + "</td>" +
							"<td><div class='dropdown'>" +
							"<button type='button' class='btn p-0 dropdown-toggle hide-arrow' data-bs-toggle='dropdown'>" +
                            "<i class='bx bx-dots-vertical-rounded'></i></button>" +
                            "<div class='dropdown-menu'><a class='dropdown-item' href='javascript:void(0);'>" + "<i class='bx bx-edit-alt me-1'></i> Edit</a>" + 
                            "<a class='dropdown-item' href='javascript:void(0);'><i class='bx bx-trash me-1'></i> Delete</a>" + "</div></div></td>"+
							"</tr>"
					);
				}
			},
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
		
		// 스크롤 고정 thaed
   	    $(".table-responsive").on('scroll', { passive: true }, function () {
   	        var scrollLeft = $(this).scrollLeft();
   	        $(".fixed-thead").css("left", -scrollLeft);
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
	
	// 공지사항 출력 
	function showNotice() { 
		$.ajax( 
				{ 
					url: "/main/mainNotice", 
					dataType: "html", 
					success: function(data) { 
						$("#notice").html(data); 
					} 
			 
			} 
		) 
	}; 
	
	 $(document).ready(function () {
       	
     });
</script>    
</body>
</html>    
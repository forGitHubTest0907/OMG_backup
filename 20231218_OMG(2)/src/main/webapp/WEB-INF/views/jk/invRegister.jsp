<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
$(document).ready(function() {
    // 페이지 로드 시 초기 데이터 로딩
    fetchDataAndRenderList();

    // 기준년월과 구분이 변경될 때마다 데이터 다시 로딩
    $('#monthSelect, #invType').change(function() {
        fetchDataAndRenderList();
    });

    function fetchDataAndRenderList() {
        var selectedMonth = $('#monthSelect').val().replace('-', '');
        var selectedType = $('#invType option:selected').val();

        console.log('Selected Month:', selectedMonth);
        console.log('Selected Type:', selectedType);

        // Ajax 요청을 통해 서버에서 데이터를 가져옵니다.
        $.ajax({
            url: '/monthData',
            method: 'GET',
            data: { month: selectedMonth, invType: selectedType },
            success: function(response) {
                console.log('Received data from server:', response);
                updateInventoryList(response);
            },
            error: function(error) {
                console.error('데이터를 불러오는 중 오류가 발생했습니다.', error);
            }
        });
    }

    function updateInventoryList(data) {
        var tbody = $('#inventoryTable tbody');
        tbody.empty(); // 테이블 초기화

        for (var i = 0; i < data.length; i++) {
            var regDate = new Date(data[i].reg_date);
            var formattedDate = regDate.toLocaleString('ko-KR', {
                year: 'numeric',
                month: 'numeric',
                day: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                second: 'numeric'
            });

            var row = '<tr>' +
                '<td style="width: 3px;">' + (i + 1) + '</td>' +
                '<td>' + data[i].ym + '</td>' +
                '<td>' + (data[i].inven === 0 ? '기초' : '기말') + '</td>' +
                '<td>' + data[i].code + '</td>' +
                '<td>' + data[i].name + '</td>' +
                '<td>' + data[i].cnt + '</td>' +
                '<td>' + '-' + '</td>' +
                '<td>' + data[i].mem_name + '</td>' +
                '<td>' + formattedDate + '</td>' + // 변경된 날짜 포맷 적용
                '</tr>';
            tbody.append(row);
        }
    }

    var timeout;

    $("#productCodeInput").on("input", function() {
        var code = $(this).val();
        var selectedMonth = $('#monthSelect').val().replace('-', '');
        console.log("code: " + code);
        console.log("Ajax request data:", { code: code, ym: selectedMonth });

        clearTimeout(timeout);

        timeout = setTimeout(function() {
            if (code.trim() !== "") {
                $.ajax({
                    type: "GET",
                    url: "/getItemDetails2",
                    data: { code: code, ym: selectedMonth },
                    dataType: 'json',
                    success: function(response) {
                        var memName = response.MEM_NAME;
                        var productName = response.NAME;

                        $("#memNameInput").val(memName);
                        $("#productNameInput").val(productName);

                        // 성공적으로 정보를 가져왔을 때 기존 오류 메시지를 지웁니다.
                        $("#errorMessage").text("");
                    },
                    error: function(xhr, status, error) {
                        // 에러가 발생했을 때
                        alert("에러가 발생했습니다: " + error);
                        console.error("에러가 발생했습니다: " + error);
                    }
                });
            }
        }, 500);
    }); 

    // 기초재고등록 폼이 제출될 때의 이벤트 처리
    $('#invRegisterForm').submit(function(event) {
        // input type="month"에서 선택된 날짜를 'YYYYMM' 형식으로 변환
        var selectedMonth = $('#monthSelect').val().replace('-', '');
        console.log('Form submitted. Selected Month:', selectedMonth);

        // 변환된 값을 다시 input에 설정
        $('#monthSelect').val(selectedMonth);
    });

    $("#productCodeInput2").on("input", function() {
        var code = $(this).val();
        var selectedMonth2 = $('#monthSelect2').val().replace('-', '');

        console.log("code: " + code);
        console.log("selectedMonth2: " + selectedMonth2);

        clearTimeout(timeout);

        timeout = setTimeout(function() {
            if (code.trim() !== "") {
                $.ajax({
                    type: "GET",
                    url: "/getItemDetails",
                    data: { code: code, ym: selectedMonth2 },
                    dataType: 'json',
                    success: function(response) {
                        var memName = response.MEM_NAME;
                        var productName = response.NAME;
                        var cnt2 = response.CNT;

                        $("#memNameInput2").val(memName);
                        $("#productNameInput2").val(productName);
                        $("#cnt2").val(cnt2);

                        // 성공적으로 정보를 가져왔을 때 기존 오류 메시지를 지웁니다.
                        $("#errorMessage").text("");
                    },
                    error: function(xhr, status, error) {
                        // 에러가 발생했을 때
                        alert("에러가 발생했습니다: " + error);
                        console.error("에러가 발생했습니다: " + error);
                    }
                });
            }
        }, 500);
    });
});


</script>


<%@ include file="../common/header.jsp" %>
<body>
<%@ include file="../common/menu.jsp" %>
	<div class="container-xxl flex-grow-1 container-p-y">
       <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">재고관리 /</span> 기초재고관리</h4>
		<div class="card mb-4">
			<h5 class="card-header">기초재고</h5>
				<div class="card-body">
					<div class="row">
						<div class="mb-3 col-md-6">
                        <label for="html5-date-input" class="col-md-2 col-form-label">기준년월</label>
                          <input class="form-control" type="month" value="2021-06-18" id="monthSelect" name="month">
                        </div>
                         <div class="mb-3 col-md-6">
                         <label for="html5-date-input" class="col-md-2 col-form-label">구분</label>
                         <select id="invType" class="select2 form-select">
                              <option value="ALL">전체</option>
                              <option value="OPENING">기초</option>
                              <option value="CLOSING">기말</option>
                         </select>
                         </div>
                      </div>

                     <div class="row">
                     
                     </div>
 					</div>
		<!-- 재고리스트 -->
 			<div class="card">
                <h5 class="card-header">재고리스트</h5>
                <div class="card-body">
                <div class="table-responsive text-nowrap">
                  <table class="table table-bordered" id="inventoryTable">
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th>년월</th>
                        <th>구분</th>
                        <th>품번</th>
                        <th>품명</th>
                        <th>수량</th>
                        <th>조정수량</th>
                        <th>담당자</th>
                        <th>등록일</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                         </tbody>
                  </table>
                  </div>
                </div>
              </div>
 			</div>
 			
 			<!-- 재고리스트 -->
 			
        		 <div class="demo-inline-spacing mt-3">
                        <div class="list-group list-group-horizontal-md text-md-center">
                          <a class="list-group-item list-group-item-action active" id="home-list-item" data-bs-toggle="list" href="#horizontal-home">기초재고등록</a>
                          <a class="list-group-item list-group-item-action" id="profile-list-item" data-bs-toggle="list" href="#horizontal-profile">기초재고조정</a>

                        </div>
                  
                          <div class="tab-pane fade  active show" id="horizontal-home">
                                <div class="card">
                  
               <form action="invRegister" method="post" id="invRegisterForm">
		 				 <div class="card-body">
							<div class="row">
								<div class="mb-3 col-md-6">
		                        <label for="html5-date-input" class="col-md-2 col-form-label">기준년월</label>
		                          <input class="form-control" type="month" id="monthSelect" name="monthSelect" >
		                        </div>
		                         <div class="mb-3 col-md-6">
		                         </div>
		                      </div>
		               <div class="row"> 
		               <div class="mb-3 col-md-6">      
		               <label class="form-label">제품코드</label>
                        <input type="number" class="form-control" id="productCodeInput" placeholder="예시)1101" name="code" aria-describedby="defaultFormControlHelp"/>
	                       <div id="defaultFormControlHelp" class="form-text">
                          	제품 코드를 입력하시면 제품명이 출력됩니다.
                        	</div>
                        	</div>
                        	<div class="mb-3 col-md-6">     
                        <label class="form-label">제품명</label>
                        <input type="text" class="form-control" id="productNameInput" placeholder="" aria-describedby="defaultFormControlHelp" readonly/>
	                    
                       </div> 
                       </div>
                        <div class="row"> 
		               <div class="mb-3 col-md-6">      
		               <label class="form-label">수량</label>
                        <input type="number" class="form-control" id="cnt" placeholder="" name="cnt" aria-describedby="defaultFormControlHelp"/>
                        	</div>
                        	<div class="mb-3 col-md-6">     
                        <label class="form-label">담당자</label>
                        <input type="text" class="form-control" id="memNameInput" placeholder="" aria-describedby="defaultFormControlHelp" readonly/>
	                    
                       </div> 
                       </div>
                      <div class="dt-buttons text-end">
					    <button id="beginningInvReg" class="dt-button btn btn-primary" tabindex="0" aria-controls="DataTables_Table_0" type="submit">
					        <span><i class="bx bx-plus me-md-1"></i><span class="d-md-inline-block d-none">등록</span></span>
					    </button>
					</div>
					 </div>
					  </form>
			 					</div>
		 					                            	
                          </div>
                         
                         
                         
<div class="tab-pane fade" id="horizontal-profile">
    <div class="card">
        <form action="updateInv" method="post" id="updateInv">
            <div class="card-body">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label for="html5-date-input" class="col-md-2 col-form-label">기준년월</label>
                        <input class="form-control" type="month" id="monthSelect2" name="monthSelect2">
                    </div>
                    <div class="mb-3 col-md-6">
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">제품코드</label>
                        <input type="number" class="form-control" id="productCodeInput2" placeholder="예시)1101" name="code" aria-describedby="defaultFormControlHelp" />
                        <div id="defaultFormControlHelp" class="form-text">
                            제품 코드를 입력하시면 제품명이 출력됩니다.
                        </div>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">제품명</label>
                        <input type="text" class="form-control" id="productNameInput2" placeholder="" aria-describedby="defaultFormControlHelp" readonly />
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">수량</label>
                        <input type="number" class="form-control" id="cnt2" placeholder="" name="cnt" aria-describedby="defaultFormControlHelp" />
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">담당자</label>
                        <input type="text" class="form-control" id="memNameInput2" placeholder="" aria-describedby="defaultFormControlHelp" readonly />
                    </div>
                </div>
                <div class="dt-buttons text-end">
                    <button id="updateInv" class="dt-button btn btn-primary" tabindex="0" aria-controls="DataTables_Table_0" type="submit">
                        <span><i class="bx bx-plus me-md-1"></i><span class="d-md-inline-block d-none">수정완료</span></span>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</div>

</body>
<script>
  $(document).ready(function() {
    // 기초재고등록 탭 버튼 클릭 시
    $('#home-list-item').click(function() {
      // 기초재고등록 폼 표시, 기초재고조정 폼 숨김
      $('#invRegisterForm').show();
      $('#adjustmentForm').hide();
    });

    // 기초재고조정 탭 버튼 클릭 시
    $('#profile-list-item').click(function() {
      // 기초재고조정 폼 표시, 기초재고등록 폼 숨김
      $('#adjustmentForm').show();
      $('#invRegisterForm').hide();
    });
  });
  
  
</script>
<%@ include file="../common/footer.jsp" %>
</html>
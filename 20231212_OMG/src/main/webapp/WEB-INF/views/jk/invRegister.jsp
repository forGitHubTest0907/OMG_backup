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
    	    var row = '<tr>' +
    	 	  '<td style="width: 3px;">' + (i + 1) + '</td>' + 
    	      '<td>' + data[i].ym + '</td>' +
    	      '<td>' + (data[i].inven === 0 ? '기초' : '기말') + '</td>' +
    	      '<td>' + data[i].code + '</td>' +
    	      '<td>' +  + '</td>' +
    	      '<td>' + data[i].cnt + '</td>' +
    	      '<td>' +  + '</td>' +
    	      '<td>' +  + '</td>' +
    	      '<td>' + data[i].reg_date + '</td>' +
    	      '</tr>';
    	    tbody.append(row);
    	  }
    	}

  });
</script>


<%@ include file="../common/header.jsp" %>
<body>
<%@ include file="../common/menu.jsp" %>
	<div class="container-xxl flex-grow-1 container-p-y">
       <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">재고관리 /</span> 기초재고/재고조정등록</h4>
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
                          <a class="list-group-item list-group-item-action" id="messages-list-item" data-bs-toggle="list" href="#horizontal-messages">입고조정</a>
                          <a class="list-group-item list-group-item-action " id="settings-list-item" data-bs-toggle="list" href="#horizontal-settings">출고조정</a>
                        </div>
                        <div class="tab-content px-0 mt-0">
                          <div class="tab-pane fade  active show" id="horizontal-home">
		 				기초재고등록폼
		 				 <div class="card-body">
							<div class="row">
								<div class="mb-3 col-md-6">
		                        <label for="html5-date-input" class="col-md-2 col-form-label">기준년월</label>
		                          <input class="form-control" type="month" value="2021-06-18" id="monthSelect">
		                        </div>
		                         <div class="mb-3 col-md-6">
		                         <label for="html5-date-input" class="col-md-2 col-form-label">구분</label>
		                         <select id="invType" class="select2 form-select">
		                              <option value="">전체</option>
		                              <option value="Opening">기초</option>
		                              <option value="Closing">기말</option>
		                         </select>
		                         </div>
		                      </div>
		 					</div>                            	
                          </div>
                          <div class="tab-pane fade" id="horizontal-profile">
                      			기초재고조정폼
                    
                  
                          </div>
                          <div class="tab-pane fade" id="horizontal-messages">
                          		입고조정폼
                          </div>
                          <div class="tab-pane fade" id="horizontal-settings">
                            	출고조정폼
                          </div>
                        </div>
                      </div>
					</div>
              


</body>
<%@ include file="../common/footer.jsp" %>
</html>
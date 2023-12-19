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
jQuery(document).ready(function() {
    // 페이지 로드 시 초기 데이터 로딩
    fetchDataAndRenderList();

    // 기준년월과 구분이 변경될 때마다 데이터 다시 로딩
    jQuery('#monthSelect, #IO_Type').change(function() {
        fetchDataAndRenderList();
    });

    function fetchDataAndRenderList() {
        var selectedMonth = jQuery('#monthSelect').val().replace('-', '');
        var selectedType = jQuery('#IO_Type option:selected').val();

        console.log('Selected Month:', selectedMonth);
        console.log('Selected Type:', selectedType);
        // Ajax 요청을 통해 서버에서 데이터를 가져옵니다.
        jQuery.ajax({
            url: '/getIOData',
            method: 'GET',
            data: { month: selectedMonth, IO_Type: selectedType },
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
       <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">재고관리 /</span>입고등록</h4>
		<div class="card mb-4">
			<h5 class="card-header">입고내역</h5>
				<div class="card-body">
					<div class="row">
						<div class="mb-3 col-md-6">
                        <label for="html5-date-input" class="col-md-2 col-form-label">기준년월</label>
                          <input class="form-control" type="month" value="2021-06-18" id="monthSelect" name="monthIOData">
                        </div>
                         <div class="mb-3 col-md-6">
                         <label for="html5-date-input" class="col-md-2 col-form-label">구분</label>
                         <select id="IO_Type" class="select2 form-select">
                              <option value="ALL">전체</option>
                              <option value="INBOUND">입고</option>
                              <option value="OUTBOUND">출고</option>
                         </select>
                         </div>
                      </div>
 					</div>

		<!-- 재고리스트 -->
 			<div class="card">
                <h5 class="card-header">입고내역</h5>
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
                          <a class="list-group-item list-group-item-action active" id="home-list-item" data-bs-toggle="list" href="#horizontal-home">입고등록</a>
                          <a class="list-group-item list-group-item-action" id="profile-list-item" data-bs-toggle="list" href="#horizontal-profile">출고등록</a>
                          <a class="list-group-item list-group-item-action" id="messages-list-item" data-bs-toggle="list" href="#horizontal-messages">입고조정</a>
                          <a class="list-group-item list-group-item-action " id="settings-list-item" data-bs-toggle="list" href="#horizontal-settings">출고조정</a>
                        </div>
                        <div class="tab-content px-0 mt-0">
                          
                          <div class="tab-pane fade  active show" id="horizontal-home">
                          <div class="card">
		 				 <div class="card-body">
							<div class="row align-items-end"> <!-- Using align-items-end to align items at the bottom of the container -->
    <div class="mb-3 col-md-3">
        <label for="html5-date-input" class="col-md-2 col-form-label">기준년월</label>
        <input class="form-control" type="month" value="2021-06-18" id="monthSelect">
    </div>
    <div class="mb-3 col-md-3">
        <label for="html5-date-input" class="col-md-2 col-form-label">구분</label>
        <select id="invType" class="select2 form-select">
            <option value="">전체</option>
            <option value="Opening">기초</option>
            <option value="Closing">기말</option>
        </select>
    </div>
    <div class="mb-3 col-md-3"> <!-- Adjusted column width to accommodate the button -->
        <button class="btn btn-outline-primary" type="button" onclick="searchButton()">검색</button>
    </div>
</div>
 <h5 class="card-header">발주리스트</h5>
                <div class="card-body">
                <div class="table-responsive text-nowrap">
                  <table class="table table-bordered" id="inventoryTable">
                    <thead>
                      <tr>
                        <td>No.</td>
						<td>제목</td>
						<td>회사명</td>
						<td>발주일</td>
						<td>발주자</td>
						<td>상품수</td>
						<td>총수량</td>
						<td>상태</td>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <tbody>
				    	<c:set value="${totalPur }" var="num"/>
				    	<c:forEach items="${purList }" var="purList">
							<tr>
								<td>${num }</td>
								<td class="text-start"><a href="/purDtail?pur_date=${purList.pur_date }&custcode=${purList.custcode }">${purList.title }</a></td>
								<td>${purList.company }</td>
								<td>${purList.pur_date }</td>
								<td>${purList.appli_name}</td>
								<td>${purList.totalType}</td>
								<td>${purList.totalQty}개</td>
								<td><fmt:formatNumber value="${purList.totalPrice}" pattern="#,###"/>원</td>
								<td>
									<c:choose>
										<c:when test="${purList.pur_status == 0}">진행중</c:when>
										<c:when test="${purList.pur_status == 1}">완료</c:when>
										<c:when test="${purList.pur_status == 2}">입고완료</c:when>
									</c:choose>
								</td>
							</tr>
							<c:set var="num" value="${num-1 }"></c:set>
						</c:forEach>
				    </tbody>
                         </tbody>
                  </table>
                  </div>
                </div>




		 					</div>                            	
                          </div>
                          <div class="tab-pane fade" id="horizontal-profile">
                      			입출고관리폼
                    
                  
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
					</div>
              


</body>
<%@ include file="../common/footer.jsp" %>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>입고등록</title>

</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>

$(document).ready(function() {
    // 페이지 로드 시 초기 데이터 로딩

    // 입고 버튼 클릭 이벤트 핸들러
    $('button.inbound-btn').on('click', function() {
        // 선택한 특정 데이터 가져오기 (예: 특정 발주서의 pur_date 및 custcode)
        var pur_date = $(this).data('pur_date');
        var custcode = $(this).data('custcode');
        console.log('pur_date:', pur_date);
        console.log('custcode:', custcode);
        
        // Ajax 요청을 통해 서버에 데이터 전송
        $.ajax({
            url: '/inboundRegister', // 실제 서버 측 엔드포인트로 수정
            method: 'POST', // 또는 'GET' 등 필요에 따라 변경
            contentType: 'application/json', // JSON 형식으로 데이터 전송
            data: JSON.stringify({ pur_date: pur_date, custcode: custcode }),
            dataType: 'json', // 서버 응답 형식을 JSON으로 처리
            success: function(response) {
                console.log('서버 응답:', response);
                // 서버 응답에 따른 후속 처리 (예: 페이지 리로드 또는 알림 메시지 표시)
                location.reload(); // 예시로 페이지 리로드
            },
            error: function(error) {
                console.error('서버 요청 중 오류 발생:', error);
                // 오류 처리 로직 추가 (예: 사용자에게 오류 메시지 표시)
            }
        });
    });
});

</script>
<body>
    <%@ include file="../common/header.jsp" %>
    <%@ include file="../common/menu.jsp" %>

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4">
            <span class="text-muted fw-light">재고관리 /</span>입고등록
        </h4>

        <!-- 재고리스트 -->
        <div class="demo-inline-spacing mt-3">
            <div class="list-group list-group-horizontal-md text-md-center">
                <a class="list-group-item list-group-item-action active" id="home-list-item" data-bs-toggle="list" href="#horizontal-home">입고등록</a>
                <a class="list-group-item list-group-item-action" id="messages-list-item" data-bs-toggle="list" href="#horizontal-messages">입고조정</a>
            </div>

            <div class="tab-content px-0 mt-0" style="padding-top: 0px;padding-bottom: 0px;margin-top: 1px;">
                <div class="tab-pane fade active show" id="horizontal-home">
                    <div class="card">
                  
                        <h5 class="card-header">발주서 선택</h5>
                          <div class="card-body">
                            <div class="row align-items-end" style="padding-left: 23px;">
                                <div class="mb-3 col-md-3">
                                    <label for="thtml5-date-input" class="col-md-2 col-form-label">날짜</label>
                                    <input class="form-control" type="date" id="srchDate" value="${srchDate }" pattern="YY/MM/DD">
                                </div>
                                <div class="mb-3 col-md-3">
                                    <label for="html5-date-input" class="col-md-2 col-form-label">업체명</label>
                                    
                                   <select id="srchCompany" class="select2 form-select">
										<option value="all" selected="selected">전체</option>
										<c:forEach items="${pur_custList }" var="pur_custList">
											<c:choose>
												<c:when test="${pur_custList.custcode == srchCompany }">
													<option value="${pur_custList.custcode }" selected="selected">${pur_custList.company }</option>
												</c:when>
												<c:otherwise>
													<option value="${pur_custList.custcode }">${pur_custList.company }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
                                </div>
                                <div class="mb-3 col-md-3">
                                    <button class="btn btn-outline-primary" type="button" onclick="srch()">검색</button>
                                </div>
                            </div>
                            <h5 class="card-header">발주리스트</h5>
                            <div class="card-body">
                                <div class="table-responsive text-nowrap" style="height:500px;">
                                    <table class="table table-bordered" id="purListTable">
                                        <thead class="table-primary">
                                            <tr>
                                               	<td class="text-center">No.</td>
												<td class="text-center">제목</td>
												<td class="text-center">업체명</td>
												<td class="text-center">발주일</td>
												<td class="text-center">발주자</td>
												<td class="text-center">상품수</td>
												<td class="text-center">총수량</td>
												<td class="text-center">총금액</td>
												<td class="text-center">상태</td>
                                            </tr>
                                        </thead>
                                       	<c:set value="${totalPur }" var="num"/>
				    	<c:forEach items="${purList }" var="purList">
							<tr>
								<td class="text-center">${num }</td>
								<td class="text-start"><a href="/purDtail?pur_date=${purList.pur_date }&custcode=${purList.custcode }">${purList.title }</a></td>
								<td class="text-center">${purList.company }</td>
								<td class="text-center">${purList.pur_date }</td>
								<td class="text-center">${purList.appli_name}</td>
								<td class="text-center">${purList.totalType}</td>
								<td class="text-center">${purList.totalQty}개</td>
								<td class="text-center"><fmt:formatNumber value="${purList.totalPrice}" pattern="#,###"/>원</td>
								 <td class="text-center">
        <!-- pur_status가 0이면 "진행중" 출력 -->
        <c:if test="${purList.pur_status == 0}"><span class="badge bg-label-primary me-1">진행중</span></c:if>

        <!-- pur_status가 1이면 "입고" 버튼 생성 -->
        <c:if test="${purList.pur_status == 1}">
              <button class="btn btn-outline-primary inbound-btn" type="button" data-pur_date="${purList.pur_date}" data-custcode="${purList.custcode}">
                                  입고
                </button>
        </c:if>

        <!-- pur_status가 2이면 "입고완료" 출력 -->
        <c:if test="${purList.pur_status == 2}"><span class="badge bg-label-success me-1">입고완료</span></c:if>
    </td>

								
							</tr>
								<c:set var="num" value="${num-1 }"></c:set>
						</c:forEach>
			
                                      
                                    </table>
                                    
                                </div>
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
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="card mb-4">
            <h5 class="card-header">입고내역</h5>
            <div class="card-body">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label for="html5-date-input" class="col-md-2 col-form-label">기준년월</label>
                        <input class="form-control" type="month" value="2021-06-18" id="monthSelect" name="monthIOData">
                    </div>
<!--                     <div class="mb-3 col-md-6">
                        <label for="html5-date-input" class="col-md-2 col-form-label">구분</label>
                        <select id="IO_Type" class="select2 form-select">
                            <option value="ALL">전체</option>
                            <option value="INBOUND">입고</option>
                            <option value="OUTBOUND">출고</option>
                        </select>
                    </div> -->
                </div>
            </div>

            <!-- 재고리스트 -->
            <div class="card">
                <h5 class="card-header">입고내역</h5>
                <div class="card-body">
                    <div class="table-responsive text-nowrap" style="height:500px;" >
                        <table class="table table-bordered" id="inventoryTable">
                            <thead class="table-secondary">
                                <tr>
                                    <th>No.</th>
                                    <th>발주일</th>
                                    <th>구분</th>
                                    <th>품번</th>
                                    <th>품명</th>
                                    <th>업체명</th>
                                    <th>수량</th>
                                    <th>담당자</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody class="table-border-bottom-0" >
                            <c:set value="${totalPur }" var="num"/>
				    	<c:forEach items="${purList }" var="purList">
							<tr>
								<td class="text-center">${num }</td>
								<td class="text-start"><a href="/purDtail?pur_date=${purList.pur_date }&custcode=${purList.custcode }">${purList.title }</a></td>
								<td class="text-center">${purList.company }</td>
								<td class="text-center">${purList.pur_date }</td>
								<td class="text-center">${purList.appli_name}</td>
								<td class="text-center">${purList.totalType}</td>
								<td class="text-center">${purList.totalQty}개</td>
								<td class="text-center"><fmt:formatNumber value="${purList.totalPrice}" pattern="#,###"/>원</td>
								 <td class="text-center">
        <!-- pur_status가 0이면 "진행중" 출력 -->
        <c:if test="${purList.pur_status == 0}"><span class="badge bg-label-primary me-1">진행중</span></c:if>

        <!-- pur_status가 1이면 "입고" 버튼 생성 -->
        <c:if test="${purList.pur_status == 1}">
              <button class="btn btn-outline-primary inbound-btn" type="button" data-pur_date="${purList.pur_date}" data-custcode="${purList.custcode}">
                                  입고
                </button>
        </c:if>

        <!-- pur_status가 2이면 "입고완료" 출력 -->
        <c:if test="${purList.pur_status == 2}"><span class="badge bg-label-success me-1">입고완료</span></c:if>
    </td>

								
							</tr>
								<c:set var="num" value="${num-1 }"></c:set>
						</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>
    <script type="text/javascript">
    function paging(currentPage){
		var srchcompany = $("#srchCompany").val();
		var srchDate = $("#srchDate").val();
		var moveUrl = "purList?currentPage="+currentPage;
		
		// 검색 후 페이징(날짜 )
		if(srchDate != null && srchDate != ""){
			var subDate = dateFormatt(srchDate);
			moveUrl += "&pur_date="+subDate;
		}
		// 검색 후 페이징 (회사)
		if(srchcompany != "all"){
			moveUrl += "&custcode="+srchcompany;
		}
		
		location.href=moveUrl;
	}
	
	function srch(){
		//검색 구현
		var srchcompany = $("#srchCompany").val();  // 회사
		var srchDate = $("#srchDate").val();		// 날짜
		var moveUrl = "purList";
		// 날짜가 선택 됐을 때 
		if(srchDate != null && srchDate != ""){
			var subDate = dateFormatt(srchDate);
			moveUrl += "?pur_date="+subDate;
			// 회사도 선택 됐을 때 
			if(srchcompany != "all"){
				moveUrl += "&custcode="+srchcompany;
			}
		} else if(srchcompany != "all"){ // 회사만 선택 됐을 때
			moveUrl += "?custcode="+srchcompany;
		}
		
		location.href=moveUrl;
	}
	
	function dateFormatt(inputDate){
		var date = new Date(inputDate);
		var year = date.getFullYear().toString().substr(2,2);
		var month = ('0' + (date.getMonth() + 1)).slice(-2);
		var day = ('0' + date.getDate()).slice(-2);
		return year + '/' + month + '/' + day;
	}
</script>
</body>
</html>

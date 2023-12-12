<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">고객지원/</span> 문의
	</h4>
	<div class="card">

		<!-- 검색 필터 부분 -->
		<div class="row mx-1 mt-2">
			<div class="col-12 col-md-6 d-flex align-items-center justify-content-center justify-content-md-start gap-3">
				<div class="dataTables_length" id="DataTables_Table_0_length">
					<label><select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select">
							<option value="10">10</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select></label>
				</div>
				<div class="dt-action-buttons text-xl-end text-lg-start text-md-end text-start mt-md-0 mt-3">
					<div class="dt-buttons">
						<button class="dt-button btn btn-primary" tabindex="0" aria-controls="DataTables_Table_0" type="button" onclick="location.href='/qna/write'">
							<span><i class="bx bx-plus me-md-1"></i><span class="d-md-inline-block d-none">문의하기</span></span>
						</button>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 d-flex align-items-center justify-content-end flex-column flex-md-row pe-3 gap-md-3">
				<div id="DataTables_Table_0_filter" class="dataTables_filter">
					<label><input type="search" class="form-control" placeholder="검색" aria-controls="DataTables_Table_0"></label>
				</div>
				<div class="invoice_status mb-3 mb-md-0">
					<select id="UserRole" class="form-select">
						<option value="">Select Status</option>
						<option value="Downloaded" class="text-capitalize">Downloaded</option>
						<option value="Draft" class="text-capitalize">Draft</option>
						<option value="Paid" class="text-capitalize">Paid</option>
						<option value="Partial Payment" class="text-capitalize">Partial Payment</option>
						<option value="Past Due" class="text-capitalize">Past Due</option>
						<option value="Sent" class="text-capitalize">Sent</option>
					</select>
				</div>
			</div>
		</div>
		<div class="table-responsive mt-2 mb-3">
			<c:set var="num" value="${page.total-page.start+1 }"></c:set>
			<table class="table table-hover border-top">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>답변상태</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="QnA" items="${QnAList }" varStatus="QnAStts">
						<tr>
							<td>
								<!-- 							<i class="fab fa-angular fa-lg text-danger me-3"></i> <span class="fw-medium">Angular Project</span> -->
								${QnA.brd_id }
							</td>
							<td>${QnA.title }</td>
							<td>${QnA.mem_name }
								<!-- 							<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center"> -->
								<!-- 								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Lilian Fuller"><img src="assets/img/avatars/5.png" alt="Avatar" class="rounded-circle"></li> -->
								<!-- 								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Sophia Wilkerson"><img src="assets/img/avatars/6.png" alt="Avatar" class="rounded-circle"></li> -->
								<!-- 								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Christina Parker"><img src="assets/img/avatars/7.png" alt="Avatar" class="rounded-circle"></li> -->
								<!-- 							</ul> -->
							</td>
							<td>
								<c:if test="${QnA.qna_stts == 0 }">
									<span class="badge bg-label-warning me-1">답변대기</span>
								</c:if>
								<c:if test="${QnA.qna_stts == 1 }">
									<span class="badge bg-label-primary me-1">답변완료</span>
								</c:if>
							</td>
							<td>${QnA.reg_date }</td>
							<td>${QnA.view_cnt }</td>
						</tr>
						<c:set var="num" value="${num -1 }"></c:set>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 페이지 네이션 -->
		<div class="row mx-2">
			<div class="col-sm-12 col-md-6">
				<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 to 10 of 50 entries</div>
			</div>
			<div class="col-sm-12 col-md-6 d-flex justify-content-end">
				<div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
					<ul class="pagination">
						<li class="paginate_button page-item"><a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link"><<</a></li>
						<li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">1</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="1" tabindex="0" class="page-link">2</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="2" tabindex="0" class="page-link">3</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="3" tabindex="0" class="page-link">4</a></li>
						<li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="4" tabindex="0" class="page-link">5</a></li>
						<li class="paginate_button page-item"><a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">>></a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
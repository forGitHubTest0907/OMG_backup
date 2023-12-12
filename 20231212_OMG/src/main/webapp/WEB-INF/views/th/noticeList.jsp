<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">고객지원/</span> 공지사항
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
						<button class="dt-button btn btn-primary" tabindex="0" aria-controls="DataTables_Table_0" type="button" onclick="location.href='/notice/write'">
							<span><i class="bx bx-plus me-md-1"></i><span class="d-md-inline-block d-none">공지글 작성</span></span>
						</button>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 d-flex align-items-center justify-content-end flex-column flex-md-row pe-3 gap-md-3">
				<div id="DataTables_Table_0_filter" class="dataTables_filter">
					<label><input type="search" class="form-control" placeholder="검색" aria-controls="DataTables_Table_0"></label>
				</div>
			</div>
		</div>
		<div class="table-responsive mt-2 mb-3">
			<table class="table table-hover border-top">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<i class="fab fa-angular fa-lg text-danger me-3"></i> <span class="fw-medium">Angular Project</span>
						</td>
						<td>Albert Cook</td>
						<td>
							<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Lilian Fuller"><img src="assets/img/avatars/5.png" alt="Avatar" class="rounded-circle"></li>
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Sophia Wilkerson"><img src="assets/img/avatars/6.png" alt="Avatar" class="rounded-circle"></li>
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Christina Parker"><img src="assets/img/avatars/7.png" alt="Avatar" class="rounded-circle"></li>
							</ul>
						</td>
						<td>
							<span class="badge bg-label-primary me-1">Active</span>
						</td>
						<td>
							<div class="dropdown">
								<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
									<i class="bx bx-dots-vertical-rounded"></i>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="javascript:void(0);">
										<i class="bx bx-edit-alt me-1"></i>Edit
									</a>
									<a class="dropdown-item" href="javascript:void(0);">
										<i class="bx bx-trash me-1"></i>Delete
									</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<i class="fab fa-react fa-lg text-info me-3"></i> <span class="fw-medium">React Project</span>
						</td>
						<td>Barry Hunter</td>
						<td>
							<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Lilian Fuller"><img src="assets/img/avatars/5.png" alt="Avatar" class="rounded-circle"></li>
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Sophia Wilkerson"><img src="assets/img/avatars/6.png" alt="Avatar" class="rounded-circle"></li>
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Christina Parker"><img src="assets/img/avatars/7.png" alt="Avatar" class="rounded-circle"></li>
							</ul>
						</td>
						<td>
							<span class="badge bg-label-success me-1">Completed</span>
						</td>
						<td>
							<div class="dropdown">
								<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
									<i class="bx bx-dots-vertical-rounded"></i>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="javascript:void(0);">
										<i class="bx bx-edit-alt me-1"></i>Edit
									</a>
									<a class="dropdown-item" href="javascript:void(0);">
										<i class="bx bx-trash me-1"></i>Delete
									</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<i class="fab fa-vuejs fa-lg text-success me-3"></i> <span class="fw-medium">VueJs Project</span>
						</td>
						<td>Trevor Baker</td>
						<td>
							<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Lilian Fuller"><img src="assets/img/avatars/5.png" alt="Avatar" class="rounded-circle"></li>
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Sophia Wilkerson"><img src="assets/img/avatars/6.png" alt="Avatar" class="rounded-circle"></li>
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Christina Parker"><img src="assets/img/avatars/7.png" alt="Avatar" class="rounded-circle"></li>
							</ul>
						</td>
						<td>
							<span class="badge bg-label-info me-1">Scheduled</span>
						</td>
						<td>
							<div class="dropdown">
								<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
									<i class="bx bx-dots-vertical-rounded"></i>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="javascript:void(0);">
										<i class="bx bx-edit-alt me-1"></i>Edit
									</a>
									<a class="dropdown-item" href="javascript:void(0);">
										<i class="bx bx-trash me-1"></i>Delete
									</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<i class="fab fa-bootstrap fa-lg text-primary me-3"></i> <span class="fw-medium">Bootstrap Project</span>
						</td>
						<td>Jerry Milton</td>
						<td>
							<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Lilian Fuller"><img src="assets/img/avatars/5.png" alt="Avatar" class="rounded-circle"></li>
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Sophia Wilkerson"><img src="assets/img/avatars/6.png" alt="Avatar" class="rounded-circle"></li>
								<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Christina Parker"><img src="assets/img/avatars/7.png" alt="Avatar" class="rounded-circle"></li>
							</ul>
						</td>
						<td>
							<span class="badge bg-label-warning me-1">Pending</span>
						</td>
						<td>
							<div class="dropdown">
								<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
									<i class="bx bx-dots-vertical-rounded"></i>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="javascript:void(0);">
										<i class="bx bx-edit-alt me-1"></i>Edit
									</a>
									<a class="dropdown-item" href="javascript:void(0);">
										<i class="bx bx-trash me-1"></i>Delete
									</a>
								</div>
							</div>
						</td>
					</tr>
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
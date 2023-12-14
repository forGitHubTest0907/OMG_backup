<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">고객지원/</span> 공지사항
	</h4>
		<form id="operForm" action="/board/modify" method="get">
			<input type="hidden" id="brd_id" name="brd_id" value="${notice.brd_id }">
		</form>
		<div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

			<div class="d-flex flex-column justify-content-center">
				<h4 class="mb-1 mt-3 mb-3">공지사항 </h4>
				
			</div>
			
			<div class="d-flex align-content-center flex-wrap gap-3 mb-3">
				<button data-oper='modify' class="btn btn-primary">수정하기</button>
				<button data-oper='list' class="btn btn-secondary">목록</button>
			</div>
						

			<div class="col-12">
				<div class="card mb-4">
					<div class="card-body">
						<div class="mb-3">
							<label class="form-label" for="ecommerce-product-name">게시글 번호</label>
							<input type="number" name="brd_id" value='<c:out value="${notice.brd_id }"/>' readonly class="form-control" id="ecommerce-product-name" placeholder="제목을 입력해주세요" aria-label="Product title">
						</div>
						<div class="mb-3">
							<label class="form-label" for="ecommerce-product-name">제목</label>
							<input type="text" name="title" value='<c:out value="${notice.title }"/>' readonly class="form-control" id="ecommerce-product-title" placeholder="제목을 입력해주세요" aria-label="Product title">
						</div>
						<div class="row mb-3">
							<div class="col-6">
								<label class="form-label" for="ecommerce-product-sku">작성자</label>
								<input type="text" name="mem_name" readonly value='<c:out value="${notice.mem_name }"/>'  class="form-control" id="ecommerce-product-sku" aria-label="Product SKU" >
							</div>
							<div class="col-6">
								<label class="form-label" for="ecommerce-product-sku">작성일</label>
								<input type="text" name="mem_name" readonly value='<c:out value="${notice.reg_date }"/>'  class="form-control" id="ecommerce-product-reg_date" aria-label="Product SKU" >
							</div>
						</div>

						<!-- Description -->
						<div class="mb-3">
							<label class="form-label">내용 </label>
							<textarea class="form-control" name="brd_cn" readonly id="exampleFormControlTextarea1" rows="15"><c:out value="${notice.brd_cn }"/></textarea>
						</div>

						<div class="mb-3">
							<label for="formFile" class="form-label">첨부파일</label>
							<input class="form-control" type="file" id="formFile">
						</div>

					</div>
				</div>
			</div>

		</div>
	


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- JS -->
	<script type="text/javascript">
	$(function(){
		
		var operForm = $("#operForm");
	
		$("button[data-oper='modify']").on("click", function(e){
			
			operForm.attr("action","/notice/modify").submit();
			
		});
		
		$("button[data-oper='list']").on("click", function(e){
				
			operForm.find("#brd_id").remove();
			operForm.attr("action","/notice/list").submit();
			operForm.submit();
			
		});
		
	});
	</script>
</body>
</html>
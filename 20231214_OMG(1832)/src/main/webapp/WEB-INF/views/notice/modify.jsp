<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">고객지원/</span> 공지사항
	</h4>
	<form role="form" action="/notice/modify" method="post">
		<div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

			<div class="d-flex flex-column justify-content-center">
				<h4 class="mb-1 mt-3">공지사항 작성</h4>
				<p class="text-muted">아래에 내용을 적어주세요</p>
			</div>
			
			<div class="d-flex align-content-center flex-wrap gap-3">
				<button type="submit" class="btn btn-primary" 	data-oper='modify'>수정하기</button>
				<button type="submit" class="btn btn-warning" 	data-oper='remove'>삭제</button>
				<button type="submit" class="btn btn-secondary" data-oper='list'  >목록</button>
			</div>


			<div class="col-12">
				<div class="card mb-4">
					<div class="card-body">
						<div class="mb-3">
							<label class="form-label" for="ecommerce-product-name">게시글 번호</label>
							<input type="number" name="brd_id" value="${notice.brd_id }" readonly class="form-control" id="ecommerce-product-name" placeholder="제목을 입력해주세요" aria-label="Product title">
						</div>
						<div class="mb-3">
							<label class="form-label" for="ecommerce-product-name">제목</label>
							<input type="text" name="title" value="${notice.title }" class="form-control" id="ecommerce-product-title" placeholder="제목을 입력해주세요" aria-label="Product title">
						</div>
						<div class="row mb-3">
							<div class="col-6">
								<label class="form-label" for="ecommerce-product-sku">작성자</label>
								<input type="text" name="mem_name" readonly value="${notice.mem_name }"  class="form-control" id="ecommerce-product-sku" aria-label="Product SKU" >
							</div>
							<div class="col-6">
								<label class="form-label" for="ecommerce-product-sku">작성일</label>
								<input type="text" name="mem_name" readonly value="${notice.reg_date }"  class="form-control" id="ecommerce-product-reg_date" aria-label="Product SKU" >
							</div>
						</div>

						<!-- Description -->
						<div class="mb-3">
							<label class="form-label">내용 </label>
							<textarea class="form-control" name="brd_cn" id="exampleFormControlTextarea1" rows="15">${notice.brd_cn }</textarea>
						</div>

						<div class="mb-3">
							<label for="formFile" class="form-label">첨부파일</label>
							<input class="form-control" type="file" id="formFile">
						</div>

					</div>
				</div>
			</div>

		</div>
	</form>
	
	<!-- JS -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script type="text/javascript">
		$(function(){
			
			var formObj = $("form");

			$('button').on("click", function(e){
				
				e.preventDefault();
				
				var operation = $(this).data("oper");				
			
				if(operation === 'remove' ){
					formObj.attr("action", "/notice/remove");
				} else if (operation === 'list'){
					// move to list
					formObj.attr("action", "/notice/list").attr("method","get");
					formObj.empty();
				}

				formObj.submit();
	
			});		
		});
	</script>
</body>
</html>
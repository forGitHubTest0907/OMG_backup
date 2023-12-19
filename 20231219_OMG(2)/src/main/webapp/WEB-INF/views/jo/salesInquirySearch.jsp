<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>salesInquiry content</title>
		<%@ include file="../common/header.jsp" %>
	</head>
<body>
<%@ include file="../common/menu.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<main class="col-10 overflow-auto p-0">
			<div>
					<h1>판매조회</h1>
			</div>
			
			<!-- Section1: Search Form -->
			<div class="container col-9 justify-content-center my-5">
				<form action="salesInquirySearch" method="GET" class="container justify-content-center">	
					<div class="col-12 my-4 d-flex align-items-center">
						<div class="col-4">
							<select name="search" class="form-select">
								<option value="s_company">거래처조회</option>
								<option value="s_item">제품조회</option>
							</select> 
							<input type="text" name="keyword" class="form-control" placeholder="keyword를 입력하세요">
							<button type="submit" class="btn btn-primary  col-2 mx-3">검색</button>
						</div>
					</div>
					<input type="hidden" name="currentPage" value="${page.currentPage}">	
				</form>
			</div>
												
			<!-- Section2: Table -->		
			<div class="container col-9 justify-content-center align-items-center mb-2 p-3 pt-0">
				<div class="container d-flex justify-content-end p-0">
					<button id="regist-btn" type="button" class="btn btn-primary btn-sm mb-4" onclick="location.href='../sales/salesInquiry'">전체</button>
					<button id="regist-btn" type="button" class="btn btn-primary btn-sm mb-4" onclick="location.href='../sales/salesInquirySort?sales_status=0'">진행</button>
					<button id="regist-btn" type="button" class="btn btn-primary btn-sm mb-4" onclick="location.href='../sales/salesInquirySort?sales_status=1'">완료</button>
					<button id="regist-btn" type="button" class="btn btn-primary btn-sm mb-4" onclick="location.href='../sales/salesInquirySort?sales_status=2'">취소</button>
				</div>
				<div class="container table-container p-4">
				<div class="table-responsive">
				<table style="border: 2px solid black; width: 100%" id="userTable" class="table table-md text-center p-3">
					<thead>
						<tr style="border: 2px solid black">
							<th scope="col" style="text-align: center;">No.</th>
							<th scope="col" style="text-align: center;">매출일자</th>
							<th scope="col" style="text-align: center;">제목</th>
							<th scope="col" style="text-align: center;">거래처</th>
							<th scope="col" style="text-align: center;">제품</th>
							<th scope="col" style="text-align: center;">총 금액</th>
							<th scope="col" style="text-align: center;">상태</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="num" value="${page.start}"/>
						<c:forEach var="salesInquirySearch" items="${salesInquirySearch}">
							<tr>
								<td style="text-align: center">${num}</td>
								<td style="text-align: center">${salesInquirySearch.sales_date}</td>
						  		<td style="text-align: center">${salesInquirySearch.title}</td>
								<td style="text-align: center">${salesInquirySearch.company}</td>
								<td style="text-align: center">${salesInquirySearch.name}</td>
								<td style="text-align: center">${salesInquirySearch.total_price}</td>
								<td style="text-align: center">${salesInquirySearch.sales_status}</td>
							</tr>
						<c:set var="num" value="${num + 1}"/>
						</c:forEach>
					</tbody>
				</table>
				</div>
				</div>
			</div>
			
			<!-- Section3: Paging -->
			<c:if test="${page.startPage > page.pageBlock }">
				<a href="salesInquirySearch?search=${search}&keyword=${keyword}&currentPage=${page.startPage-page.pageBlock }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
				<a href="salesInquirySearch?search=${search}&keyword=${keyword}&currentPage=${i}">[${i}]</a>
			</c:forEach>	
			<c:if test="${page.endPage < page.totalPage }">
				<a href="salesInquirySearch?search=${search}&keyword=${keyword}&currentPage=${page.startPage+page.pageBlock }">[다음]</a>
			</c:if>
						
		</main>
 	 </div>
  </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
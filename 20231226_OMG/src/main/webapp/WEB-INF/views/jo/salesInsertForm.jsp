<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../common/header.jsp" %>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
	<div>
		<h1>판매입력</h1>
	</div>
	<div class="my-5">
		<div class="" id="detail-main-container">
			<div class="container p-5" id="form-container">
			<form action="salesInsert" method="post">
				<div class="mb-3 ">
				  <label for="sales_date" class="form-label">매출일자</label>
				  <input type="text" class="form-control" name="sales_date" id="sales_date" required="required" pattern="\d{2}/\d{2}/\d{2}" placeholder="23/MM/DD">
				</div>
				<div class="mb-3 ">
				  <label for="title" class="form-label">제목</label>
				  <input type="text" class="form-control" name="title" id="title" required="required" placeholder="판매전표_2023YYMM_(주)XXX">
				</div>
				<div class="mb-3 ">
				  <label for="company" class="form-label">거래처명</label>
				  <input type="hidden" name="custstyle" value="1">
				  <select class="form-select" aria-label="custcode" name="custcode" required="required">
					<c:forEach var="custCode" items="${listCustCode}">
						<option value="${custCode.custcode}">${custCode.company}</option>
					</c:forEach>
				  </select>
				</div>
				<div class="mb-3 ">
				  <label for="ref" class="form-label">비고</label>
				  <textarea class="form-control" name="ref" id="ref" rows="5" ></textarea>
				</div>
																					
				<hr class="hr" />			
				
				<table style="border: 2px solid black; width: 100%" id="userTable" class="table table-md text-center p-3">
					<thead>
						<tr style="border: 2px solid black">
							<th scope="col" style="text-align: center;"></th>
							<th scope="col" style="text-align: center;">No.</th>
							<th scope="col" style="text-align: center;">제품코드</th>
							<th scope="col" style="text-align: center;">제품명</th>
							<th scope="col" style="text-align: center;">수량</th>
							<th scope="col" style="text-align: center;">가격</th>
							<th scope="col" style="text-align: center;">총 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="text-align: center"><input type="checkbox" name="check" value="check"></td>
							<td style="text-align: center">1</td>
							<td style="text-align: center"><input type="text" name="code"></td>
							<td style="text-align: center"><input type="text" name="name"></td>
							<td style="text-align: center"><input type="text" name="qty"></td>
							<td style="text-align: center"><input type="text" name="price"></td>
							<td style="text-align: center"><input type="text" name="total_price"></td>
						</tr>
					</tbody>
				 </table>
								 																	
			
			
			<div class="container d-flex justify-content-end p-0">
				<input type=submit id="regist-btn" class="btn btn-primary btn-sm mb-4" value="저장">
				<button id="regist-btn" type="button" class="btn btn-primary btn-sm mb-4" onclick="location.href='salesInquiry'">리스트</button>
			</div>
			
			</form>
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>
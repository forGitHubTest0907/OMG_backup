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
		<h1>판매수정</h1>
	</div>
	<div class="my-5">
		<div class="" id="detail-main-container">
			<div class="container p-5" id="form-container">
			<form action="salesUpdate" method="post">
				<div class="mb-3 ">
				  <label for="sales_date" class="form-label">매출일자</label>
				  <input type="text" class="form-control" name="sales_date" id="sales_date" value="${salesDetail.sales_date}" required="required" disabled>
				</div>
				<div class="mb-3 ">
				  <label for="title" class="form-label">제목</label>
				  <input type="text" class="form-control" name="title" id="title" value="${salesDetail.title}" required="required" >
				</div>
				<div class="mb-3 ">
				  <label for="company" class="form-label">거래처명</label>
				  <input type="hidden" name="custstyle" value="1">
				  <select class="form-select" aria-label="custcode" name="custcode" required="required" disabled>
					<c:forEach var="custCode" items="${listCustCode}">
						<option value="${custCode.custcode}" ${custCode.custcode == salesDetail.custcode? 'selected' : ''} >${custCode.company}</option>
					</c:forEach>
				  </select>
				</div>
				<div class="mb-3 ">
				  <label for="ref" class="form-label">비고</label>
				  <textarea class="form-control" name="ref" id="ref" rows="5">${salesDetail.ref}</textarea>
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
						<c:set var="num" value="${page.start}"/>   
						<c:forEach var="salesDetail" items="${salesDetailList}">
						   <tr>
								<td style="text-align: center"><input type="checkbox" name="check" value="check"></td>
								<td style="text-align: center">${num}</td>
								<td style="text-align: center"><input type="text" name="code" value="${salesDetail.code}"></td>
								<td style="text-align: center"><input type="text" name="name" value="${salesDetail.name}"></td>
								<td style="text-align: center"><input type="text" name="qty" value="${salesDetail.qty}"></td>
								<td style="text-align: center"><input type="text" name="price" value="${salesDetail.price}"></td>
								<td style="text-align: center"><input type="text" name="total_price" value="${salesDetail.total_price}"></td>
						   </tr>
						 <c:set var="num" value="${num+1}"/>  
	                    </c:forEach>
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
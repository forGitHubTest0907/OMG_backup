<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../common/header.jsp" %>
	<style>
		 #itemTable {
            border: 2px double black; /* 이중 실선 */
            width: 100%;
            border-collapse: collapse;
        }

        #itemTable thead tr {
            color: white;
            border-bottom: 2px solid black; /* 굵은 실선 */
        }

        #itemTable tbody tr {
            border-bottom: 1px solid black; /* 실선 */
        }

        #itemTable th, #itemTable td {
            border-right: 1px solid black; /* 실선 */
            padding: 8px;
            text-align: center;
        }
        
        .button-group {
       		 margin-top: -10px; /* 버튼을 위로 올리기 위해 음수 값으로 설정 */
    	}
    	
	</style>
	<script>
		// '제품추가'시 추가 행 생성
		function addRow() {
		    var table = document.getElementById("itemTable").getElementsByTagName('tbody')[0];
		    var newRow = table.insertRow(table.rows.length);
	
		    var cell1 = newRow.insertCell(0);
		    var cell2 = newRow.insertCell(1);
		    var cell3 = newRow.insertCell(2);
		    var cell4 = newRow.insertCell(3);
		    var cell5 = newRow.insertCell(4);
		    var cell6 = newRow.insertCell(5);
		    var cell7 = newRow.insertCell(6); // 추가된 열
	
		    cell1.innerHTML = '<input type="checkbox" name="rowCheck" value="rowCheck">';
		    cell2.innerHTML = table.rows.length; // No.
		    cell3.innerHTML = '<input type="text" name="code">';
		    cell4.innerHTML = '<select name="name" onchange="updateCodeAndPrice(this)">' +
		        			  '<option>선택</option>' +
		        			  '<c:forEach var="listProduct" items="${listProduct}">' +
		        			  '<option data-code="${listProduct.code}" data-price="${listProduct.output_price}">${listProduct.name}</option>' +
		        			  '</c:forEach>' +
		        			  '</select>';
		    cell5.innerHTML = '<input type="text" name="qty" oninput="calculateTotalPrice(this)">';
		    cell6.innerHTML = '<input type="text" name="price">';
		    cell7.innerHTML = '<input type="text" name="total_price">';
			
			// 새로 추가된 행의 데이터를 배열에 추가
	    	var rowData = {
		        code: '',
		        name: '',
		        qty: '',
		        price: '',
		        total_price: ''
		    };
	    	rowDataArray.push(rowData);
		}

		
	
		// 드롭다운 선택 시 "code"와 "price"를 업데이트
		function updateCodeAndPrice(selectElement) {
		    var selectedOption = selectElement.options[selectElement.selectedIndex];
		    var row = selectElement.parentNode.parentNode;
		    var codeInput = row.cells[2].getElementsByTagName('input')[0]; // 열 위치 수정
		    var priceInput = row.cells[5].getElementsByTagName('input')[0]; // 열 위치 수정
	
		    codeInput.value = selectedOption.getAttribute('data-code');
		    priceInput.value = selectedOption.getAttribute('data-price');
		    
		    // 선택된 행의 데이터를 배열에 업데이트
		    var index = row.rowIndex - 1; // 헤더 행을 제외한 실제 인덱스
		    rowDataArray[index].code = codeInput.value;
		    rowDataArray[index].price = priceInput.value;
		
		}
	
		// 수량 입력 시 총 금액 계산
		function calculateTotalPrice(inputElement) {
		    var row = inputElement.parentNode.parentNode;
		    var qty = row.cells[4].getElementsByTagName('input')[0].value; // 열 위치 수정
		    var price = row.cells[5].getElementsByTagName('input')[0].value;
		    var totalPriceInput = row.cells[6].getElementsByTagName('input')[0]; // 열 위치 수정
	
		    var total_price = parseInt(qty) * parseInt(price);
		    totalPriceInput.value = isNaN(total_price) ? '' : '￦' + total_price.toFixed();
		    
		    // 선택된 행의 데이터를 배열에 업데이트
		    var index = row.rowIndex - 1; // 헤더 행을 제외한 실제 인덱스
		    rowDataArray[index].qty = qty;
		    rowDataArray[index].total_price = total_price;
		
		}
	
		// 체크박스 전체 선택/해제 함수
		function checkAll(source) {
		    var checkboxes = document.getElementsByName('rowCheck');
		    for (var i = 0; i < checkboxes.length; i++) {
		        checkboxes[i].checked = source.checked;
		    }
		}
		
		// '저장' 버튼 클릭 시 서버로 데이터 전송
		function saveData() {
		    // 서버로 전송할 데이터 객체 생성
		    var sendData = {
		        sales_date: document.getElementById("sales_date").value, // 예시로 "sales_date" 필드 추가
		        title: document.getElementById("title").value, // 예시로 "title" 필드 추가
		        custcode: document.querySelector('[name="custcode"]').value, // 예시로 "custcode" 필드 추가
		        ref: document.getElementById("ref").value, // 예시로 "ref" 필드 추가
		        salesDetails: rowDataArray // 앞서 생성한 배열 추가
		    };

		    // AJAX를 사용하여 서버로 데이터 전송
		    // 여기서는 jQuery를 사용한 예시이며, 다른 방법으로도 가능합니다.
		    $.ajax({
		        type: "POST",
		        url: "salesInsert",
		        contentType: "application/json",
		        data: JSON.stringify(sendData),
		        success: function (response) {
		            // 서버 응답에 따른 처리
		            console.log(response);
		        },
		        error: function (error) {
		            console.error("Error during data submission:", error);
		        }
		    });
		}
	
		
	</script>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<main>
			<div>
		   		<h1>판매입력</h1>
			</div>
			
			<!-- Section1: Table -->
			<div>
				<div>
					<div>
					<form id="salesForm" action="salesInsert" method="post">
						<div class="mb-3 ">
						  <label for="sales_date" class="form-label" style="font-size: 15px;">매출일자</label>
						  <input type="text" class="form-control" name="sales_date" id="sales_date" required="required" pattern="\d{2}/\d{2}/\d{2}" placeholder="23/MM/DD">
						</div>
						<div class="mb-3 ">
						  <label for="title" class="form-label" style="font-size: 15px;">제목</label>
						  <input type="text" class="form-control" name="title" id="title" required="required" placeholder="판매전표_2023YYMM_(주)XXX">
						</div>
						<div class="mb-3 ">
						  <label for="company" class="form-label" style="font-size: 15px;">거래처명</label>
						  <input type="hidden" name="custstyle" value="1">
						  <select class="form-select" aria-label="custcode" name="custcode" required="required">
							<c:forEach var="custCode" items="${listCustCode}">
								<option value="${custCode.custcode}">${custCode.company}</option>
							</c:forEach>
						  </select>
						</div>
						<div class="mb-3 ">
						  <label for="ref" class="form-label" style="font-size: 15px;">비고</label>
						  <textarea class="form-control" name="ref" id="ref" rows="5" ></textarea>
						</div>
																							
						<hr class="hr" />			
						
						<table id="itemTable" class="table table-md text-center p-3">
							<thead>
								<tr style="border: 2px solid black; background-color: #E1E2FF; color: #566A7F;">
									<th scope="col"><input type="checkbox" name="allCheck" id="allCheck" onchange="checkAll(this)"/></th>
									<th scope="col">No.</th>
									<th scope="col">제품코드</th>
									<th scope="col">제품명</th>
									<th scope="col">수량</th>
									<th scope="col">가격</th>
									<th scope="col">총 금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="rowCheck" value="rowCheck"></td>
									<td>1</td>
									<td><input type="text" name="code"></td>
									<td>
										<select name="name" onchange="updateCodeAndPrice(this)">
											<option>선택</option>
											<c:forEach var="listProduct" items="${listProduct}">
												<option data-code="${listProduct.code}" data-price="${listProduct.output_price}">${listProduct.name}</option>
											</c:forEach>	
										</select>
									</td>
									<td><input type="text" name="qty" oninput="calculateTotalPrice(this)"></td>
									<td><input type="text" name="price"></td>
									<td><input type="text" name="total_price"></td>
								</tr>
							</tbody>
						 </table>
					
					<div class="button-group">
						<button type="button" class="btn btn-primary btn-sm mb-1" onclick="addRow()">제품추가</button>
						<input type=submit id="regist-btn" class="btn btn-primary btn-sm mb-1" value="저장">
						<button type="button" class="btn btn-primary btn-sm mb-1" onclick="location.href='salesInquiry'">리스트</button>
					</div>
						
						</form>
						</div>
					</div>
				</div>
				
			</main>
	 	 </div>
	  </div>				
<%@ include file="../common/footer.jsp" %>	
</body>
</html>
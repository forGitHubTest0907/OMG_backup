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
		    
	
		    cell1.innerHTML = '<input type="checkbox" name="rowCheck" value="rowCheck">';
		    cell2.innerHTML = '<input type="text" name="code">';
		    cell3.innerHTML = '<select name="name" onchange="updateCodeAndPrice(this)">' +
		        			  '<option>선택</option>' +
		        			  '<c:forEach var="listProduct" items="${listProduct}">' +
		        			  '<option data-code="${listProduct.code}" data-price="${listProduct.output_price}">${listProduct.name}</option>' +
		        			  '</c:forEach>' +
		        			  '</select>';
		    cell4.innerHTML = '<input type="text" name="qty" oninput="calculateTotalPrice(this)">';
		    cell5.innerHTML = '<input type="text" name="price">';
		    cell6.innerHTML = '<input type="text" name="total_price">';
			
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
		
		// 추가행 삭제
		function removeRow() {
			  var table = document.getElementById("itemTable").getElementsByTagName('tbody')[0];
			  var checkboxes = table.querySelectorAll('input[name="rowCheck"]');
			  var rowsToRemove = [];

			  // 체크된 체크박스를 찾아서 해당 행을 rowsToRemove 배열에 추가합니다.
			  checkboxes.forEach(function(checkbox) {
			    if (checkbox.checked) {
			      var row = checkbox.parentNode.parentNode;
			      rowsToRemove.push(row);
			    }
			  });

			  // rowsToRemove 배열에 있는 행을 테이블에서 제거합니다.
			  rowsToRemove.forEach(function(row) {
			    table.removeChild(row);
			  });
			}
		
		
		// 드롭다운 선택 시 "code"와 "price"를 업데이트
		function updateCodeAndPrice(selectElement) {
		    var selectedOption = selectElement.options[selectElement.selectedIndex];
		    var row = selectElement.parentNode.parentNode;
		    var codeInput = row.cells[1].getElementsByTagName('input')[0]; 
		    var priceInput = row.cells[4].getElementsByTagName('input')[0]; 
	
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
		    var qty = row.cells[3].getElementsByTagName('input')[0].value; 
		    var price = row.cells[4].getElementsByTagName('input')[0].value;
		    var totalPriceInput = row.cells[5].getElementsByTagName('input')[0];
	
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
		
		function saveData() {
		    // Sales 객체 생성
		    var salesData = {
		        sales_date: document.getElementById("sales_date").value,
		        title: document.getElementById("title").value,
		        custcode: document.querySelector('[name="custcode"]').value,
		        ref: document.getElementById("ref").value
		    };

		    // SalesDetails 배열 생성
		    var salesDetailsData = [];
		    
		    // SalesDetails 데이터 수집
		    var rows = document.querySelectorAll("#itemTable tbody tr");
		    
		    
		    rows.forEach(function(row) {
		        var productCode = row.querySelector('input[name="code"]');
		        var quantity = row.querySelector('input[name="qty"]');
		        var price = row.querySelector('input[name="price"]');

		        var salesDetailData = {
		            code: productCode,
		            quantity: quantity,
		            price: price
		        };

		        salesDetailsData.push(salesDetailData);
		    });

		    // 서버로 전송할 데이터 객체 생성
		    var sendData = {
		        sales: salesData,
		        salesDetails: salesDetailsData
		    };

		    // AJAX를 사용하여 서버로 데이터 전송
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
		            console.error("데이터 전송 중 오류 발생:", error);
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
									<th scope="col">제품코드</th>
									<th scope="col">제품명</th>
									<th scope="col">수량</th>
									<th scope="col">가격</th>
									<th scope="col">총 금액</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="num" value="1"/>
								<tr>
									<td><input type="checkbox" name="rowCheck" value="rowCheck"></td>
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
						<button type="button" class="btn btn-primary btn-sm mb-1" onclick="removeRow()">추가취소</button>
						<!-- <button type="button" class="btn btn-primary btn-sm mb-1" onclick="saveData()">저장</button> -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처실적조회</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@ include file="/WEB-INF/views/common/menu.jsp"%>    
</head>

<script>
    $(document).ready(function () {
        $.ajax({
            url: '/customerSales',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                console.log('Received data:', data);

                var tableBody = $('#tableBody');
                tableBody.empty();

                $.each(data.customerSalesList, function (index, customer) {
                    var row = '<tr>' +
                        '<td>' + (customer.custstyle == 0 ? '매입' : '매출') + '</td>' +
                        '<td>' + customer.company + '</td>' +
                        '<td>' + customer.businum + '</td>' +
                        '<td>' + customer.pur_code + '</td>' +
                        '<td>' + customer.item_name + '</td>' +
                        '<td>' + customer.pur_qty + '</td>' +
                        '<td>' + customer.pur_price + '</td>' +
                        '<td>' + customer.salesAmount + '</td>' +
                        '<td>' + customer.purAmount + '</td>' +
                        '</tr>';

                    tableBody.append(row);
                });
            },
            error: function (error) {
                console.error('Error:', error);

                // 에러 출력을 추가
                alert('Error occurred. Open the console for details.');
            }
        });
    });
</script>
<body>


<div class="container">
<div class="col-lg">
<div class="card">
	<h5 class="card-header" >거래처별판매실적</h5>
         <div class="table-responsive text-nowrap mx-3">
             <table id="searchResultsTable"class="table table-hover">
              <thead>
                   <tr>
                 <!--     <th>월</th>
                     <th>거래일자</th> -->
                     <th>유형</th>
                     <th>거래처명</th>
                     <th>사업자번호</th>
                     <th>제품코드</th>
                     <th>제품</th>
                     <th>수량</th>
                     <th>단가</th>
                     <th>매출액</th>
                     <th>매입액</th>
                    </tr>
               </thead>
                  <tbody class="table-border-bottom-0" id="tableBody">
               <c:forEach var="customer" items="${customerSalesList}">
                    <tr>
                      <!-- <td></td> -->
                   	 <%--  <td>${customer.purDate }</td> --%>
                  	  <td>${customer.custstyle == 0 ? '매입' : '매출'}</td>
                      <td>${customer.company }</td>
                      <td>${customer.businum }</td>
                      <td>${customer.purCode}</td>
                      <td>${customer.itemName }</td>
                      <td>${customer.purQty}</td>
                      <td>${customer.purPrice}</td>
                      <td>${customer.salesAmount}</td>
                      <td>${customer.purAmount}</td>
                    </tr>
                </c:forEach>
                </tbody>
              </table>
			</div>
</div>
</div>
</div>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>  
</html>
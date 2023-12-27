<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>        
<!DOCTYPE html>
<html>
<head>
    <style>
        /* 스크롤 테이블 관련 스타일 */
        .table-container {
            overflow-x: auto; /*좌우스크롤  */
            overflow-y: auto; /* 세로 스크롤 추가 */
            max-height: 600px; 
            position: relative; 
        }
        
        #tableBody {
        white-space: nowrap;
        }
 
		 .fixed-tfoot {
		    position: sticky;
		    bottom: 0;
		    background-color: #f8f9fa;
		    z-index: 1;
		    white-space: nowrap;
		
		}

 	   .fixed-thead {
            position: sticky;
            top: 0;
            background-color: #f8f9fa;
            z-index: 1;
             white-space: nowrap;
        }

        /* 추가: THEAD 내 TH에도 백그라운드 색상 지정 */
        .fixed-thead th {
            background-color: #f8f9fa;
             position: sticky;
              background-color:#e1e2ff;
        }
       
    .hidden-row {
        display: none;
    }
    </style>

<meta charset="UTF-8">
<title>재고조회</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@ include file="/WEB-INF/views/common/menu.jsp"%>    
</head>

    <!-- 스크롤 코드 -->
    <script>
        $(document).ready(function () {
            // 스크롤  고정 thaed 
            $(".table-container").scroll(function () {
                $(".fixed-thead").css("left", -$(".table-container").scrollLeft());
            });
        });
    </script>
    
<body>
<div class="container">
<div class="col-lg">
<div class="card">
 <h5 class="card-header">재고조회</h5>
   <div class="row mx-3" >	   
		<div class="col-12 mb-3 d-flex ">	  		   
		    <label for="month">
		    <input class="form-control" type="month" id="monthSelect" name="month">
		    </label>			
				<select class="form-select" id="in_itemcode" style="width: 200px; " ></select>
			<button class="btn btn-outline-primary" id="searchButton" type="button" onclick="search()" >검색</button>
		</div>	
    </div>

 <script>
 $(document).ready(function () {
	
	//제품리스트  조회
    $.ajax({
        url: '/itemListSelect',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
        	custcode: $('#in_itemcode').val(),
        }),
        success: function (response) {
        	var itemListSelect = response.itemListSelect;
        	
        	  // "전체" 옵션 추가
            $('#in_itemcode').append('<option value="0">전체</option>');
            for (var i = 0; i < itemListSelect.length; i++) {
            	$('#in_itemcode').append('<option value="' +  itemListSelect[i].code + '">' + itemListSelect[i].code + 
            			'  ' +  itemListSelect[i].name + '</option>');
            }
        },
        error: function () {
            console.error('서버 오류');
        }
    });
});


function search() {
   
	// 선택한 월을 추출
    var selectedMonth = document.getElementById("monthSelect").value;
    var month = selectedMonth ? selectedMonth.split("-")[1] : "0"; 
    var selectedCustcodes = parseInt($('#in_itemcode').val());
    console.log("Selected Month:", month);
    console.log("SelectedselectedCustcodes:", selectedCustcodes);
    
    // Ajax 요청
    $.ajax({
        url: '/customerSalesSearch',
        type: 'GET',
        data: {
	            custcode: selectedCustcodes,
	            month:  month,
        },
        success: function (data) {
            var customerSalesSearch = data.customerSalesSearch;

        // 검색결과 
            $("#searchResultsTable tbody").empty();
            $.each(customerSalesSearch, function (index, customer) {
                var row = "<tr>" +
                    "<td>" + warehouse.purDate + "</td>" +
                    "<td>" + warehouse.reg_date + "</td>" +  
                    "<td>" + warehouse.code + "</td>" +
                    "<td>" + warehouse.name + "</td>" +
                    "<td>" + warehouse.cnt + "</td>" +
                    "<td>" + warehouse.price + "</td>" +                
                    "</tr>";

                $("#searchResultsTable tbody").append(row);
            });
        },
        error: function () {
            console.error('서버 오류');
        }
    });
}

//0일경우 '-' 표기
function formatAmount(amount) {
    return amount !== 0 ? amount.toLocaleString() : '-';
}
</script>
    		
  <div class="table-responsive text-nowrap mx-3 ">
  <div class="table-container">
           <table id="searchResultsTable" class=" table table-hover">
           <thead class="fixed-thead"> 
                   <tr>
                     <th style="width: 60.508px;">구입일자</th>
                     <th style="width: 119.508px;">입고처리일자</th> 
                     <th style="width: 100px;">제품코드</th>
                     <th style="width: 119.508px;">제품명</th>
                     <th style="width: 119.508px;">재고수량</th>
                     <th style="width: 119.508px;">단가</th>
                     <th style="width: 119.508px;">재고총액</th>
                    </tr>
               </thead>
               <tbody class="table-border-bottom-0" id="tableBody" style="font-size: 12px;">

   	  		  <c:forEach var="warehouse" items="${inventoryList}" varStatus="loop">
	      
      			<!--전체거래처실적조회 -->        
					 <tr>
                     <td>${warehouse.purDate}</td>
                     <td>${warehouse.reg_date}</td>
                  	 <td>${warehouse.code}</td>
                  	 <td>${warehouse.name}</td>
                     <td style="text-align: right;">${warehouse.cnt}</td>
                     <td style="text-align: right;"><fmt:formatNumber value="${warehouse.price}" pattern="#,##0" /></td>
                     <td style="text-align: right;"> <fmt:formatNumber value="${warehouse.cnt * warehouse.price}" pattern="#,##0"/></td>
                    </tr>                   	
				</c:forEach>		
                </tbody>
              </table>
              </div>
              
   </div>           
</div>
</div>

</div>


</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>  
</html>
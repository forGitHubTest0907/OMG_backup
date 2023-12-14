<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/menu.jsp" %>
</head>
<body onload="item_chk()">
	<div class="conatiner">
		<div class="row">
			<div class="col-12">
				<h2>발주 상세</h2>
			</div>
			<div class="col-12">
				<div class="row text-center bg-white">
					<div class="col-6">날짜 : ${pc.pur_date }</div>
					<div class="col-6">회사명 : ${pc.company }</div>
					<div class="col-6">발주자 : ${pc.appli_name }</div>
					<div class="col-6">담당자 : ${pc.mgr_name }</div>
				</div>
			</div>
			
			<div class="col-12 text-center">
				<form id="inDetail">
					<input type="hidden" id="pur_date" value="${pc.pur_date }">
					제품:<select id="code" onchange="item_chk()">
							<c:forEach items="${itemList }" var="itemList">
								<option value="${itemList.code }">${itemList.name }</option>
							</c:forEach>
					</select>
					
					수량: <input type="number" id="qty">
					
					<button type="button" onclick="inSertDetail()" id="insertBtn">추가</button>
					
				</form>	
			</div>
			
			<div class="col-12" id="d_tble">
				<table class="table">
					<thead>
						<tr>
							<td>제품명</td>
							<td>단가</td>
							<td>수량 </td>
							<td class="text-end">공급가액</td>
						</tr>
					</thead>
					<c:forEach items="${pdList }" var="pdList" varStatus="status">
						<tr id="row${status.index }">
							<td>${pdList.item_name }</td>
							<td><fmt:formatNumber value="${pdList.price }" pattern="#,###"/>원</td>
							<td id="td${status.index }">
								${pdList.qty }개
								<button type="button" onclick="chageQtyBtn(${status.index})" id="btn${status.index }">변경</button>
							</td>
							<td id="inputTd${status.index }" style="display: none;">
								<form action="updateDetail">
									<input type="number" name="qty${status.index }" value="${pdList.qty }" id="qty${status.index }" disabled="disabled">
									<input type="hidden" name="code${status.index }" value="${pdList.code }" id="code${status.index }" disabled="disabled">
									<button type="button" onclick="changeQty">완료</button>
									<button type="button" onclick="changeQtyBtn(${status.index })">취소</button>
								</form>
							</td>
							<td class="text-end"><fmt:formatNumber value="${pdList.price_sum }" pattern="#,###"/>원</td>
						</tr>					
					</c:forEach>
					<tr>
						<td></td>
						<td>합계</td>
						<td>${totalQty }개</td>
						<td class="text-end"><fmt:formatNumber value="${totalPrice }" pattern="#,###"/>원</td>
					</tr>
				</table>
			</div>
			
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>	
<script type="text/javascript">
	function item_chk(){
		var code = $("#code").val();
		var i_date = $("#pur_date").val();
		$.ajax({
			data:{code : code, pur_date : i_date},
			url: "chkDItem",
			success: function(data){
				if(data > 0){
					$("#insertBtn").prop("disabled", true);
				} else{
					$("#insertBtn").prop("disabled", false);
				}
			}
			
		});
		
	}
	
	function inSertDetail(){
		var i_qty = $("#qty").val();
		
		if(i_qty <= 0 || i_qty == null){
			alert("수량을 선택하세요.");
		} else {
			var i_code = $("#code").val();
			var i_date = $("#pur_date").val();	
			
			$.ajax({
				type: "POST",
				data: {pur_date :i_date, code : i_code, qty : i_qty},
				url: "insertDetail",
				dataType: "html",
				success:function(data){
					$("#d_tble").html(data);
					$("#qty").val('');
				}
			
			});
		}
	}
	
	function changeQtyBtn(index){
		if($("#td"+index).css("display") == "none"){
			$("#inputTd"+index).hide();
			$("#qty"+index).prop("disabled", true);
			$("#code"+index).prop("disabled", true);
			$("#td"+index).show();
		} else{
			$("#td"+index).hide();
			$("#inputTd"+index).show();
			$("#qty"+index).prop("disabled", false);
			$("#code"+index).prop("disabled", false);
		}
	}
</script>	
</body>
</html>
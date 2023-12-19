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
			<table class="col-12">
				<tr>
					<td class="col-6 text-start">
						<c:if test="${mem_id == pc.mgr_id && pc.pur_status == 0}">
							<form action="completePur" class="col-6" method="POST">
								<input type="hidden" name="pur_date" value="${pc.pur_date }">
								<input type="hidden" name="custcode" value="${pc.custcode }">
								<input type="hidden" name="mgr_id" value="${pc.mgr_id}">
								<button class="btn btn-outline-primary">발주 완료</button>
							</form>
						</c:if>
						<div class="col-6">
							<c:if test="${pc.pur_status == 0 &&(mem_id == pc.mem_id || mem_id == pc.mgr_id )}">
								<form action="deletePur" class="col-6" method="POST">
									<input type="hidden" name="pur_date" value="${pc.pur_date }">
									<input type="hidden" name="custcode" value="${pc.custcode }">
									<input type="hidden" name="mgr_id" value="${pc.mgr_id}">
									<button class="btn btn-outline-primary">발주 취소</button>
								</form>
							</c:if>
						</div>
					</td>
					<td class="col-6 text-end"><button type="button" onclick="location.href='purList'" class="btn btn-outline-primary">목록</button></td>
				</tr>
			</table>
			
			<div class="col-12">
				<div class="row text-center bg-white">
					<div class="col-6">제목 : ${pc.title}</div>
					<div class="col-6">상태 : <c:choose>
												<c:when test="${pc.pur_status == 0}">진행중</c:when>
												<c:when test="${pc.pur_status == 1}">완료</c:when>
												<c:when test="${pc.pur_status == 2}">입고완료</c:when>
											</c:choose>
					</div>
					<div class="col-6">날짜 : ${pc.pur_date }</div>
					<div class="col-6">회사명 : ${pc.company }</div>
					<div class="col-6">발주자 : ${pc.appli_name }(${pc.mem_id })</div>
					<div class="col-6">담당자 : ${pc.mgr_name } (${pc.mgr_id })</div>
					<div class="col-12 text-center">비고</div>
					<div class="container">
						${pc.ref }
					</div>
				</div>
			</div>
			
			<div class="col-12 text-center">
				<input type="hidden" id="pur_date" value="${pc.pur_date }">
				<c:if test="${mem_id == pc.mem_id}">
						<input type="hidden" id="pur_date" value="${pc.pur_date }">
						제품:<select id="code" onchange="item_chk()">
								<c:forEach items="${itemList }" var="itemList">
									<option value="${itemList.code }">${itemList.name }</option>
								</c:forEach>
						</select>
						
						수량: <input type="number" id="qty">
						
						<button type="button" onclick="inSertDetail()" id="insertBtn" class="btn btn-outline-primary">추가</button>
				</c:if>
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
								<c:if test="${pc.pur_status == 0 && mem_id == pc.mem_id}">
									<button type="button" onclick="changeQtyBtn(${status.index})" id="btn${status.index }" class="btn btn-outline-primary">변경</button>
								</c:if>
							</td>
							<td id="inputTd${status.index }" style="display: none;">
									<input type="number" name="qty${status.index }" value="${pdList.qty }" id="qty${status.index }" disabled="disabled">
									<input type="hidden" name="code${status.index }" value="${pdList.code }" id="code${status.index }" disabled="disabled">
									<button type="button" onclick="changeQty(${status.index })" class="btn btn-outline-primary">완료</button>
									<button type="button" onclick="changeQtyBtn(${status.index })" class="btn btn-outline-primary">취소</button>
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
	
	function changeQty(index){
		var i_date = $("#pur_date").val();
		var i_code = $("#code"+index).val();
		var i_qty = $("#qty"+index).val();
		$.ajax(
			{
				type:"POST",
				data:{pur_date : i_date, code : i_code, qty : i_qty},
				url: "qtyUpdate",
				success:function(data){
					$("#d_tble").html(data);
				}
			}
		);
	}
</script>	
</body>
</html>
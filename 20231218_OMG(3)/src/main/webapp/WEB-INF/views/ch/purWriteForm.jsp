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
<body>
	<div class="conatiner">
		<form action="writePurchase" method="POST">
			<div class="row">
				<div class="col-12">
					<h2>발주 작성</h2>
				</div>
				<input name="rownum" type="hidden" id="rownum" value="0">
				<div class="col-12">
					<div class="row text-center bg-white">
						
						<table>
							<tr>
								<td colspan="2" width="40%">제목: <input type="text" name="title" placeholder="발주전표_YYYYMMDD_회사명" style="width: 30%;" required="required"></td>
							</tr>
							<tr>
								<td>발주자 : ${member.mem_name }<input type="hidden" name="mem_id" value="${member.mem_id }"></td>
								<td id="selectCustcode">
									회사명:<select id="custcode">
											<c:forEach items="${pur_custList }" var="pur_custList">
												<option value="${pur_custList.custcode }" data-name=${pur_custList.company } data-mgr_name=${pur_custList.mem_name }>${pur_custList.company }</option>
											</c:forEach>
										</select>
									<button type="button" onclick="saveCustcode()">확인</button>
								</td>
								<td id="inputCustCode" style="display: none;">
									회사명:<input type="hidden" id="inputCode" name="custcode" disabled="disabled">
									<span id="company_name"></span>
									<button type="button" onclick="saveCustcode()">취소</button>
								</td>
							</tr>
							<tr style="display: none;" id="mgr_row">
								<td colspan="2">담당자:<span id="mgr_name"></span></td>
							</tr>
							<tr>
								<td colspan="2">비고 </td>
							</tr>
							<tr>
								<td colspan="2"><textarea rows="10" cols="100" name="ref" id="ref"></textarea></td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="col-12 text-center">
						<span id="selectItems"></span>
				</div>
				
				<div class="col-12" id="d_tble">
					<table class="table">
						<thead>
							<tr>
								<td>제품명</td>
								<td>단가</td>
								<td>수량 </td>
								<td class="text-end">공급가액</td>
								<td></td>
							</tr>
						</thead>
						<tbody id="pur_body">
							
						</tbody>
					</table>
					<div class="col-12 text-end"><input type="submit" id="smtbtn" value="발주완료" class="text-end" disabled="disabled"></div>
				</div>
				
			</div>
		</form>
	</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	var rownum = 0;
	function chkduplication(data){
		var chkdupli = $('[id^="chkDupli"]');
		var values = [];
		var result = true;
		chkdupli.each(function(){
			values.push($(this).val());
		})
		
		for(var i in values){
			if(values[i] == data){
				result= false;
			}
		}
		
		return result;
	}
	
	function inSertDetail(){
		var pur_body = $("#pur_body");
		var code = $("#code").val();
		var qty = $("#qty").val();
		var chk = chkduplication(code);
		if(chk == true){
			$.ajax({
				data:{code : code, rownum : rownum, qty : qty},
				url: "wirteDetail",
				success: function(data){
					pur_body.append(data);
					rownum +=1;
				}
			});
			$("#rownum").val(rownum);
		} else {
			alert("이미 추가된 제품입니다.");
		}
		
		$("#qty").val("");
		
	}
	function getItems(){
		var custcode = $("#custcode").val();
		$.ajax({
			data:{custcode : custcode},
			url: "getItems",
			success: function(data){
				$("#selectItems").html(data);
			}
		});
	}
	function saveCustcode(){
		var company_name = $("#custcode option:selected").data("name");
		var mgr_name = $("#custcode option:selected").data("mgr_name");
		var custcode = $("#custcode").val();
		if($("#inputCustCode").css("display") == "none"){
			$("#inputCustCode").show();
			$("#inputCode").prop("disabled",false);
			$("#inputCode").val(custcode);
			$("#mgr_row").show();
			$("#company_name").html(company_name);
			$("#mgr_name").html(mgr_name);
			$("#selectCustcode").hide();
			$("#smtbtn").prop("disabled",false);
			getItems();
		}else{
			$("#inputCustCode").hide();
			$("#inputCode").prop("disabled",true);
			$("#selectCustcode").show();
			$("#mgr_row").hide();
			$("#smtbtn").prop("disabled",true);
			$("#selectItems").empty();
		}
		
	}
	
	function cancelItem(data){
		$("#row"+data).remove();
	}
</script>
</body>
</html>
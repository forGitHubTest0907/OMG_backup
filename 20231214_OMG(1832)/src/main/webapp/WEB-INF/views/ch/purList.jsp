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
<%@ include file="./../common/menu.jsp" %>
	<div class="conatiner">
		<div class="row">
			<div class="col-12">
				<h2>발주 리스트</h2>
				<hr>
			</div>
			<div class="col-12 text-end">
				<a href="purWriteForm" class="btn btn-outline-primary">발주 신청</a>
			</div>
			<div class="col-12">
				<a href="/purWriteForm"></a>
				<div class="table-responsive">
				  <table class="table bg-white bordered">
				    <thead class="table-dark">
				      <tr>
				        <td>No.</td>
						<td>제목</td>
						<td>회사명</td>
						<td>발주일</td>
						<td>발주자</td>
						<td>상품수</td>
						<td>총수량</td>
						<td>총금액</td>
				      </tr>
				    </thead>
				    <tbody>
				    	<c:set value="${totalPur }" var="num"/>
				    	<c:forEach items="${purList }" var="purList">
							<tr>
								<td>${num }</td>
								<td class="text-start"><a href="/purDtail?pur_date=${purList.pur_date }&custcode=${purList.custcode }">${purList.title }</a></td>
								<td>${purList.company }</td>
								<td>${purList.pur_date }</td>
								<td>${purList.appli_name}</td>
								<td>${purList.totalType}</td>
								<td>${purList.totalQty}개</td>
								<td><fmt:formatNumber value="${purList.totalPrice}" pattern="#,###"/>원</td>
							</tr>
							<c:set var="num" value="${num-1 }"></c:set>
						</c:forEach>
				    </tbody>
				  </table>
				</div>
			</div>
			
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>
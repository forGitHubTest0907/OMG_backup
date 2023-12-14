<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table">
	<thead>
		<tr>
			<td>이름</td>
			<td>단가</td>
			<td>수량</td>
			<td class="text-end">공급가액</td>
		</tr>
	</thead>
	<c:forEach items="${pdList }" var="pdList">
		<tr>
			<td>${pdList.item_name }</td>
			<td><fmt:formatNumber value="${pdList.price }" pattern="#,###"/>원</td>
			<td>${pdList.qty }개</td>
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
</body>
</html>
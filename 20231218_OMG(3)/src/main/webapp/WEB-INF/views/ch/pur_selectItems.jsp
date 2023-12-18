<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
제품:<select id="code" onchange="item_chk()">
		<c:forEach items="${itemList }" var="itemList">
			<option value="${itemList.code }">${itemList.name }</option>
		</c:forEach>
	</select>
수량: <input type="number" id="qty">
<button type="button" onclick="inSertDetail()" id="insertBtn">추가</button>
</body>
</html>
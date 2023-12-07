<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach var="commList" items="${commList }">
			<tr>
				<td>${commList.ct_lg }</td>
				<td>${commList.ct_md }</td>
				<td>${commList.com_cn }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
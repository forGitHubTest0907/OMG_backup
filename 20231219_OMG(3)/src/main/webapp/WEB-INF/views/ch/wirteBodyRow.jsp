<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<tr id="row${rownum }">
	<td><input type="hidden" name="code${rownum }" value="${item.code }" id="chkDupli${rownum }">${item.name }</td>
	<td><input type="number" id="price${rownum }" name="price${rownum }" value="${item.input_price }" onchange="price_cal(${rownum })"></td>
	<td><input type="number" id="qty${rownum }" name="qty${rownum }" value="${qty }" onchange="price_cal(${rownum })"></td>
	<td><span id="totalPrice${rownum }"><fmt:formatNumber value="${item.input_price * qty }" pattern="#,####"/>원 </span></td>
	<td><button onclick="cancelItem(${rownum})">삭제</button></td>
</tr>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<tr id="row${rownum }">
	<td><input type="hidden" name="code${rownum }" value="${item.code }" id="chkDupli${rownum }">${item.name }</td>
	<td><input type="number" name="price${rownum }" value="${item.input_price }"></td>
	<td><input type="number" name="qty${rownum }" value="${qty }"></td>
	<td><span id="totalPrice${rownum }">${item.input_price * qty }</span></td>
	<td><button onclick="cancelItem(${rownum})">삭제</button></td>
</tr>
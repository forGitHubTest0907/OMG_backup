<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h6 class="fw-bold py-3 mb-4">
	<span class="text-muted fw-light">제품명: </span>${i.name }
</h6>
<table class="table table-bordered">

    <tr>
      <th class="table-primary fixedCol">제품코드</th>
      <td class="fixedCol">${i.code }</td>
      <th class="table-primary fixedCol">거래처</th>
      <td class="fixedCol">${i.custcode }</td>
    </tr>
    
    <tr>
      <th class="table-primary">제품명</th>
      <td>${i.name }</td>
      <th class="table-primary">카테고리</th>
      <td>${i.cate_md }</td>
    </tr>
    
    <tr>
      <th class="table-primary">매입가격</th>
      <td>${i.input_price }</td>
      <th class="table-primary">매출가격</th>
      <td>${i.output_price }</td>
    </tr>
    
    <tr>
      <th class="table-primary">제품내용</th>
      <td colspan="3">${i.item_cn }</td>
    </tr>
    
    <tr>
      <th class="table-primary">판매여부</th>
      <td>${i.deleted }</td>
      <th class="table-primary">등록일</th>
      <td>${i.reg_date }</td>
    </tr>
    
</table>

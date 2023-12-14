<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 조회</title>
<script type="text/javascript">
	function showItemDetail(p_index) {
		$.ajax(
				{
					url: "/item/detail?code=" + p_index,
					dataType: "html",
					success: function(data) {
						$("#itemDetail").html(data);
					}
			}
		)
	};
</script>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
<%@ include file="/WEB-INF/views/common/menu.jsp" %>
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">제품 관리 / </span>
		<a href="/item/list" class="linkText">제품 조회</a>
	</h4>
	
	<!-- 제품 조회 -->
	<div class="card">
	  <div class="card overflow-hidden row" style="height: 700px">
	  
	  	<!-- 제품 리스트 -->
	  	<div class="p-0 card-body table-responsive text-nowrap tableFixed col-5" id="both-scrollbars-example">
		    <table class="table table-hover fixedHeader">
		      <thead>
		        <tr class="table-primary">
		          <th class="stiky text-center">제품코드</th>
		          <th class="stiky">제품명</th>
		          <th class="stiky text-center">카테고리</th>
		          <th class="stiky text-center">판매여부</th>
		        </tr>
		      </thead>
		      <tbody class="table-border-bottom-0">
		      	<c:forEach items="${itemList }" var="itemList">
			        <tr>
			          <td class="text-center">
			          	<a onclick="showItemDetail(${itemList.code })">${itemList.code }</a>
			          </td>
			          <td>
			          	<a onclick="showItemDetail(${itemList.code })"><strong class="linkText">${itemList.name }</strong></a>
			          </td>
			          <td class="text-center">
			          	<a onclick="showItemDetail(${itemList.code })">${itemList.com_cn }</a>
			          </td>
			          <td class="text-center">
			          	<a onclick="showItemDetail(${itemList.code })">
				          <c:choose>
				          	<c:when test="${itemList.deleted == '0'}">
				          		<span class="badge bg-label-primary me-1">정상</span>
				          	</c:when>
				          	<c:otherwise>
				          		<span class="badge bg-label-warning me-1">판매종료</span>
				          	</c:otherwise>
				          </c:choose>
			          	</a>
			          </td>
			        </tr>
		      	</c:forEach>
		      </tbody>
		    </table>
	    </div>
	    <!-- / 제품 리스트 -->
	    
	    <!-- 제품 상세정보 -->
	    <div id="itemDetail" class="card-body table-responsive text-nowrap col-7">
	    </div>
	    <!-- / 제품 상세정보 -->
	    
	  </div>
	</div>
	<!--/ 제품 조회 -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
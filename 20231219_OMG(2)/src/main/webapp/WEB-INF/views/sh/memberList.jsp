<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../common/header.jsp" %>
<body>
<%@ include file="../common/menu.jsp" %>
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">인사 /</span> 사원 조회 ${memberTotal }</h4>
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">사원 명단</h5>
                <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="Search..."
                    aria-label="Search..."
                    id="searchMember"
                  />
                </div>
              </div>
              <!-- /Search -->
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th>입사일자</th>
                        <th>사원번호</th>
                        <th>성명</th>
                        <th>부서명</th>
                        <th>직위</th>
                        <th>이메일</th>
                        <th>상세정보</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
	                    <c:forEach var="list" items="${memberList }">
	                    	<tr>
	                    		<td><i class="fab fa-angular fa-lg text-danger me-1"></i><strong>${list.rn}</strong></td>
	                    		<td>${list.mem_hiredate}</td>
	                    		<td><a href="memberU?mem_id=${sessionScope.mem_id}">${list.mem_id}</a></td>
	                    		<td>${list.mem_name}</td>
	                    		<td>
	                    			<c:choose>
	                    				<c:when test="${list.mem_dept_md == 100}"> 회계팀</c:when>
	                    				<c:when test="${list.mem_dept_md == 101}"> 인사팀</c:when>
	                    				<c:when test="${list.mem_dept_md == 102}"> 영업1팀</c:when>
	                    				<c:when test="${list.mem_dept_md == 103}"> 영업2팀</c:when>
	                    				<c:when test="${list.mem_dept_md == 104}"> 물류1팀</c:when>
	                    				<c:when test="${list.mem_dept_md == 105}"> 물류2팀</c:when>
	                    				<c:when test="${list.mem_dept_md == 106}"> CS1팀</c:when>
	                    				<c:when test="${list.mem_dept_md == 107}"> CS2팀</c:when>
	                    				<c:otherwise>미배치</c:otherwise>
	                    			</c:choose>
	                    		</td>
	                    		<td>
	                    			<c:choose>
	                    				<c:when test="${list.mem_posi_md == 100}"> 대표이사</c:when>
	                    				<c:when test="${list.mem_posi_md == 101}"> 상무</c:when>
	                    				<c:when test="${list.mem_posi_md == 102}"> 차장</c:when>
	                    				<c:when test="${list.mem_posi_md == 103}"> 과장</c:when>
	                    				<c:when test="${list.mem_posi_md == 104}"> 대리</c:when>
	                    				<c:when test="${list.mem_posi_md == 105}"> 사원</c:when>
	                    				<c:otherwise>인턴</c:otherwise>
	                    			</c:choose>
	                    		</td>
	                    		<td>${list.mem_email}</td>
	                    		<td>
		                          <div class="dropdown">
		                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
		                              <i class="bx bx-dots-vertical-rounded"></i>
		                            </button>
		                            <div class="dropdown-menu">
		                              <a class="dropdown-item" href="/memberU"
		                                ><i class="bx bx-edit-alt me-1"></i> Edit</a
		                              >
		                              <c:choose>
		                              	<c:when test="${list.mem_leave == null and list.mem_resi == null }">
			                              <a class="dropdown-item" href="/memberU"
			                                ><i class="bx bx-edit-alt me-1"></i> 휴직</a
			                              >
			                              <a class="dropdown-item" href="/memberD;"
			                               ><i class="bx bx-trash me-1"></i> 퇴사</a
			                               >
		                              	</c:when>
		                              	<c:when test="${list.mem_leave != null and list.mem_resi == null }">
			                              <a class="dropdown-item" href="/memberU"
			                                ><i class="bx bx-edit-alt me-1"></i> 복직</a
			                              >
			                              <a class="dropdown-item" href="/memberD;"
			                               ><i class="bx bx-trash me-1"></i> 퇴사</a
			                               >
		                                </c:when>
		                              </c:choose>
		                            </div>
		                          </div>
		                        </td>
	                    	</tr>
	                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              	
              	<!-- 페이징 -->
                <!-- Basic Pagination -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <div class="demo-inline-spacing d-flex justify-content-center">
                        <nav aria-label="Page navigation">
                          <ul class="pagination">
                            <c:if test="${page.startPage > page.pageBlock }">
	                            <li class="page-item prev">
	                              <a class="page-link" href="memberL?currentPage=${page.startPage - page.pageBlock }"
	                                ><i class="tf-icon bx bx-chevron-left"></i
	                              ></a>
	                            </li>
                            </c:if>
                            <c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
	                            <li class="page-item">
	                              <a class="page-link" href="memberL?currentPage=${i}">${i }</a>
	                            </li>
                            </c:forEach>
                            <c:if test="${page.endPage < page.totalPage }">
	                            <li class="page-item next">
	                              <a class="page-link" href="memberL?currentPage=${page.startPage + page.pageBlock }"
	                                ><i class="tf-icon bx bx-chevron-right"></i
	                              ></a>
	                            </li>
                            </c:if>
                          </ul>
                        </nav>
                      </div>
                    </div>
                  </div>
                </div>
             	<!-- Basic Pagination -->
              
              </div>
              <!--/ Basic Bootstrap Table -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$('#searchMember').on('keydown',function(e){
 			   
	 			if(e.key === 'Enter'){
	 				  alert("success");
	 				window.location.href = "memberRequirement?keyword="+e.target.value;	
/* 	 			$.ajax({
	 				url  : "memberRequirement",
	 				data : {keyword : e.target.value},
	 				type : "GET",
	 				success : function(){
						alert("success");
						window.location.href = "sh/memberList`";
	 				}
	 			}); */
	 			
	 			
	 		}
 		});
 	});
 </script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">인사 /</span> 사원 조회</h4>
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">인사 카드</h5>
                <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="Search..."
                    aria-label="Search..."
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
                        <th>직급</th>
                        <th>이메일</th>
                        <th>상세정보</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-1"></i> <strong>1</strong></td>
                        <td>2023.12.08</td>
                        <td><a href="memberU?mem_id="+mem_id>1001</a></td>
                        <td>김태현</td>
                        <td>인사부</td>
                        <td>직급</td>
                        <td>이메일</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i> Edit</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i> Delete</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><i class="fab fa-react fa-lg text-info me-1"></i> <strong>2</strong></td>
                        <td>2023.12.08</td>
                        <td><a href="memberU?mem_id="+mem_id>1002</a></td>
                        <td>김아무개</td>
                        <td>영업부</td>
                        <td>직급</td>
                        <td>이메일</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-2"></i> Edit</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-2"></i> Delete</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><i class="fab fa-vuejs fa-lg text-success me-1"></i> <strong>3</strong></td>
                        <td>2023.12.08</td>
                        <td><a href="memberU?mem_id="+mem_id>1003</a></td>
                        <td>홍길동</td>
                        <td>인사부</td>
                        <td>직급</td>
                        <td>이메일</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-2"></i> Edit</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-2"></i> Delete</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fab fa-bootstrap fa-lg text-primary me-1"></i> <strong>4</strong>
                        </td>
                        <td>2023.12.08</td>
                        <td><a href="memberU?mem_id="+mem_id>1004</a></td>
                        <td>김태현</td>
                        <td>인사부</td>
                        <td>직급</td>
                        <td>이메일</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-2"></i> Edit</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-2"></i> Delete</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Basic Bootstrap Table -->
<%@ include file="../common/footer.jsp" %>
</body>
</html>
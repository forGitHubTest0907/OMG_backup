<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<%@ include file="../common/header.jsp" %>
<body>
<%@ include file="../common/menu.jsp" %>
	<h4 class="fw-bold py-3"><span class="text-muted fw-light">인사 /</span> 사원 등록</h4>
              <!-- Content -->
              <div class="row">
                <div class="col-md-12">
                  <div class="card mb-4">
                    <h5 class="card-header">
                      <i class="bx bx-user me-1"></i> Account</h5>
                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                          src="../assets/img/avatars/1.png"
                          alt="user-avatar"
                          class="d-block rounded"
                          height="100"
                          width="100"
                          id="uploadedAvatar"
                        />
                        <div class="button-wrapper">
                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                            <span class="d-none d-sm-block">Upload new photo</span>
                            <i class="bx bx-upload d-block d-sm-none"></i>
                            <input
                              type="file"
                              id="upload"
                              class="account-file-input"
                              hidden
                              accept="image/png, image/jpeg"
                            />
                          </label>
                          <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                            <i class="bx bx-reset d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">Reset</span>
                          </button>
                          <div class="form-check form-switch mb-2">
		                       <input class="form-check-input" type="checkbox" id="mem_right" />
		                       <label class="form-check-label" for="mem_right">권한 부여</label>
                      		</div>
                        </div>
                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" method="POST" onsubmit="return false">
                        <div class="row">
                        
                          <div class="mb-3 col-md-6">
                            <label for="mem_id" class="form-label">사원번호</label>
                            <input
                              class="form-control"
                              type="text"
                              id="mem_id"
                              name="mem_id"
                              readonly="readonly"
                              autofocus
                            />
                          </div>
                          
                          <div class="mb-3 col-md-6">
	                        <label for="mem_hiredate" class="col-md-2 col-form-label">입사 일자</label>
	                        <div class="col-md-10">
	                          <input class="form-control" type="date" id="mem_hiredate"/>
	                        </div>
	                      </div>
                      
                           <div class="mb-3 col-md-6">
                             <label for="mem_name" class="form-label">성명</label>
                             <input
                               class="form-control"
                               type="text"
                               id="mem_name"
                               name="mem_name"
                             />
                           </div>
                           
                           
                      
                      	<div class="mb-3 col-md-6">
                            <label for="mem_bd" class="form-label">생년월일</label>
                           	<div class="input-group">
	                        	<input
		                          type="text"
		                          class="form-control"
		                          id="mem_bd"
		                          name="mem_bd"
		                          placeholder="yyyyMMdd"
		                          aria-label="Recipient's username with two button addons"
		                          maxlength="8"
		                          min="19000101"
		                        />
		                        <button class="btn btn-outline-primary" type="button" value="0">남</button>
		                        <button class="btn btn-outline-primary" type="button" value="1">녀</button>
		                	</div>  
	                  	</div>
                      
                       	<div class="mb-3 col-md-6">
                            <label for="mem_email" class="form-label">이메일</label>
                            <div class="input-group">
	                            <input
	                              class="form-control"
	                              type="text"
	                              id="mem_email"
	                              name="mem_email"
	                            />
	                            <span class="input-group-text">@</span>
	                            <input
	                              class="form-control"
	                              type="text"
	                              id="mem_email"
	                              name="mem_email"
	                            />
	                            <select id="memb_email" class="select2 form-select">
		                            <option value="">직접입력</option>
		                            <option value="100">naver.com</option>
		                            <option value="101">gmail.com</option>
		                            <option value="102">daum.net</option>
		                        	<option value="103">hotmail.com</option>
		                        </select>
                            </div>
                       	</div>
                          
                     	<div class="mb-3 col-md-6">
                            <label class="form-label" for="mem_phone">전화번호</label>
                            <div class="input-group input-group-merge">
                              <span class="input-group-text">KR (+82)</span>
                              <input
                                type="text"
                                id="mem_phone"
                                name="mem_phone"
                                class="form-control"
                                placeholder="010-1111-1111"
                              />
                        	</div>
                     	</div>
                          
                     	<div class="mb-3 col-md-6">
                            <label class="form-label" for="memb_dept_md">부서</label>
                            <div class="input-group">
	                            <select id="memb_dept_md" class="select2 form-select">
	                              <option value="">Select</option>
	                              <option value="100">회계팀</option>
	                              <option value="101">인사팀</option>
	                              <option value="102">영업1팀</option>
	                              <option value="103">영업2팀</option>
	                              <option value="104">물류1팀</option>
	                              <option value="105">물류2팀</option>
	                              <option value="106">인사팀</option>
	                              <option value="107">CS1팀</option>
	                            </select>
                            <input type="text" class="form-control" aria-label="Text input with dropdown button" />
	                          </div>
                          </div>
                          
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="memb_posi_md">직위</label>
                            <div class="input-group">
                            <select id="memb_posi_md" class="select2 form-select">
                              <option value="">Select</option>
                              <option value="100">대표이사</option>
                              <option value="101">상무</option>
                              <option value="102">차장</option>
                              <option value="103">과장</option>
                              <option value="104">대리</option>
                              <option value="105">사원</option>
                            </select>
                            <input type="text" class="form-control" aria-label="Text input with dropdown button" />
	                          </div>
                          </div>
                          
                          <div class="mb-3 col-md-12">
                            <label for="memb_duty_md" class="form-label">직책</label>
                            <div class="col-md-6">
	                            <div class="input-group">
	                            <select id="memb_duty_md" class="select2 form-select">
	                              <option value="">Select</option>
	                              <option value="100">CEO</option>
	                              <option value="101">CFO</option>
	                              <option value="102">본부장</option>
	                              <option value="103">실장</option>
	                              <option value="104">팀장</option>
	                              <option value="105">팀원</option>
	                            </select>
	                            <input type="text" class="form-control" aria-label="Text input with dropdown button" />
		                      	</div>
	                      	</div>
                          </div>
                          
                          <div class="mb-3 col-md-6">
                            <label for="exampleFormControlInput1" class="form-label">주소</label>
                            <div class="row">
						        <div class="mb-3 col-md-4">
						            <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
						        </div>
						        <div class="col-md-2">
						            <input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="주소 검색">
						        </div>
						    </div>
	                        <div class="col-md-8">
								<input type="text" class="form-control" id="sample6_address" placeholder="주소"><br>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소"><br>
								<input type="text"class="form-control" id="sample6_extraAddress" placeholder="참고항목">
							</div>
                          </div>
                          
                          
                           
                           <div class="mb-2 col-md-4">
	                          <div class="form-password-toggle">
	                        	<label class="form-label" for="basic-default-password12">비밀번호</label>
	                       		<div class="input-group">
	                          	<input
		                            type="password"
		                            class="form-control"
		                            id="basic-default-password12"
		                            aria-describedby="basic-default-password2"
		                          />
		                          <span id="basic-default-password2" class="input-group-text cursor-pointer"
		                            ><i class="bx bx-hide"></i
		                          ></span>
	                       		</div>
	                       	  </div>
                       	 
	                        <div class="form-password-toggle">
		                        <label class="form-label" for="basic-default-password12">비밀번호 재확인</label>
		                        <div class="input-group">
		                          <input
		                            type="password"
		                            class="form-control"
		                            id="basic-default-password12"
		                            aria-describedby="basic-default-password2"
		                          />
		                          <span id="basic-default-password2" class="input-group-text cursor-pointer"
		                            ><i class="bx bx-hide"></i
		                          ></span>
		                        </div>
		                      </div>
	                      </div>
	                      
                        </div>
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2">Create</button>
                          <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                        </div>
                      </form>
                    </div>
                    <!-- /Account -->
                  </div>
                </div>
              </div>
            <!-- / Content -->
		
<%@ include file="../common/footer.jsp" %>
</body>
</html>
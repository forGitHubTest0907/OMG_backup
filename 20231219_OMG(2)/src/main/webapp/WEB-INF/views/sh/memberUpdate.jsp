<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/jquery.js"></script>
<script>
//주소 API
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
};
</script>
</head>
<%@ include file="../common/header.jsp" %>
<body>
<%@ include file="../common/menu.jsp" %>
	<h4 class="fw-bold py-3"><span class="text-muted fw-light">인사 /</span> 사원 상세</h4>
              <!-- Content -->
              <div class="row">
                <div class="col-md-12">
                  <div class="card mb-4">
                    <h5 class="card-header"><i class="bx bx-user me-1"></i> Account Detail</h5>
                    <form id="formAccountSettings" enctype="multipart/form-data">
                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img id="img" class="d-block rounded" style="height: 150px; width: 150px; display: none"/>
                        <div class="button-wrapper">
                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                            <span class="d-none d-sm-block">Upload new photo</span>
                            <i class="bx bx-upload d-block d-sm-none"></i>
                            <input type="file" id="upload" name="mem_img" class="account-file-input" aria-label="upload" accept="image/png, image/jpeg, image/jpg" hidden />
                          </label>
                          <button type="button" id="reset" class="btn btn-outline-secondary account-image-reset mb-4">
                            <i class="bx bx-reset d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">Reset</span>
                          </button>
                         <div class="form-check col-mb-2">
                        	  <div class="form-check mt-3">
		                            <input
		                              class="form-check-input"
		                              type="radio"
		                              value="0"
		                              id="mem_right_employee"
		                              name="mem_right"
		                              checked
		                            />
		                            <label class="form-check-label" for="mem_right_employee"> 사원 권한</label>
		                          </div>
		                          <div class="form-check">
		                            <input
		                              class="form-check-input"
		                              type="radio"
		                              value="1"
		                              id="mem_right_manager"
		                              name="mem_right"
		                            />
		                            <label class="form-check-label" for="mem_right_manager"> 관리자 권한</label>
		                          </div>
                      	  </div>
                        </div>
                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
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
                             <label for="mem_name" class="form-label">이름</label>
                             <input
                               class="form-control"
                               type="text"
                               id="mem_name"
                               name="mem_name"
                             />
                           </div>
                           
                           <div class="mb-3 col-md-6">
	                         <label for="mem_leave" class="col-md-2 col-form-label">휴직 일자</label>
	                         <div class="col-md-10">
	                           <input class="form-control" type="date" id="mem_leave"/>
	                         </div>
	                       </div>
                      
                           <!-- mem_duty -->
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
			                     pattern="\d*"
			                     
			                   />
			                <div class="col-md-3" style="margin: 5px 100px 0 50px;">
		                	    <input
		                         name="mem_sex"
		                         class="form-check-input"
		                         type="radio"
		                         value="M"
		                         id="mem_sex"
		                        />남
		                       <input
		                         name="mem_sex"
		                         class="form-check-input"
		                         type="radio"
		                         value="F"
		                         id="mem_sex"
		                         
		                       />여
	                        	</div>
			               </div>
			         </div>
                            
                          <div class="mb-3 col-md-6">
	                        <label for="mem_rein" class="col-md-2 col-form-label">복직 일자</label>
	                        <div class="col-md-10">
	                          <input class="form-control" type="date" id="mem_rein" />
	                        </div>
                      	 </div>
                      
                         <!-- mem_email -->
                      <div class="mb-3 col-md-6" id="mem_email">
                        <label for="mem_email" class="form-label">이메일</label>
                        <div class="input-group">
	                        <input class="form-control" type="text" id="mem_email1" name="mem_email1"/>
	                            <span class="input-group-text">@</span>
	                            <input class="form-control" type="text" id="mem_email2" name="mem_email2"/>
	                            <select id="mem_email3" class="select2 form-select">
		                            <option value="" >직접입력</option>
		                            <option value="naver.com">네이버</option>
		                            <option value="gmail.com">지메일</option>
		                            <option value="daum.net">다음</option>
		                        	<option value="hotmail.com">핫메일</option>
		                        </select>
                            </div>
                       	</div>
                          
                         <div class="mb-3 col-md-6">
	                        <label for="mem_resi" class="col-md-2 col-form-label">퇴직 일자</label>
	                        <div class="col-md-10">
	                          <input class="form-control" type="date" id="mem_resi"/>
	                        </div>
                      	 </div>
                      
                        <!-- mem_phone -->  
                     	<div class="mb-3 col-md-6">
                            <label class="form-label" for="mem_phone">전화번호</label>
                            <div class="input-group input-group-merge">
                              <span class="input-group-text">KR (+82)</span>
                              <input type="tel" id="mem_phone" name="mem_phone" class="form-control" placeholder="휴대폰 번호(-제외)" maxlength="11"/>
                        	</div>
                     	</div>
                          
                          <div class="mb-3 col-md-6" >
                            <label class="form-label" for="mem_dept_md">부서</label>
                            <div class="input-group">
	                            <select id="mem_dept_md" name="mem_dept_md" class="select2 form-select">
	                              <option value="">Select</option>
	                              <option value="100">회계팀</option>
	                              <option value="101">인사팀</option>
	                              <option value="102">영업1팀</option>
	                              <option value="103">영업2팀</option>
	                              <option value="104">물류1팀</option>
	                              <option value="105">물류2팀</option>
	                              <option value="106">CS1팀</option>
	                              <option value="107">CS2팀</option>
	                            </select>
                            <input type="text"class="form-control" id="mem_dept" aria-label="Text input with dropdown button" readonly="readonly"/>
	                          </div>
                          </div>
                          
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="memb_posi_md">직위</label>
                            <div class="input-group">
                            <select id="mem_posi_md" name="mem_posi_md" class="select2 form-select">
                              <option value="">Select</option>
                              <option value="100">대표이사</option>
                              <option value="101">상무</option>
                              <option value="102">차장</option>
                              <option value="103">과장</option>
                              <option value="104">대리</option>
                              <option value="105">사원</option>
                            </select>
                            <input type="text" class="form-control" id="mem_posi" aria-label="Text input with dropdown button" readonly="readonly"/>
	                          </div>
                          </div>
                          
                          <div class="mb-3 col-md-6">
                            <label for="memb_duty_md" class="form-label">직책</label>
                            <div class="input-group">
                            <select id="mem_duty_md" name="mem_duty_md" class="select2 form-select">
                              <option value="">Select</option>
                              <option value="100">CEO</option>
                              <option value="101">CFO</option>
                              <option value="102">본부장</option>
                              <option value="103">실장</option>
                              <option value="104">팀장</option>
                              <option value="105">팀원</option>
                            </select>
                            	<input type="text" class="form-control" id="mem_duty" aria-label="Text input with dropdown button" readonly="readonly" />
	                      	</div>
                          </div>
                          
                          <div class="mb-3 col-md-6">
                            <label for="exampleFormControlInput1" class="form-label">주소</label>
                            <div class="row">
						        <div class="mb-2 col-md-4">
						            <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
						        </div>
						        <div class="mb-1 col-md-2">
						            <input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="주소 검색">
						        </div>
						    </div>
	                        <div class="mb-2 col-md-8">
								<input type="text" class="form-control" id="sample6_address" placeholder="주소"><br>
							</div>
							<div class="mb-2 col-md-6">
								<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소"><br>
								<input type="text"class="form-control" id="sample6_extraAddress" placeholder="참고항목">
							</div>
                          </div>
                          
                          
                           
                           <!-- mem_pw -->
                           <div class="mb-2 col-md-4">
	                          <div class="form-password-toggle">
	                        	<label class="form-label" for="basic-default-password1">비밀번호</label>
	                       		<div class="input-group">
	                       		<span class="ps_box int_pass"></span>
	                          	<input type="password"	class="form-control" name="mem_pw" id="basic-default-password1" maxlength="20"	aria-describedby="basic-default-password1"/>
		                          <span id="basic-default-password1" class="input-group-text cursor-pointer"
		                            ><i class="bx bx-hide"></i
		                          ></span>
		                          <span id="pswd1Msg" style="display: none" aria-live="assertice">8~20자의 영대,소문자, 숫자, 특수기호를 사용하여 만들어주세요.</span>
	                       		</div>
	                       	  </div>
                       	 
	                        <div class="form-password-toggle">
		                        <label class="form-label" for="basic-default-password2">비밀번호 재확인</label>
		                        <div class="input-group">
		                        <span class="ps_box int_pass"></span>
		                          <input type="password" class="form-control" name="mem_pw_check" id="basic-default-password2" maxlength="20" aria-describedby="basic-default-password2" width="200px;"/>
		                          <span id="basic-default-password2" class="input-group-text cursor-pointer"
		                            ><i class="bx bx-hide"></i
		                          ></span>
		                        </div>
		                         <span id="pswd2Msg1"  aria-live="assertice" style="display: none; font-size: 10px;  margin-left: 10px; color: green; font-weight: bold; width: 140px;">비밀번호가 일치합니다.</span>
			                     <span id="pswd2Msg2"  aria-live="assertice" style="display: none; font-size: 10px;   margin-left: 10px; color: red; font-weight: bold; width: 170px;">비밀번호가 일치하지 않습니다.</span>
		                      </div>
	                      </div>
	                      
                        </div>
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2">Update</button>
                          <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                        </div>
                    </div>
                    <!-- /Account -->
                    </form>
                  </div>
                </div>
              </div>
            <!-- / Content -->
		
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	//이메일 도메인 유효성 검사 //create 버튼 클릭시 체크 할 메소드 추가 예정
	$(document).ready(function(){
		$('#mem_email2').on('change',function(){
			//이메일 값
			var email = $('#mem_email1').val() + '@' + $('#mem_email2').val();	
			//이메일 유효성 검사할 변수 생성
			var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
			if(!emailRegex.test(email)){
				alert('유효한 이메일 주소를 입력해주세요.');
				return false;
			}
			return true;
		});
	});
	
	//생년월일 input 숫자만 입력 가능하게 하는 함수
	$(document).ready(function(){
		$('#mem_bd').on('input',function(){
			//숫자 이외의 문자 제거
			var sanitizedValue = $(this).val().replace(/[^0-9]/g, '');
			$(this).val(sanitizedValue);
		});
	});
	
	//전화번호 input 숫자만 입력 가능하게 하는 함수
	$(document).ready(function(){
		$('#mem_phone').on('input',function(){
			var sanitizedValue = $(this).val().replace(/[^0-9]/g,'');
			$(this).val(sanitizedValue);
		});
	});
	
	$(document).ready(function(){
		$('#mem_dept_md').on('change',function(){
			var selected = $(this).val();
			$('#mem_dept').val(selected);
		});
	});
	
	$(document).ready(function(){
		$('#mem_posi_md').on('change',function(){
			var selected = $(this).val();
			$('#mem_posi').val(selected);
		});
	});
	
	$(document).ready(function(){
		$('#mem_duty_md').on('change',function(){
			var selected = $(this).val();
			$('#mem_duty').val(selected);
		});
	});
	
	//비밀번호 재확인 문구1
	$(document).ready(function(){
		$('#basic-default-password2').on('change',function(){
			var pw1 = $('#basic-default-password1').val();
			var pw2 = $('#basic-default-password2').val();
			
			if(isNaN(pw1) || pw1 != null){
				if(pw1 == pw2){
					$('#pswd2Msg1').css('display','block');
					$('#pswd2Msg2').css('display','none');
				} else {
					$('#pswd2Msg1').css('display','none');
					$('#pswd2Msg2').css('display','block');
				}
			} else {
			return false;
			}			
		});
	});
	
	//비밀번호 재확인 문구2
	$(document).ready(function(){
		$('#basic-default-password1').on('change',function(){
			var pw1 = $('#basic-default-password1').val();
			var pw2 = $('#basic-default-password2').val();
				
			if(isNaN(pw2) || pw2 != null){
				if(pw1 == pw2){
					$('#pswd2Msg1').css('display','block');
					$('#pswd2Msg2').css('display','none');
				} else {
					$('#pswd2Msg1').css('display','none');
					$('#pswd2Msg2').css('display','block');
				}
			} else {
			return false;
			}			
		});
	});
</script>
</body>
</html>
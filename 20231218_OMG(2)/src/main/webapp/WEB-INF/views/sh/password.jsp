<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="js/jquery.js"></script>
<script type="text/javascript">
//비밀번호1 체크 함수 시행
function checkPswd1() {
​​​​
​​​​if(pwFlag) return true;
​​​​
​​​​var id = $("#id").val();
​​​​var pw = $("#pswd1").val();
​​​​var oImg = $("#pswd1Img");
​​​​var oSpan = $("#pswd1Span");
​​​​var oMsg = $("#pswd1Msg");
​​​​var oInput = $("#pswd1");
​​​​
​​​​//============ [pwd1 필수입력] ============
​​​​if (pw == "") { //공백제한
​​​​​​​​showErrorMsg(oMsg,"필수 정보입니다.");
​​​​​​​​setFocusToInputObject(oInput); //유효성 검증을 하고 전송 플래그를 조절한다.
​​​​​​​​return false;
​​​​}
​​​​
​​​​//============ [pwd1 기본 유효성검사] ============
​​​​if (isValidPasswd(pw) != true) { //유효성검사
​​​​​​​​showPasswd1ImgByStep(oImg, oSpan, 1); //비밀번호 괜찮은지 오른쪽 자물쇠 이미지
​​​​​​​​showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
​​​​​​​​setFocusToInputObject(oInput); //유효성 검증을 하고 전송 플래그를 조절한다.
​​​​​​​​return false;
​​​​}else if(checkpswd1_sameNum(pw) == true){ //비밀번호 연속동일숫자가 맞으면
​​​​​​​​showPasswd1ImgByStep(oImg, oSpan, 2); //비밀번호 괜찮은지 오른쪽 자물쇠 이미지
​​​​​​​​showErrorMsg(oMsg,"보안상 연속된 숫자는 제한합니다.");
​​​​​​​​setFocusToInputObject(oInput); //유효성 검증을 하고 전송 플래그를 조절한다.
​​​​​​​​return false;
​​​​}
출처: https://heannim-world.tistory.com/118 [히앤님의 개발 세상:티스토리]
​​​​​​​​
​​​​​​​​// 추가) ajax 통신으로 컨트롤러단에서 비밀번호 유효성검사하기!(post 방식)
​​​​​​​​pwFlag = false; //검사 flag
​​​​let userPwd = $('input[name=MEMBER_PW]').val(); // input_id에 입력되는 값
​​​​console.log("입력한 Pwd값 : " + userPwd);
​​​​
​​​​$.ajax({
​​​​​​​​url: "pwdCheck",
​​​​​​​​type: "post",
​​​​​​​​data: {
​​​​​​​​​​​​userPwd: userPwd
​​​​​​​​},
​​​​​​​​dataType: 'json',
​​​​​​​​success: function (result) {
​​​​​​​​​​​​//===========================================
​​​​​​​​​​​​//왜 굳이 컨트롤러로 보내나? 이유는 보안상의 이유.
​​​​​​​​​​​​// 백단에서 1004 이런거 안되게 한다던지 등 비밀번호 검증 쿼리가 있을듯.
​​​​​​​​​​​​//https://lky1.tistory.com/17 정규식 참고함
​​​​​​​​​​​​if (result == 1) { //사용불가
​​​​​​​​​​​​​​​​showPasswd1ImgByStep(oImg, oSpan, 1); //비밀번호 괜찮은지 오른쪽 자물쇠 이미지
​​​​​​​​​​​​​​​​showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
​​​​​​​​​​​​​​​​setFocusToInputObject(oInput);//유효성 검증을 하고 전송 플래그를 조절한다.
​​​​​​​​​​​​​​​​return false;
​​​​​​​​​​​​} else if (result == 2) { //위험
​​​​​​​​​​​​​​​​showPasswd1ImgByStep(oImg, oSpan, 2);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
​​​​​​​​​​​​​​​​showErrorMsg(oMsg,"보안상 특정문구 및 숫자는 사용불가합니다.(1004, 8282, iloveyou, abc123 등)");
​​​​​​​​​​​​​​​​setFocusToInputObject(oInput);
​​​​​​​​​​​​} else if (result == 3) { //보통
​​​​​​​​​​​​​​​​showPasswd1ImgByStep(oImg, oSpan, 3);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
​​​​​​​​​​​​​​​​showErrorMsg(oMsg,"영문자, 숫자, 특수문자 2가지 이상 섞어서 사용하세요.");
​​​​​​​​​​​​​​​​setFocusToInputObject(oInput);
​​​​​​​​​​​​} else if (result == 4) { //안전
​​​​​​​​​​​​​​​​showPasswd1ImgByStep(oImg, oSpan, 4);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
​​​​​​​​​​​​​​​​oMsg.hide();
​​​​​​​​​​​​} else { //빈 자물쇠
​​​​​​​​​​​​​​​​showPasswd1ImgByStep(oImg, oSpan, 0);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
​​​​​​​​​​​​​​​​oMsg.hide();
​​​​​​​​​​​​}
​​​​​​​​​​​​pwFlag = true; //비밀번호 플래그 1로 바꿔준다.
​​​​​​​​​​​​
​​​​​​​​​​​​//===========================================
​​​​​​​​},
​​​​​​​​error: function () {
​​​​​​​​​​​​alert("서버요청실패");
​​​​​​​​}
​​​​})
​​​​
​​​​return true;
​​​​
} //function checkPswd1() { 끝
출처: https://heannim-world.tistory.com/118 [히앤님의 개발 세상:티스토리]

	//============ [pwd1 패스워드 검증] ============
	function isValidPasswd(str) {
	​​​​console.log("입력한 Pwd값 검증1 : " + str);
	​​​​if (str == "") {
	​​​​​​​​return false;
	​​​​}
	​​​​
	​​​​// 공백 걸러내기
	​​​​var retVal = checkSpace(str);
	​​​​if (retVal) {
	​​​​​​​​return false;
	​​​​}
	​​​​
	​​​​// 8자리 미만 불가
	​​​​if (str.length < 8) {
	​​​​​​​​return false;
	​​​​}
	​​​​
	​​​​//8~12자의 영문 소문자, 숫자, 특수문자만 사용 가능
	​​​​var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
	​​​​if (!isPW.test(str)) {
	​​​​​​​​return false;
	​​​​}
	​​​​
	​​​​return true;
	}
	출처: https://heannim-world.tistory.com/118 [히앤님의 개발 세상:티스토리]
	
	//  연속된 숫자 불가
		function checkpswd1_sameNum(str){
		​​​​
		​​​​
		​​​​var cnt = 0;
		​​​​//연속된 숫자 불가
		​​​​for (var i = 0; i < str.length; ++i) {
		​​​​​​​​if (str.charAt(0) == str.substring(i, i + 1))
		​​​​​​​​​​​​++cnt;
		​​​​}
		​​​​if (cnt == str.length) {
		​​​​​​​​console.log("연속된 숫자");
		​​​​​​​​console.log("입력한 Pwd값 검증2 : " + str);
		​​​​​​​​return true;
		​​​​}
		}
		출처: https://heannim-world.tistory.com/118 [히앤님의 개발 세상:티스토리]
</script>
<body>
<div class="join_row">
​​​​<h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
​​​​<span class="ps_box int_pass" id="pswd1Img">
​​​​​​​​<input type="password" id="pswd1" name="MEMBER_PW" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
​​​​​​​​<span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
​​​​</span>
​​​​<span class="error_next_box" id="pswd1Msg" style="display:none" aria-live="assertive">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>
​​​​
​​​​<h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
​​​​<span class="ps_box int_pass_check" id="pswd2Img">
​​​​​​​​<input type="password" id="pswd2" name="MEMBER_PW_cfm" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
​​​​​​​​<span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
​​​​</span>
​​​​<span class="error_next_box" id="pswd2Msg" style="display:none" aria-live="assertive"></span>
</div>
출처: https://heannim-world.tistory.com/118 [히앤님의 개발 세상:티스토리]
</body>
</html>
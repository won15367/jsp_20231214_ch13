/**
 * 
 */

  function checklogin() {
	if(document.loginForm.adminID.value.length < 4 || document.loginForm.adminID.value.length > 15) {
		alert("아이디는 4~15자 사이로 입력해주세요.");
		return false;
	}
	
	if(document.loginForm.adminPW.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	return true;
	
}
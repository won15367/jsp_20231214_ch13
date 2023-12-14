<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/login.js"></script>
<title>관리자 로그인</title>
</head>
<body>
	<form action="loginSuccess.jsp" name="loginForm" onsubmit="return checklogin()">
		아이디 : <input type="text" name="adminID"><br>
		비밀번호 : <input type="password" name="adminPW">
		<input type="submit" value="로그인">
	</form>
</body>
</html>
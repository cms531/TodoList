<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CreatePage</title>
</head>
<body>
	<form action="createAccount" method="post">
	<fieldset>
		<legend><h2>회원가입</h2></legend>
		<label>아이디 : <input type="text" name="userId" > </label>
		<input type="button" value="중복확인" > <br>
		<label>비밀번호 : <input type="text" name="userPw" > </label><br>
		<label>이름 : <input type="text" name="userName" >  </label><br>
		<input type="submit" value="가입" >
	</fieldset>
	</form>

</body>
</html>
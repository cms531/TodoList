<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>LoginPage</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="loginUser" method="post" autocomplete="off">
		<fieldset>
			<legend>로그인</legend>
			<label>아이디 : <input type="text" name="userId" maxlength="15" required> </label><br>
			<label>비밀번호 : <input type="password" name="userPw" maxlength="20" required > </label><br>
			&nbsp;&nbsp;&nbsp; <input type="submit" value="로그인" >
			&nbsp;&nbsp;&nbsp; ${message}
		</fieldset>
	</form>
	
	<form action="moveCreate" method="get">
	<input type="submit" value="회원가입" >
	</form>
	
	<form action="moveSearch" method="get">
	<input type="submit" value="비밀번호 찾기" >
	</form>
</body>
</html>

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
			<label>아이디 : <input type="text" name="userId" > </label>
			<input type="button" value="중복확인"> <br>
			<label>비밀번호 : <input type="text" name="userPw" > </label><br>
			&nbsp;&nbsp;&nbsp; <input type="submit" value="로그인" >
			${message}
		</fieldset>
	</form>
	
	<form action="moveCreate" method="get">
	<input type="submit" value="회원가입" >
	</form>
	
	<form action="moveSearchAccount" method="get">
	<input type="submit" value="아이디 찾기" >
	</form>
</body>
</html>

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
		<legend><h2>ȸ������</h2></legend>
		<label>���̵� : <input type="text" name="userId" > </label>
		<input type="button" value="�ߺ�Ȯ��" > <br>
		<label>��й�ȣ : <input type="text" name="userPw" > </label><br>
		<label>�̸� : <input type="text" name="userName" >  </label><br>
		<input type="submit" value="����" >
	</fieldset>
	</form>

</body>
</html>